--Wu Wei (wuw4)
--CS1555 Term Project
--init file


---MEDAL TABLE
insert into MEDAL values (1, 'gold', 10);
insert into MEDAL values (2, 'silver', 5);
insert into MEDAL values (3, 'bronze', 4);
commit;
---USER_ROLE TABLE
insert into USER_ROLE values (1, 'Organizer');
insert into USER_ROLE values (2, 'Coach');
insert into USER_ROLE values (3, 'Guest');
---USER_ACCOUNT TABLE
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'AthensChair', 'Ginna', 1, to_date('13-AUG-04','DD-MON-RR'));
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'BeijingChair', 'Jintao', 1, to_date('13-AUG-04','DD-MON-RR'));
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'LondonChair', 'Sebastian', 1, to_date('13-AUG-04','DD-MON-RR'));
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'RioChair', 'Carlos', 1, to_date('13-AUG-04','DD-MON-RR'));
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'Coach', 'COACH', 2, to_date('13-AUG-04','DD-MON-RR'));
insert into USER_ACCOUNT values (ACCOUNT_SEQ.nextval, 'Guest', 'GUEST', 3, to_date('13-AUG-04','DD-MON-RR'));

---OLYMPICS TABLE
insert into OLYMPICS values (OLYM_SEQ.nextval, 'XXVIII', 'Athens', to_date('13-AUG-04','DD-MON-RR'), to_date('29-AUG-04','DD-MON-RR'), 'www.olympic.org/athens-2004');
insert into OLYMPICS values (OLYM_SEQ.nextval, 'XXIX', 'Beijing', to_date('8-AUG-08','DD-MON-RR'), to_date('24-AUG-08','DD-MON-RR'), 'www.olympic.org/beijing-2008');
insert into OLYMPICS values (OLYM_SEQ.nextval, 'XXX', 'London', to_date('27-JUL-12','DD-MON-RR'), to_date('12-AUG-12','DD-MON-RR'), 'www.olympic.org/london-2012');
insert into OLYMPICS values (OLYM_SEQ.nextval, 'XXXI', 'Rio', to_date('5-AUG-16','DD-MON-RR'), to_date('21-AUG-16','DD-MON-RR'), 'www.olympic.org/rio-2016');

---SPORT TABLE
insert into SPORT VALUES (sport_seq.nextval, 'swimming 400m-freestyle', null, to_date('5-AUG-1896','DD-MON-YYYY'), 1);
insert into SPORT VALUES (sport_seq.nextval, '100m-dash', null, to_date('5-MAY-1964','DD-MON-YYYY'), 1);
insert into SPORT VALUES (sport_seq.nextval, 'Badminton double', null, to_date('5-AUG-1992','DD-MON-YYYY'), 2);
insert into SPORT VALUES (sport_seq.nextval, 'tennis double', null, to_date('5-AUG-1896','DD-MON-YYYY'), 2);
insert into SPORT VALUES (sport_seq.nextval, 'swimming 200m-freestyle', null, to_date('5-AUG-1896','DD-MON-YYYY'), 1);

---COUNTRY TABLE
insert into COUNTRY values (1, 'China', 'CHN');
insert into COUNTRY values (2, 'America', 'USA');
insert into COUNTRY values (3, 'Australia', 'AUS');
insert into COUNTRY values (4, 'Korea', 'KOR');
insert into COUNTRY values (5, 'Italy', 'ITA');
insert into COUNTRY values (6, 'Japan', 'JPN');
insert into COUNTRY values (7, 'Georgia', 'GEO');
insert into COUNTRY values (8, 'Mongolia', 'MGL');
insert into COUNTRY values (9, 'Austria', 'AUT');
insert into COUNTRY values (10, 'Uzbekistan', 'UZB');
insert into COUNTRY values (11, 'Netherlands', 'NLD');
insert into COUNTRY values (12, 'Russia', 'RUS');
insert into COUNTRY values (13, 'Brazil', 'BRA');
insert into COUNTRY values (14, 'Kazakhstan', 'KAZ');
insert into COUNTRY values (15, 'Indonesia', 'INA');
insert into COUNTRY values (16, 'Denmark', 'DEN');
insert into COUNTRY values (17, 'Malaysia', 'MAS');
insert into COUNTRY values (18, 'Britain', 'GBR');
insert into COUNTRY values (19, 'Spain', 'ESP');
insert into COUNTRY values (20, 'Argentina', 'ARG');
insert into COUNTRY values (21, 'Czech Republic', 'CZE');
insert into COUNTRY values (22, 'Switzerland', 'CHE');
insert into COUNTRY values (23, 'Chile', 'CHI');
insert into COUNTRY values (24, 'Germany', 'GER');
insert into COUNTRY values (25, 'Croatia', 'CRO');
insert into COUNTRY values (26, 'Slovensko', 'SUI');
insert into COUNTRY values (27, 'France', 'FRA');
insert into COUNTRY values (28, 'Roumania', 'ROU');

