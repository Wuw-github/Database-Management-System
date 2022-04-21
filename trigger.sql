--Wu Wei (wuw4)
--CS1555 Term Project

--ASSIGN MEDAL: This trigger is responsible to assign the appropriate medal based
--              on the position when new records are inserted or updated in the SCOREBOARD.
create or replace trigger ASSIGN_MEDAL
before insert or update on SCOREBOARD
for each row
when (new.position <= 3)
begin
        select MEDAL.MEDAL_ID into :new.MEDAL_ID from medal where MEDAL.MEDAL_ID = :new.position;
end;
/

--ATHLETE DISMISSAL: This trigger is responsible for deleting all the data of an athlete who was
-- dismissed because of a violation. If the athlete is a member of a team sport, then the team is
-- also dismissed by setting the status not eligible (n) in participating in any event. If the athlete
-- participates in an atomic sport, then the corresponding teams are removed from the events.
create or replace trigger ATHLETE_DISMISSAL
before delete on PARTICIPANT
for each row
declare
    CURSOR temp is
        select TEAM_ID from TEAM_MEMBER
        where PARTICIPANT_ID = :old.participant_id;
begin
    --open temp;
    for a in temp
    loop
      DELETE_TEAM(a.TEAM_ID, :old.participant_id);
    end loop;
    --close temp;
end;
/

create or replace procedure DELETE_TEAM(teamid in integer, part_id in integer)
IS
    team_count integer;
begin
        team_count := COUNT_TEAM_MEMBER (teamid);
        --delete from TEAM_MEMBER where TEAM_ID = teamid and PARTICIPANT_ID = part_id;

        if team_count = 1 then
            delete from TEAM_MEMBER where TEAM_ID = teamid and PARTICIPANT_ID = part_id;
            for a in (select event_id from EVENT_PARTICIPATION where TEAM_ID = teamid)
            loop
                delete from  SCOREBOARD where EVENT_ID = a.EVENT_ID and PARTICIPANT_ID = part_id;
            end loop;
            delete from EVENT_PARTICIPATION where TEAM_ID = teamid;
            delete from team where TEAM_ID = teamid;
            --update EVENT_PARTICIPATION set status = 'N' where TEAM_ID = teamid;
        else
            update EVENT_PARTICIPATION set status = 'N' where TEAM_ID = teamid;
            for a in (select event_id from EVENT_PARTICIPATION where TEAM_ID = teamid)
            loop
                delete from  SCOREBOARD where EVENT_ID = a.EVENT_ID and PARTICIPANT_ID = part_id;
            end loop;
            delete from TEAM_MEMBER where TEAM_ID = teamid and PARTICIPANT_ID = part_id;
        end if;
end;
/


create or replace function COUNT_TEAM_MEMBER(teamid integer) return integer
IS
    team_count integer;
    begin
        select count(*) into team_count
        from TEAM_MEMBER
        where TEAM_ID = teamid;
        return team_count;
    end;
/

--ENFORCE CAPACITY: This trigger should check the maximum possible venue capacity before the event
-- is associated with it. In case the capacity is exceeded, an exception should be thrown.
create or replace trigger ENFORCE_CAPACITY
before insert on EVENT
for each row
declare
    CAPACITY_OUT_RANGE exception;
    max_capacity integer;
    current_event integer;
begin
    current_event := COUNT_EVENT(:new.venue_id, :new.EVENT_TIME);
    select capacity into max_capacity
    from VENUE
    where VENUE_ID = :new.venue_id;
    if current_event >= max_capacity then
        raise CAPACITY_OUT_RANGE;
    end if;
end;
/

create or replace function COUNT_EVENT(venue integer, time date) return integer
IS
    current_event integer;
    begin
        select count(*) into current_event
        from EVENT
        where VENUE_ID = venue and extract(year from event_time) = extract(year from time)
            and extract(month from EVENT_TIME) = extract(month from time)
            and extract(day from EVENT_TIME) = extract(day from time);
        return current_event;
    end;
/

create or replace trigger RENEW_ELIGIBILITY
before insert on TEAM_MEMBER
for each row
declare
    teamsize integer;
    curr_size integer;
begin
    for a in (select * from EVENT_PARTICIPATION where EVENT_PARTICIPATION.TEAM_ID = :new.team_id and status = 'N')
    loop
       select team_size into teamsize
        from sport s join (select * from event where EVENT_ID = a.event_id) t on s.SPORT_ID = t.SPORT_ID;
        curr_size := COUNT_TEAM_MEMBER(:new.TEAM_ID);
       if curr_size >= (teamsize-1) then
            update EVENT_PARTICIPATION set status = 'E'
            where TEAM_ID = a.team_id and EVENT_ID = a.EVENT_ID;
        else
            update EVENT_PARTICIPATION set status = 'N'
            where TEAM_ID = a.team_id and EVENT_ID = a.EVENT_ID;
        end if;
    end loop;
