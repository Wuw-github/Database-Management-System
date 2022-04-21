--Wu Wei (wuw4)
--CS1555 Term Project

--SET SERVEROUTPUT ON;
--1. create user
begin
    insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'to_delete', 'to_delete', 3, to_date('13-AUG-04','DD-MON-RR'));
end;
/
commit;
select * from USER_ACCOUNT where USERNAME = 'to_delete';

--2. drop user
begin
    delete from USER_ACCOUNT where USER_ID = 7;
end;
/
commit;
select * from USER_ACCOUNT where USERNAME = 'to_delete';

--3. create event
begin
    insert into event values (event_seq.nextval, 2, 8, 'F', to_date('13-AUG-04','DD-MON-RR'));
end;
/
commit;
select * from event where SPORT_ID = 2 and VENUE_ID = 8;

--5. create team
begin
    insert into team values (TEAM_SEQ.nextval, 4, '2016 tennis 1', 19, 4, 500);
end;
/
commit;
select * from team where TEAM_NAME = '2016 tennis 1';

--6. register team
begin
    insert into EVENT_PARTICIPATION values(11, 45, 'E');
end;
/
commit;
select * from EVENT_PARTICIPATION where EVENT_ID = 11 and TEAM_ID = 45;

--7. add participant
begin
    insert into PARTICIPANT values (part_seq.nextval, '53', '53', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
end;
/
commit;
select * from PARTICIPANT where fname = '53' and lname = '53';

--8. add team member
begin
    insert into TEAM_MEMBER values (45, 45);
end;
/
commit;
select * from TEAM_MEMBER where TEAM_ID = 45 and PARTICIPANT_ID = 45;

--4. add event outcome
begin
    insert into SCOREBOARD values (4, 11, 45, 45, 1, null);
end;
/
commit;
select * from SCOREBOARD where OLYMPIC_ID = 4 and EVENT_ID = 11 and TEAM_ID = 45;

--9. drop team member
begin
    delete from PARTICIPANT where PARTICIPANT_ID = 53;
end;
/
commit;
select * from PARTICIPANT where PARTICIPANT_ID = 53;

--10. login
    select * from USER_ACCOUNT where username = 'Guest' and PASSKEY = 'GUEST';
--11. display sport
    declare
        type ret_record is record(
            first_appears integer,
            event_year integer,
            gender char,
            athlete varchar2(60),
            country varchar2(20),
            medal varchar2(20)
            );
        a ret_record;
        ret sys_refcursor;
    begin
        DISPLAY_SPORT('100m-dash', ret);
        loop
            fetch ret into a;
            exit when ret%notfound;
            DBMS_OUTPUT.PUT_LINE('Year added: '||a.first_appears||' Event Year: '|| a.event_year||' gender: '||a.gender||' name: '|| a.athlete||' Country: '||a.country||' Medal: '||a.medal);
        end loop;
    end;
    /
--12. display event
    declare
        type ret_record is record(
            city varchar2(20),
            event_year integer,
            sport varchar2(20),
            athlete varchar2(60),
            position integer,
            medal varchar2(20)
        );
        a ret_record;
        ret sys_refcursor;
    begin
        DISPLAY_EVENT(1, ret);
        loop
            fetch ret into a;
            exit when ret%notfound;
            DBMS_OUTPUT.PUT_LINE(a.city||' '||a.event_year||' '|| a.sport || ' ' || a.athlete || ' '|| a.position || ' '|| a.medal);
        end loop;
    end;
--13. country ranking
    declare
        type ret_record is record(
            country varchar2(5),
            first_year integer,
            gold integer,
            silver integer,
            bronze integer,
            rank integer
        );
        a ret_record;
        ret sys_refcursor;
    begin
        COUNTRYRANKING(1, ret);
        loop
            fetch ret into a;
            exit when ret%notfound;
            DBMS_OUTPUT.PUT_LINE(a.country ||' '||a.first_year||' gold: '||a.gold||' silver: '||a.silver||' bronze: '||a.bronze||' rank: '||a.rank);
        end loop;
    end;
--14. top k Athletes
    declare
        type ret_record is record(
            athlete varchar2(60),
            gold integer,
            silver integer,
            bronze integer,
            rank integer
        );
        a ret_record;
        ret sys_refcursor;
    begin
        TOPKATHLETES(1, ret);
        loop
            fetch ret into a;
            exit when ret%notfound;
            DBMS_OUTPUT.PUT_LINE(a.athlete||' gold: '||a.gold||' silver: '||a.silver||' bronze: '||a.bronze||' rank: '||a.rank);
        end loop;
    end;
--15. connected athletes
    --for this method, RETRIEVE_ATHLETES is a procedure that returns the athlete_id that competed with the given participant_id.
    -- the main structure of this method is in Java file that keeps tracking the participant_id and the hop and parse in the participant_id to find following connected athletes.
    declare
        type ret_record is record(
            part_id integer
        );
        type name_record is record(
            athlete varchar2(60)
        );
        a ret_record;
        name name_record;
        ret sys_refcursor;
        ret_name sys_refcursor;
    begin
        RETRIEVE_ATHLETES(1, 1, ret);
        loop
            fetch ret into a;
            exit when ret%notfound;
            FIND_ATHLETES(a.part_id, ret_name);
            fetch ret_name into name;
            DBMS_OUTPUT.PUT_LINE(name.athlete||' competed with participant 1');
            close ret_name;
        end loop;
        close ret;
    end;
    /
--16. log out
begin
    update USER_ACCOUNT set last_login = current_timestamp where user_id = 1;
end;
/
commit;
select * from USER_ACCOUNT where USER_ID = 1;