insert into COUNTRY values (29, 'Portugal', 'PRT');
insert into COUNTRY values (30, 'Jamaica', 'JAM');
insert into COUNTRY values (31, 'Sain Kitts', 'KNA');
insert into COUNTRY values (32, 'Barbados', 'BRB');
insert into COUNTRY values (33, 'Ghana', 'GHA');
insert into COUNTRY values (34, 'Trinidad and Tobago', 'TTO');
insert into COUNTRY values (35, 'Netherlands Antilles', 'ANT');
insert into COUNTRY values (36, 'South Africa', 'ZAF');
insert into COUNTRY values (37, 'Ivory Coast', 'CIV');
insert into COUNTRY values (38, 'Canada', 'CAN');
insert into COUNTRY values (39, 'India', 'IND');
insert into COUNTRY values (40, 'Sweden', 'SWE');

commit;


---VENUE TABLE
insert into VENUE values (venue_seq.nextval, 1, 'Badminton Theater', 1);
insert into VENUE values (venue_seq.nextval, 1, 'Athens Olympic Stadium', 100);
insert into VENUE values (venue_seq.nextval, 1, 'Olympic Tennis Centre', 100);
insert into VENUE values (venue_seq.nextval, 1, 'Athens Olympic Aquatic Centre', 100);
insert into VENUE values (venue_seq.nextval, 2, 'National Aquatics Center', 100);
insert into VENUE values (venue_seq.nextval, 2, 'Technology Gymnasium', 100);
insert into VENUE values (venue_seq.nextval, 2, 'Olympic Green Tennis Centre', 100);
insert into VENUE values (venue_seq.nextval, 2, 'Beijing National Stadium', 100);
insert into VENUE values (venue_seq.nextval, 3, 'wenbley park', 100);
insert into VENUE values (venue_seq.nextval, 3, 'London Acquatics Centrer', 100);
insert into VENUE values (venue_seq.nextval, 3, 'Olympic Stadium', 100);
insert into VENUE values (venue_seq.nextval, 3, 'Lawn Tennis and Croquet Club', 100);
insert into VENUE values (venue_seq.nextval, 4, 'Rio centre', 100);
insert into VENUE values (venue_seq.nextval, 4, 'Rio Aquatics Stadium', 100);
insert into VENUE values (venue_seq.nextval, 4, 'Rio Tennis Centre', 2);
insert into VENUE values (venue_seq.nextval, 4, 'Olympic Stadium', 100);


---PARTICIPANT TABLE

    ---100m dash