end;
/

create or replace trigger CHECK_ELIGIBILITY
before insert on EVENT_PARTICIPATION
for each row
declare
    teamsize integer;
    curr_size integer;
begin
    select team_size into teamsize
    from sport s join (select * from event where EVENT_ID = :new.event_id) t on s.SPORT_ID = t.SPORT_ID;
    select count(*) into curr_size
    from TEAM_MEMBER where TEAM_MEMBER.TEAM_ID = :new.team_id;
    if curr_size >= teamsize then
        :new.status := 'E';
    else
        :new.status := 'N';
    end if;
end;
/

--Given a sport name, it displays the Olympic year it was added, events of that sport, gender, the medals winners and their countries.
-- (athletes who got medals should be displayed first according to medals i.e., gold, silver and bronze and sorted on the Olympic year).
create or replace procedure display_sport(sportname in varchar2, ccc out sys_refcursor)
as
begin
    open ccc for
        select extract(year from s.dob) as first_appears, extract(year from O.OPENING_DATE) as event_year, gender, fname || ' ' || lname as athlete, country.COUNTRY,
           case when MEDAL_ID = 1 then 'gold'
            when MEDAL_ID = 2 then 'silver'
            when MEDAL_ID = 3 then 'bronze'
            end as medal
        from ((select dob, sport_id from sport where sport_name = sportname) s
            join event on s.SPORT_ID = event.SPORT_ID
            join SCOREBOARD sc on event.EVENT_ID = sc.EVENT_ID
            join participant p on sc.PARTICIPANT_ID = p.PARTICIPANT_ID
            join team on sc.TEAM_ID = TEAM.TEAM_ID
            join COUNTRY on team.COUNTRY_ID = country.COUNTRY_ID
            join OLYMPICS O on sc.OLYMPIC_ID = O.OLYMPIC_ID)
        where MEDAL_ID is not null
    order by MEDAL_ID asc, event_year asc;
end;
/

