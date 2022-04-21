--Wu Wei (wuw4)
--CS1555 term project

--Phase 1
drop table USER_ACCOUNT cascade constraints;
drop table USER_ROLE cascade constraints;
drop table OLYMPICS cascade constraints;
drop table SPORT cascade constraints;
drop table PARTICIPANT cascade constraints;
drop table COUNTRY cascade constraints;
drop table TEAM cascade constraints;
drop table TEAM_MEMBER cascade constraints;
drop table medal cascade constraints;
drop table SCOREBOARD cascade constraints;
drop table VENUE cascade constraints;
drop table EVENT cascade constraints;
drop table EVENT_PARTICIPATION cascade constraints;

create table USER_ROLE(
    role_id     integer,
    role_name   varchar2(20) not null,
    constraint user_role_pk primary key (role_id),
    constraint user_role_ak unique (role_name),
    constraint role_check check (role_name in ('Organizer', 'Coach', 'Guest'))
);

create table USER_ACCOUNT(
    user_id     integer not null,
    username    varchar2(20) not null,
    passkey     varchar2(20) not null,
    role_id     integer not null,
    last_login  date not null,
    constraint user_account_fk foreign key (role_id) references USER_ROLE(role_id),
    constraint user_account_pk primary key (user_id),
    constraint user_account_ak unique (username)
);

drop sequence account_seq;
create sequence account_seq
    start with 1
    increment by 1
    nocache;
--need a trigger to set password to 'GUEST'

create table OLYMPICS(
    olympic_id  integer,
    olympic_num varchar2(30) not null,
    host_city   varchar2(30) not null,
    opening_date    date not null,
    closing_date    date not null,
    official_website    varchar2(50) not null,
    constraint olympic_pk primary key (olympic_id),
    constraint olympic_ak unique (olympic_num)
);

drop sequence olym_seq;
create sequence olym_seq
    start with 1
    increment by 1
    nocache;

create table SPORT(
    sport_id    integer,
    sport_name  varchar2(30) not null,
    description varchar2(80),
    dob         date not null,
    team_size   integer not null,
    constraint sport_pk primary key (sport_id),
    constraint sport_ak unique (sport_name),
    constraint sport_check check (team_size > 0)
);

drop sequence sport_seq;
create sequence sport_seq
    start with 1
    increment by 1
    nocache;

create table COUNTRY(
    country_id  integer,
    country     varchar2(20) not null,
    country_code    varchar2(3) not null,
    constraint country_pk primary key (country_id),
    constraint country_ak1 unique (country),
    constraint country_ak2 unique (country_code)
);

drop sequence country_seq;
create sequence country_seq
    start with 1
    increment by 1
    nocache;

create table PARTICIPANT(
    participant_id  integer,
    fname           varchar2(30) not null,
    lname           varchar2(30) not null,
    nationality     varchar2(20) not null,
    birth_place     varchar2(40) not null,
    dob             date not null,
    constraint participant_pk primary key (participant_id),
    constraint participant_fk  foreign key (nationality) references COUNTRY (country)
);

drop sequence part_seq;
create sequence part_seq
    start with 1
    increment by 1
    nocache;



create table TEAM(
    team_id     integer,
    olympic_id integer not null,
    team_name   varchar2(50) not null,
    country_id  integer not null,
    sport_id    integer not null,
    coach_id    integer not null,
    constraint team_pk primary key (team_id),
    constraint team_fk4 foreign key (olympic_id) references OLYMPICS(olympic_id),
    constraint team_fk1 foreign key (country_id) references COUNTRY(country_id),
    constraint team_fk2 foreign key (sport_id) references SPORT(sport_id),
    constraint team_fk3 foreign key (coach_id) references PARTICIPANT(participant_id)
);

drop sequence team_seq;
create sequence team_seq
    start with 1
    increment by 1
    nocache;

create table TEAM_MEMBER(
    team_id     integer,
    participant_id  integer,
    constraint team_member_pk primary key (team_id, participant_id),
    constraint team_member_fk1 foreign key (team_id) references TEAM(team_id),
    constraint team_member_fk2 foreign key (participant_id) references PARTICIPANT(participant_id)
);


create table MEDAL(
    medal_id    integer,
    medal_title varchar2(6) not null,
    points      integer not null,
    constraint medal_pk primary key (medal_id),
    constraint medal_ak1 unique (medal_title),
    constraint medal_check check (medal_title in ('gold', 'silver', 'bronze'))
);

create table VENUE(
    venue_id    integer,
    olympic_id integer not null,
    venue_name  varchar2(30) not null,
    capacity    integer not null,
    constraint venue_pk primary key (venue_id),
    constraint venue_fk foreign key (olympic_id) references OLYMPICS(olympic_id),
    constraint venue_check check (capacity > 0)
);

drop sequence venue_seq;
create sequence venue_seq
    start with 1
    increment by 1
    nocache;

create table EVENT(
    event_id    integer,
    sport_id    integer not null,
    venue_id    integer not null,
    gender      char not null,
    event_time  date not null,
    constraint event_pk primary key (event_id),
    constraint event_fk1 foreign key (sport_id) references SPORT(sport_id),
    constraint event_fk2 foreign key (venue_id) references VENUE(venue_id),
    constraint event_check check (gender in ('M', 'F'))
);
drop sequence event_seq;
create sequence event_seq
    start with 1
    increment by 1
    nocache;

create table EVENT_PARTICIPATION(
    event_id    integer,
    team_id     integer,
    status      char not null,
    constraint event_par_pk primary key (event_id, team_id),
    constraint event_par_fk1 foreign key (event_id) references EVENT(event_id),
    constraint event_par_fk2 foreign key (team_id) references TEAM(team_id),
    constraint event_par_check check (status in ('E', 'N'))
);

create table SCOREBOARD(
    olympic_id integer not null,
    event_id    integer not null,
    team_id     integer not null,
    participant_id  integer not null,
    position    integer not null,
    medal_id    integer,
    constraint scoreboard_pk primary key (event_id, team_id, participant_id),
    constraint scoreboard_fk1 foreign key (event_id) references event(event_id),
    constraint scoreboard_fk2 foreign key (olympic_id) references OLYMPICS(olympic_id),
    constraint scoreboard_fk3 foreign key (medal_id) references MEDAL(medal_id),
    constraint scoreboard_fk4 foreign key (participant_id) references PARTICIPANT(participant_id),
    constraint scoreboard_fk5 foreign key (team_id) references TEAM(team_id)
);

commit;
