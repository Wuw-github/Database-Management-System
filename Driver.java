import java.util.*;
import java.sql.*;

public class Driver{

	static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
	static final String username = "wuw4";
	static final String pass = "4239098";
	static Connection dbcon = null;

	public static void main(String[] args) throws SQLException{
		System.out.println("Driver class, test Olympic.java");
		
		try{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			dbcon = DriverManager.getConnection(url, username, pass);			
		}catch (SQLException e){
			System.out.println("cannot connect to db");
			e.printStackTrace();
		}
		//Scanner sc = new Scanner(System.in);
		testCreateUser();
		testDropUser();
		testCreateEvent();
		testAddParticipant();
		testCreateTeam();
		testAddTeamMember();
		testRegisterTeam();
		testAddEventOutcome();
		testDropTeamMember();
		testLogin();
		testDisplaySport();
		testDisplayEvent();
		testCountryRanking();
		testTopkAthletes();
		testConnectedAthletes();
		testLogout();
		testExit();
		dbcon.close();
	}

	public static void testCreateUser() throws SQLException{
		System.out.println("Begin testing createUser()");
		for(int i = 0; i < 10; i++){
			String username = "user" + i;
			String pass = "user" + i;
			int role = i % 3 + 1;
			System.out.println("Inserting User: "+ username+", passkey: "+pass+", role_id: "+role+"\n");
			Olympic.createUser(username, pass, role, dbcon);
		}
		System.out.println("Testing complete\n");
	}

	public static void testDropUser() throws SQLException{
		System.out.println("Begin testing dropUser()");
		for(int i = 0; i < 10; i++){
			String username = "user" + i;
			int id = -1;
			PreparedStatement ps = dbcon.prepareStatement("select * from user_account where username = ?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getInt("user_id");
				System.out.println("User '"+username+"' found. Id: "+id);
				System.out.println("Deleting User "+username);
				Olympic.dropUser(id, dbcon);
			}else {
				System.out.println("User '"+username+"' could not found in table");
			}
		}
		System.out.println("Testing complete\n");
	}

	public static void testCreateEvent()throws SQLException{
		System.out.println("Begin testing createEvent()\n");
		System.out.println("Testing Venue that has enough capacity:");
		java.sql.Date date = java.sql.Date.valueOf("2004-08-22");
		int sport_id = 2;
		int venue_id = 8;
		char gender = 'M';
		System.out.println("Inserting event sport_id: "+sport_id+", venue_id: "+venue_id+", gender: "+gender+", date: 2004-08-22");
		Olympic.createEvent(sport_id, venue_id, gender, date, dbcon);

		System.out.println("Testing ENFORCE_CAPACITY Trigger:");
		System.out.println("Venue id 1 has capacity = 1, cannot add 2 events in the same day");
		venue_id = 1;
		PreparedStatement ps = dbcon.prepareStatement("delete from event where venue_id = 1");
		ps.executeQuery();
		System.out.println("Inserting event sport_id: "+sport_id+", venue_id: "+venue_id+", gender: "+gender+", date: 2004-08-22");
		Olympic.createEvent(sport_id, venue_id, gender, date, dbcon);
		System.out.println("Inserting event sport_id: "+sport_id+", venue_id: "+venue_id+", gender: "+gender+", date: 2004-08-22");
		Olympic.createEvent(sport_id, venue_id, gender, date, dbcon);

		System.out.println("Testing complete\n");
	}

	public static void testAddParticipant() throws SQLException {
		System.out.println("Begin testing addParticipant()\n");
		Olympic.addParticipant("Massimiliano", "Rosolino", "Italy", "Italy", java.sql.Date.valueOf("1982-10-13"), dbcon);
		Olympic.addParticipant("Yuri", "Prilukov", "Russia", "Russia", java.sql.Date.valueOf("1982-10-13"), dbcon);
		Olympic.addParticipant("Takeshi", "Matsuda", "Japan", "Japan", java.sql.Date.valueOf("1982-10-13"), dbcon);
		Olympic.addParticipant("Zhang", "Lin", "China", "China", java.sql.Date.valueOf("1982-10-13"), dbcon);
		Olympic.addParticipant("Larsen", "Jensen", "America", "America", java.sql.Date.valueOf("1982-10-13"), dbcon);
		System.out.println("Testing complete\n");
	}

	public static void testCreateTeam(){
		System.out.println("Begin testing createTeam()\n");
		Olympic.createTeam(2016, 4, "2016 tennis 1", 19, 500, dbcon);
		Olympic.createTeam(2016, 4, "2016 tennis 2", 28, 500, dbcon);
		Olympic.createTeam(2016, 4, "2016 tennis 3", 2, 500, dbcon);
		Olympic.createTeam(2016, 4, "2016 tennis 4", 38, 500, dbcon);
		System.out.println("Testing complete\n");
	}

