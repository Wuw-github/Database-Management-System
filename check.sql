--Wu Wei (wuw4)
--CS1555 Term Project

--1. create user
    insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'to_delete', 'to_delete', 3, to_date('13-AUG-04','DD-MON-RR'));
--2. drop user
    delete from USER_ACCOUNT where USER_ID = 6;
--3. create event
    insert into event values (event_seq.nextval, 2, 8, 'F', to_date('13-AUG-04','DD-MON-RR'));
--4. add event outcome
    insert into SCOREBOARD values (4, 12, 48, 52, 4, null);
--5. create team
    insert into team values (48, 4, '2016 tennis 4', 38, 4, 500);
--6. register team
    insert into EVENT_PARTICIPATION values(12, 48, 'E');
--7. add participant
    insert into PARTICIPANT values (500, 'Coach', 'Coach', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
--8. add team member
    insert into TEAM_MEMBER values (48, 52);
--9. drop team member
    delete from PARTICIPANT where PARTICIPANT_ID = 1;
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
--13. country ranking

--14. top k Athletes

--15. connected athletes

--16. log out