--Given an Olympic game (City, Year) and an event id, display the Olympic game, event name, participant and the position along with the earned medal.
create or replace procedure display_event(event in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select HOST_CITY as city, extract(year from O.OPENING_DATE) as event_year, sport_name as game, fname || ' '|| lname as athelete, position,
           case when MEDAL_ID = 1 then 'gold'
            when MEDAL_ID = 2 then 'silver'
            when MEDAL_ID = 3 then 'bronze'
            end as medal
    from(
        (select sport_id, event_id from EVENT where event_id = event) e
        join sport s on e.sport_id = s.SPORT_ID
        join SCOREBOARD sc on sc.EVENT_ID = event
        join PARTICIPANT p on sc.PARTICIPANT_ID = p.PARTICIPANT_ID
        join OLYMPICS O on sc.OLYMPIC_ID = O.OLYMPIC_ID)
    order by position asc;
end;
/

---Given an olympic id, display all the participating countries (country abbreviation), the first year the country participated
-- in the Olympics along with the number of gold, silver and bronze medals and their ranking sorted in descending order. The rank is computed
-- based on the points associated with each metal.
create or replace procedure countryRanking(olym in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select COUNTRY_CODE, FIRST_YEAR, GOLD_MEDAL, SILVER_MEDAL, BRONZE_MEDAL, RANK
    from (select country_id, FIRST_YEAR, GOLD_MEDAL, SILVER_MEDAL, BRONZE_MEDAL,
        (1 + (select count(*) from (select * from before_rank where Olympic_id = olym) br2 where br2.points > br1.points)) as rank
        from (select * from before_rank where Olympic_id = olym) br1) natural join country
    where COUNTRY_ID in (select country_id from team where OLYMPIC_ID = olym)
    order by rank asc;
end;
/

create or replace procedure topkAthletes(olym in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select fname||' '||lname as athlete, gold, silver, bronze,
        (1 + (select count(*) from (select * from athlete_before_rank where OLYMPIC_ID = olym) ar2 where ar2.point > ar1.point)) as rank
    from (select * from athlete_before_rank where OLYMPIC_ID = olym) ar1 natural join PARTICIPANT
    order by rank asc;
end;
/

create or replace procedure find_athlete(part_id in integer, olym in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select fname ||' '|| lname as fullname
    from SCOREBOARD sc join PARTICIPANT p on sc.PARTICIPANT_ID = p.PARTICIPANT_ID
    where sc.PARTICIPANT_ID = part_id and OLYMPIC_ID = olym;
end;
/

create or replace procedure find_athletes(part_id in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select fname || ' ' || lname as fullname
    from PARTICIPANT where PARTICIPANT_ID = part_id;
end;
/

create or replace procedure retrieve_Athletes(part_id in integer, olym in integer, ccc out sys_refcursor)
as
begin
    open ccc for
    select PARTICIPANT_ID
    from SCOREBOARD
    where OLYMPIC_ID = olym and
          TEAM_ID not in (select tm.TEAM_ID from (select TEAM_ID from TEAM_MEMBER where PARTICIPANT_ID = part_id) tm
                                                join (select * from team where OLYMPIC_ID = olym) t on tm.TEAM_ID = t.TEAM_ID);
end;
/


--Create View section

--for countryRanking
create or replace view first_year as
select dc.COUNTRY_ID, min(year) as first_year
from (select distinct COUNTRY_ID from team) dc
    left join (select COUNTRY_ID, year from (select COUNTRY_ID, OLYMPIC_ID from team)t
    join (select olympic_id, extract(year from OPENING_DATE) as year from OLYMPICS) O on t.OLYMPIC_ID = O.OLYMPIC_ID) y on dc.COUNTRY_ID = y.COUNTRY_ID
group by dc.COUNTRY_ID;

create or replace view gold as
select c.COUNTRY_ID, sc.OLYMPIC_ID, count(distinct t.TEAM_ID) as gold_medal
from SCOREBOARD sc
    join team t on sc.TEAM_ID = t.TEAM_ID
    join COUNTRY c on c.COUNTRY_ID = t.COUNTRY_ID
where position = 1
group by c.COUNTRY_ID, sc.OLYMPIC_ID;

create or replace view silver as
select c.COUNTRY_ID, sc.OLYMPIC_ID, count(distinct t.TEAM_ID) as silver_medal
from SCOREBOARD sc
    join team t on sc.TEAM_ID = t.TEAM_ID
    join COUNTRY c on c.COUNTRY_ID = t.COUNTRY_ID
where position = 2
group by c.COUNTRY_ID, sc.OLYMPIC_ID;

create or replace view bronze as
select c.COUNTRY_ID, sc.OLYMPIC_ID, count(distinct t.TEAM_ID) as bronze_medal
from SCOREBOARD sc
    join team t on sc.TEAM_ID = t.TEAM_ID
    join COUNTRY c on c.COUNTRY_ID = t.COUNTRY_ID
where position = 3
group by c.COUNTRY_ID, sc.OLYMPIC_ID;

create or replace view before_rank as
    select COUNTRY_ID, Olympic_id, FIRST_YEAR, gold_medal, SILVER_MEDAL, BRONZE_MEDAL,
    (GOLD_MEDAL * (select points from medal where MEDAL_ID = 1) + SILVER_MEDAL * (select points from medal where MEDAL_ID = 2)+
    BRONZE_MEDAL * (select points from medal where MEDAL_ID = 3)) as points
    from (select COUNTRY_ID, OLYMPIC_ID, FIRST_YEAR, nvl(gold_medal, 0) as gold_medal, nvl(silver_medal, 0) as silver_medal, nvl(bronze_medal, 0) as bronze_medal
            from (select * from first_year, (select OLYMPIC_ID from OLYMPICS)) f
            natural left join gold
            natural left join silver
            natural left join bronze);

--for topkAthletes
create or replace view athlete_position as
select sc.PARTICIPANT_ID, position, OLYMPIC_ID
from    (select distinct PARTICIPANT_ID
        from (select TEAM_ID from team) t
            natural join TEAM_MEMBER) tm
            left join SCOREBOARD sc on tm.PARTICIPANT_ID = sc.PARTICIPANT_ID;

create or replace view athlete_gold as
select PARTICIPANT_ID, OLYMPIC_ID, count(*) as gold
from athlete_position
where position = 1
group by PARTICIPANT_ID, OLYMPIC_ID;

create or replace view athlete_silver as
select PARTICIPANT_ID, OLYMPIC_ID, count(*) as silver
from athlete_position
where position = 2
group by PARTICIPANT_ID, OLYMPIC_ID;

create or replace view athlete_bronze as
select PARTICIPANT_ID, OLYMPIC_ID, count(*) as bronze
from athlete_position
where position = 3
group by PARTICIPANT_ID, OLYMPIC_ID;

create or replace view athlete_before_rank as
select PARTICIPANT_ID, OLYMPIC_ID, gold, silver, bronze, (gold * (select points from medal where MEDAL_ID = 1) + silver * (select points from medal where MEDAL_ID = 2) +
       bronze * (select points from medal where MEDAL_ID = 3)) as point
from (select PARTICIPANT_ID, OLYMPIC_ID, nvl(gold, 0) as gold, nvl(silver, 0) as silver, nvl(bronze, 0) as bronze
        from athlete_position natural left join athlete_gold natural left join athlete_silver natural left join athlete_bronze);