	public static void testAddTeamMember() {
		System.out.println("Begin testing addTeamMember()\n");
		Olympic.addTeamMember(45, 45, dbcon);
		Olympic.addTeamMember(45, 46, dbcon);
		Olympic.addTeamMember(46, 47, dbcon);
		Olympic.addTeamMember(46, 48, dbcon);
		Olympic.addTeamMember(47, 49, dbcon);
		Olympic.addTeamMember(47, 50, dbcon);
		Olympic.addTeamMember(48, 51, dbcon);
		Olympic.addTeamMember(48, 52, dbcon);

		System.out.println("Testing complete\n");
	}

	public static void testRegisterTeam() throws SQLException {
		System.out.println("Begin testing registerTeam()\n");
		Olympic.registerTeam(45, 11, dbcon);
		Olympic.registerTeam(46, 11, dbcon);
		Olympic.registerTeam(47, 12, dbcon);
		Olympic.registerTeam(48, 12, dbcon);
		System.out.println("Testing complete\n");
	}

	public static void testAddEventOutcome() throws SQLException {
		System.out.println("Begin testing addEventOutcome()\n");
		Olympic.addEventOutcome(4, 11, 45, 45, 1, dbcon);
		Olympic.addEventOutcome(4, 11, 45, 46, 1, dbcon);
		Olympic.addEventOutcome(4, 11, 46, 47, 2, dbcon);
		Olympic.addEventOutcome(4, 11, 46, 48, 2, dbcon);
		Olympic.addEventOutcome(4, 12, 47, 49, 3, dbcon);
		Olympic.addEventOutcome(4, 12, 47, 50, 3, dbcon);
		Olympic.addEventOutcome(4, 12, 48, 51, 4, dbcon);
		Olympic.addEventOutcome(4, 12, 48, 52, 4, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testDropTeamMember() {
		System.out.println("Begin testing dropTeamMember()\n");
		System.out.println("Drop one athlete from individual game, participant_id: 23");
		Olympic.dropTeamMember(23, dbcon);
		System.out.println("Drop one athlete from a group game, participant_id: 52");
		Olympic.dropTeamMember(52, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testLogin() {
		System.out.println("Begin testing login()\n");
		Olympic.login("Guest", "GUEST", dbcon);
		Olympic.login("AthensChair", "Ginna", dbcon);
		System.out.println("Test complete\n");
	}

	public static void testDisplaySport() {
		System.out.println("Begin testing displaySport()\n");
		System.out.println("100m-dash:");
		Olympic.displaySport("100m-dash", dbcon);
		System.out.println("\ntennis double: ");
		Olympic.displaySport("tennis double", dbcon);
		System.out.println("Test complete\n");
	}

	public static void testDisplayEvent() {
		System.out.println("Begin testing displayEvent()\n");
		Olympic.displayEvent(1, dbcon);
		System.out.println("");
		Olympic.displayEvent(7, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testCountryRanking() {
		System.out.println("Begin testing countryRanking()\n");
		Olympic.countryRanking(1, dbcon);
		System.out.println("");
		Olympic.countryRanking(4, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testTopkAthletes() {
		System.out.println("Begin testing topkAthletes()\n");
		Olympic.topkAthletes(1, 5, dbcon);
		System.out.println("");
		Olympic.topkAthletes(1, 7, dbcon);
		System.out.println("");
		Olympic.topkAthletes(3, 6, dbcon);
		System.out.println("");
		Olympic.topkAthletes(4, 3, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testConnectedAthletes() {
		System.out.println("Begin testing connectedAthletes()\n");
		Olympic.connectedAthletes(17, 3, 1, dbcon);
		Olympic.connectedAthletes(22, 4, 3, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testLogout() {
		System.out.println("Begin testing logout()\n");
		Olympic.logout(1, dbcon);
		System.out.println("Test complete\n");
	}

	public static void testExit() throws SQLException {
		System.out.println("Begin testing exit()\n");
		Olympic.exit(dbcon);
		System.out.println("Test complete\n");
	}
	/*
	public static void testCreateTeam() throws SQLException {
		System.out.println("Begin testing testCreateTeam()\n");
		int year = 2004;
		int sport = 3;
		int country = 1000;
		int coach = 1000;
		System.out.println("mock country_id = 1000, mock coach_id = 1000, sport_id = 3, year = 2004");
		for(int i = 0; i < 5; i++) {
			String teamname = "Test Team "+i;
			System.out.println("Inserting teamname: "+teamname+ ", year: "+year+", sport: "+ sport);
			Olympic.createTeam(year, sport, teamname, 1000, 1000, dbcon);
		}
		System.out.println("Testing complete\n");
	}

	public static void mockObjects() throws SQLException {
		PreparedStatement ps = dbcon.prepareStatement("select * from country where country_id = 1000");
		ResultSet rs = ps.executeQuery();
		if(!rs.next()) {
			ps = dbcon.prepareStatement("insert into country values(1000, 'TestCountry', 'TSC')");
			ps.executeQuery();
		}
		ps = dbcon.prepareStatement("select * from participant where participant_id = 1000");
		rs = ps.executeQuery();
		if(!rs.next()) {
			ps = dbcon.prepareStatement("insert into participant values (1000, 'test', 'test', 'TestCountry', 'TSC', to_date('22-AUG-2004:20:30','DD-MON-YYYY:HH24:MI'))");
			ps.executeQuery();
		}
		
	}
	*/

}