insert into PARTICIPANT values (PART_SEQ.nextval, 'Justin', 'Gatlin', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Francis', 'Obikwelu', 'Portugal', 'Potugal', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Maurice', 'Greene', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Shawn', 'Crawford', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Kim', 'Collins', 'Sain Kitts', 'Sain Kitts', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Obadele', 'Thompson', 'Barbados', 'Barbados', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Aziz', 'Zakari', 'Ghana', 'Ghana', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Usain', 'Bolt', 'Jamaica', 'Jamaica', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Richard', 'Thompson', 'Trinidad and Tobago', 'Trinidad and Tobago', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Walter', 'Dix', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Churandy', 'Martina', 'Netherlands Antilles', 'Netherlands Antilles', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Asafa', 'Powell', 'Jamaica', 'Jamaica', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Michael', 'Frater', 'Jamaica', 'Jamaica', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Marc', 'Burns', 'Trinidad and Tobago', 'Trinidad and Tobago', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Darvis', 'Patton', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Yohan', 'Blake', 'Jamaica', 'Jamaica', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Ryan', 'Balley', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Tyson', 'Gay', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Andre', 'Grasse', 'Canada', 'Canada', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Akani', 'Simbine', 'South Africa', 'South Africa', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Ben Youssef', 'Meite', 'Ivory Coast', 'Ivory Coast', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Jimmy', 'Vicaut', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (PART_SEQ.nextval, 'Trayvon', 'Bromell', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));

---tennis double
insert into PARTICIPANT values (part_seq.nextval, 'Fernando', 'Gonzalez', 'Chile', 'CHI', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Nicolas', 'Massu', 'Chile', 'CHI', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Nicolas', 'Kiefer', 'Germany', 'Germany', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Rainer', 'Schuttler', 'Germany', 'Germany', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Mario', 'Ancic', 'Croatia', 'CRO', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Ivan', 'Ljubicic', 'Croatia', 'CRO', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Mahesh', 'Bhupathi', 'India', 'IND', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Leander', 'Paes', 'India', 'IND', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Roger', 'Federer', 'Slovensko', 'SUI', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Stan', 'Wawrinka', 'Slovensko', 'SUI', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Simon', 'Aspelin', 'Sweden', 'SWE', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Thomas', 'Johansson', 'Sweden', 'SWE', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Bob', 'Bryan', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Mike', 'Bryan', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Arnaud', 'Clement', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Michael', 'Llodra', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Jo-Wilfried', 'Tsonga', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Julien', 'Benneteau', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Richard', 'Gasquet', 'France', 'France', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'David', 'Ferrer', 'Spain', 'Spain', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Feliciano', 'Lopez', 'Spain', 'Spain', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Marc', 'Lopez', 'Spain', 'Spain', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Rafael', 'Nadal', 'Spain', 'Spain', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Florin', 'Mergea', 'Roumania', 'ROU', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Horia', 'Tecau', 'Roumania', 'ROU', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Steve', 'Johnson', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Jack', 'Sock', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Daniel', 'Nestor', 'Canada', 'CAN', to_date('13-OCT-82','DD-MON-RR'));
insert into PARTICIPANT values (part_seq.nextval, 'Vasek', 'Pospisil', 'Canada', 'CAN', to_date('13-OCT-82','DD-MON-RR'));

insert into PARTICIPANT values (500, 'Coach', 'Coach', 'America', 'USA', to_date('13-OCT-82','DD-MON-RR'));

commit;



---EVENT TABLE
    ---100m dash
insert into EVENT values (event_seq.nextval, 2, 2, 'M', to_date('22-AUG-2004:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 2, 8, 'M', to_date('16-AUG-2008:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 2, 11, 'M', to_date('5-AUG-2012:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 2, 16, 'M', to_date('14-AUG-2016:20:30','DD-MON-YYYY:HH24:MI'));

    ---tennis double men
insert into EVENT values (event_seq.nextval, 4, 3, 'M', to_date('27-AUG-2004:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 3, 'M', to_date('27-AUG-2004:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 7, 'M', to_date('16-AUG-2008:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 7, 'M', to_date('16-AUG-2008:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 12, 'M', to_date('4-AUG-2012:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 12, 'M', to_date('4-AUG-2012:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 15, 'M', to_date('12-AUG-2016:20:30','DD-MON-YYYY:HH24:MI'));
insert into EVENT values (event_seq.nextval, 4, 15, 'M', to_date('12-AUG-2016:20:30','DD-MON-YYYY:HH24:MI'));


---TEAM TABLE
    --- 100m dash
insert into TEAM values (team_seq.nextval, 1, '2004 100m 1', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 2', 29, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 3', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 4', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 5', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 6', 31, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 7', 32, 2, 500);
insert into TEAM values (team_seq.nextval, 1, '2004 100m 8', 33, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 1', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 2', 34, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 3', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 4', 35, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 5', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 6', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 7', 34, 2, 500);
insert into TEAM values (team_seq.nextval, 2, '2008 100m 8', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 1', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 2', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 3', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 4', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 5', 35, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 6', 34, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 7', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 3, '2012 100m 8', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 1', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 2', 2, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 3', 38, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 4', 30, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 5', 36, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 6', 37, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 7', 27, 2, 500);
insert into TEAM values (team_seq.nextval, 4, '2016 100m 8', 2, 2, 500);

---tennis double men
insert into team values (team_seq.nextval, 1, '2004 tennis 1', 23, 4, 500);
insert into team values (team_seq.nextval, 1, '2004 tennis 2', 24, 4, 500);
insert into team values (team_seq.nextval, 1, '2004 tennis 3', 25, 4, 500);
insert into team values (team_seq.nextval, 1, '2004 tennis 4', 39, 4, 500);
insert into team values (team_seq.nextval, 2, '2008 tennis 1', 26, 4, 500);
insert into team values (team_seq.nextval, 2, '2008 tennis 2', 40, 4, 500);
insert into team values (team_seq.nextval, 2, '2008 tennis 3', 2, 4, 500);
insert into team values (team_seq.nextval, 2, '2008 tennis 4', 27, 4, 500);
insert into team values (team_seq.nextval, 3, '2012 tennis 1', 2, 4, 500);
insert into team values (team_seq.nextval, 3, '2012 tennis 2', 27, 4, 500);
insert into team values (team_seq.nextval, 3, '2012 tennis 3', 27, 4, 500);
insert into team values (team_seq.nextval, 3, '2012 tennis 4', 19, 4, 500);
--insert into team values (45, 4, '2016 tennis 1', 19, 4, 500);
--insert into team values (46, 4, '2016 tennis 2', 28, 4, 500);
--insert into team values (47, 4, '2016 tennis 3', 2, 4, 500);
--insert into team values (48, 4, '2016 tennis 4', 38, 4, 500);


---TEAM_MEMBER
insert into TEAM_MEMBER values(1, 1);
insert into TEAM_MEMBER values(2, 2);
insert into TEAM_MEMBER values(3, 3);
insert into TEAM_MEMBER values(4, 4);
insert into TEAM_MEMBER values(5, 12);
insert into TEAM_MEMBER values(6, 5);
insert into TEAM_MEMBER values(7, 6);
insert into TEAM_MEMBER values(8, 7);
insert into TEAM_MEMBER values(9, 8);
insert into TEAM_MEMBER values(10, 9);
insert into TEAM_MEMBER values(11, 10);
insert into TEAM_MEMBER values(12, 11);
insert into TEAM_MEMBER values(13, 12);
insert into TEAM_MEMBER values(14, 13);
insert into TEAM_MEMBER values(15, 14);
insert into TEAM_MEMBER values(16, 15);
insert into TEAM_MEMBER values(17, 8);
insert into TEAM_MEMBER values(18, 16);
insert into TEAM_MEMBER values(19, 1);
insert into TEAM_MEMBER values(20, 17);
insert into TEAM_MEMBER values(21, 11);
insert into TEAM_MEMBER values(22, 9);
insert into TEAM_MEMBER values(23, 12);
insert into TEAM_MEMBER values(24, 18);
insert into TEAM_MEMBER values(25, 8);
insert into TEAM_MEMBER values(26, 1);
insert into TEAM_MEMBER values(27, 19);
insert into TEAM_MEMBER values(28, 16);
insert into TEAM_MEMBER values(29, 20);
insert into TEAM_MEMBER values(30, 21);
insert into TEAM_MEMBER values(31, 22);
insert into TEAM_MEMBER values(32, 23);

---tennis double men
insert into TEAM_MEMBER values (33, 24);
insert into TEAM_MEMBER values (33, 25);
insert into TEAM_MEMBER values (34, 26);
insert into TEAM_MEMBER values (34, 27);
insert into TEAM_MEMBER values (35, 28);
insert into TEAM_MEMBER values (35, 29);
insert into TEAM_MEMBER values (36, 30);
insert into TEAM_MEMBER values (36, 31);
insert into TEAM_MEMBER values (37, 32);
insert into TEAM_MEMBER values (37, 33);
insert into TEAM_MEMBER values (38, 34);
insert into TEAM_MEMBER values (38, 35);
insert into TEAM_MEMBER values (39, 36);
insert into TEAM_MEMBER values (39, 37);
insert into TEAM_MEMBER values (40, 38);
insert into TEAM_MEMBER values (40, 39);
insert into TEAM_MEMBER values (41, 36);
insert into TEAM_MEMBER values (41, 37);
insert into TEAM_MEMBER values (42, 39);
insert into TEAM_MEMBER values (42, 40);
insert into TEAM_MEMBER values (43, 41);
insert into TEAM_MEMBER values (43, 42);
insert into TEAM_MEMBER values (44, 43);
insert into TEAM_MEMBER values (44, 44);
--insert into TEAM_MEMBER values (45, 45);
--insert into TEAM_MEMBER values (45, 46);
--insert into TEAM_MEMBER values (46, 47);
--insert into TEAM_MEMBER values (46, 48);
--insert into TEAM_MEMBER values (47, 49);
--insert into TEAM_MEMBER values (47, 50);
--insert into TEAM_MEMBER values (48, 51);
--insert into TEAM_MEMBER values (48, 52);


---EVENT_PARTICIPATION
insert into EVENT_PARTICIPATION values (1, 1, 'E');
insert into EVENT_PARTICIPATION values (1, 2, 'E');
insert into EVENT_PARTICIPATION values (1, 3, 'E');
insert into EVENT_PARTICIPATION values (1, 4, 'E');
insert into EVENT_PARTICIPATION values (1, 5, 'E');
insert into EVENT_PARTICIPATION values (1, 6, 'E');
insert into EVENT_PARTICIPATION values (1, 7, 'E');
insert into EVENT_PARTICIPATION values (1, 8, 'E');
insert into EVENT_PARTICIPATION values (2, 9, 'E');
insert into EVENT_PARTICIPATION values (2, 10, 'E');
insert into EVENT_PARTICIPATION values (2, 11, 'E');
insert into EVENT_PARTICIPATION values (2, 12, 'E');
insert into EVENT_PARTICIPATION values (2, 13, 'E');
insert into EVENT_PARTICIPATION values (2, 14, 'E');
insert into EVENT_PARTICIPATION values (2, 15, 'E');
insert into EVENT_PARTICIPATION values (2, 16, 'E');
insert into EVENT_PARTICIPATION values (3, 17, 'E');
insert into EVENT_PARTICIPATION values (3, 18, 'E');
insert into EVENT_PARTICIPATION values (3, 19, 'E');
insert into EVENT_PARTICIPATION values (3, 20, 'E');
insert into EVENT_PARTICIPATION values (3, 21, 'E');
insert into EVENT_PARTICIPATION values (3, 22, 'E');
insert into EVENT_PARTICIPATION values (3, 23, 'E');
insert into EVENT_PARTICIPATION values (3, 24, 'E');
insert into EVENT_PARTICIPATION values (4, 25, 'E');
insert into EVENT_PARTICIPATION values (4, 26, 'E');
insert into EVENT_PARTICIPATION values (4, 27, 'E');
insert into EVENT_PARTICIPATION values (4, 28, 'E');
insert into EVENT_PARTICIPATION values (4, 29, 'E');
insert into EVENT_PARTICIPATION values (4, 30, 'E');
insert into EVENT_PARTICIPATION values (4, 31, 'E');
insert into EVENT_PARTICIPATION values (4, 32, 'E');

---tennis double men
insert into EVENT_PARTICIPATION values(5, 33, 'E');
insert into EVENT_PARTICIPATION values(5, 34, 'E');
insert into EVENT_PARTICIPATION values(6, 35, 'E');
insert into EVENT_PARTICIPATION values(6, 36, 'E');
insert into EVENT_PARTICIPATION values(7, 37, 'E');
insert into EVENT_PARTICIPATION values(7, 38, 'E');
insert into EVENT_PARTICIPATION values(8, 39, 'E');
insert into EVENT_PARTICIPATION values(8, 40, 'E');
insert into EVENT_PARTICIPATION values(9, 41, 'E');
insert into EVENT_PARTICIPATION values(9, 42, 'E');
insert into EVENT_PARTICIPATION values(10, 43, 'E');
insert into EVENT_PARTICIPATION values(10, 44, 'E');
--insert into EVENT_PARTICIPATION values(11, 45, 'E');
--insert into EVENT_PARTICIPATION values(11, 46, 'E');
--insert into EVENT_PARTICIPATION values(12, 47, 'E');
--insert into EVENT_PARTICIPATION values(12, 48, 'E');


---SCOREBOARD

insert into SCOREBOARD values (1, 1, 1, 1, 1, null);
insert into SCOREBOARD values (1, 1, 2, 2, 2, null);
insert into SCOREBOARD values (1, 1, 3, 3, 3, null);
insert into SCOREBOARD values (1, 1, 4, 4, 4, null);
insert into SCOREBOARD values (1, 1, 5, 12, 5, null);
insert into SCOREBOARD values (1, 1, 6, 5, 6, null);
insert into SCOREBOARD values (1, 1, 7, 6, 7, null);
insert into SCOREBOARD values (1, 1, 8, 7, 8, null);
insert into SCOREBOARD values (2, 2, 9, 8, 1, null);
insert into SCOREBOARD values (2, 2, 10, 9, 2, null);
insert into SCOREBOARD values (2, 2, 11, 10, 3, null);
insert into SCOREBOARD values (2, 2, 12, 11, 4, null);
insert into SCOREBOARD values (2, 2, 13, 12, 5, null);
insert into SCOREBOARD values (2, 2, 14, 13, 6, null);
insert into SCOREBOARD values (2, 2, 15, 14, 7, null);
insert into SCOREBOARD values (2, 2, 16, 15, 8, null);
insert into SCOREBOARD values (3, 3, 17, 8, 1, null);
insert into SCOREBOARD values (3, 3, 18, 16, 2, null);
insert into SCOREBOARD values (3, 3, 19, 1, 3, null);
insert into SCOREBOARD values (3, 3, 20, 17, 4, null);
insert into SCOREBOARD values (3, 3, 21, 11, 5, null);
insert into SCOREBOARD values (3, 3, 22, 9, 6, null);
insert into SCOREBOARD values (3, 3, 23, 12, 7, null);
insert into SCOREBOARD values (3, 3, 24, 18, 8, null);
insert into SCOREBOARD values (4, 4, 25, 8, 1, null);
insert into SCOREBOARD values (4, 4, 26, 1, 2, null);
insert into SCOREBOARD values (4, 4, 27, 19, 3, null);
insert into SCOREBOARD values (4, 4, 28, 16, 4, null);
insert into SCOREBOARD values (4, 4, 29, 20, 5, null);
insert into SCOREBOARD values (4, 4, 30, 21, 6, null);
insert into SCOREBOARD values (4, 4, 31, 22, 7, null);
insert into SCOREBOARD values (4, 4, 32, 23, 8, null);

---tennis double men
insert into SCOREBOARD values (1, 5, 33, 24, 1, null);
insert into SCOREBOARD values (1, 5, 33, 25, 1, null);
insert into SCOREBOARD values (1, 5, 34, 26, 2, null);
insert into SCOREBOARD values (1, 5, 34, 27, 2, null);
insert into SCOREBOARD values (1, 6, 35, 28, 3, null);
insert into SCOREBOARD values (1, 6, 35, 29, 3, null);
insert into SCOREBOARD values (1, 6, 36, 30, 4, null);
insert into SCOREBOARD values (1, 6, 36, 31, 4, null);
insert into SCOREBOARD values (2, 7, 37, 32, 1, null);
insert into SCOREBOARD values (2, 7, 37, 33, 1, null);
insert into SCOREBOARD values (2, 7, 38, 34, 2, null);
insert into SCOREBOARD values (2, 7, 38, 35, 2, null);
insert into SCOREBOARD values (2, 8, 39, 36, 3, null);
insert into SCOREBOARD values (2, 8, 39, 37, 3, null);
insert into SCOREBOARD values (2, 8, 40, 38, 4, null);
insert into SCOREBOARD values (2, 8, 40, 39, 4, null);
insert into SCOREBOARD values (3, 9, 41, 36, 1, null);
insert into SCOREBOARD values (3, 9, 41, 37, 1, null);
insert into SCOREBOARD values (3, 9, 42, 39, 2, null);
insert into SCOREBOARD values (3, 9, 42, 40, 2, null);
insert into SCOREBOARD values (3, 10, 43, 41, 3, null);
insert into SCOREBOARD values (3, 10, 43, 42, 3, null);
insert into SCOREBOARD values (3, 10, 44, 43, 4, null);
insert into SCOREBOARD values (3, 10, 44, 44, 4, null);
--insert into SCOREBOARD values (4, 11, 45, 45, 1, null);
--insert into SCOREBOARD values (4, 11, 45, 46, 1, null);
--insert into SCOREBOARD values (4, 11, 46, 47, 2, null);
--insert into SCOREBOARD values (4, 11, 46, 48, 2, null);
--insert into SCOREBOARD values (4, 12, 47, 49, 3, null);
--insert into SCOREBOARD values (4, 12, 47, 50, 3, null);
--insert into SCOREBOARD values (4, 12, 48, 51, 4, null);
--insert into SCOREBOARD values (4, 12, 48, 52, 4, null);

commit;