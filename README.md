# Database-Management-System

Implement a single Java application program that will manages Olympic games, and the core of such a system is a database system.

Setup:
1. run schema.sql
2. run trigger.sql
3. run init.sql

To run the program (Olympic.java)
1. compile Olympic.java by 
  $ javac -cp ojdbc7.jar Olympic.java
2. run the program by 
  $ java -cp ojdbc7.jar:. Olympic
  
To run the Driver for testing (re-setup)
1. compile Driver.java by 
  $ javac -cp ojdbc7.jar Driver.java Olympic.java
2. run the program by 
  $ java -cp ojdbc7.jar:. Driver

To check quries.sql: (re-setup)
1. run @quries.sql on sqlplus
