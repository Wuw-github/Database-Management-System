//Wu Wei (wuw4)
//CS-1555 project
import java.sql.*;
import java.util.*;
import java.text.*;
import oracle.jdbc.OracleTypes;

public class Olympic{

	static final String url = "jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass";
	static final String username = "wuw4";
	static final String pass = "4239098";
	static boolean loggedIn = false;
	static int id = -1;

	public static void main(String[] args)throws SQLException{
		Connection dbcon = null;

		try{
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			dbcon = DriverManager.getConnection(url, username, pass);			
		}catch (SQLException e){
			System.out.println("cannot connect to db");
			e.printStackTrace();
		}
		Scanner sc = new Scanner(System.in);
		user_log_interface(sc, dbcon);
		dbcon.close();
	}

	public static void exit(Connection dbcon) throws SQLException{
		System.out.println("Thank you for using the program. Have a great day!\n");
		dbcon.close();
		System.exit(0);
	}

	public static void user_log_interface(Scanner sc, Connection dbcon) throws SQLException{
		while(true){
			System.out.println("Welcome to Olympic database!\nHow can I help you:");
			System.out.println("	1. User Login \n	2. Quit\n	3. Create User");
			System.out.print(": ");
			String input = "";
			try{
				input = sc.next();
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			if(input.equals("1")){
				int role = login_interface(sc, dbcon);
				if(role == -1)
					continue;
				if(role == 1){
					organizer_interface(sc, dbcon);
					continue;
				}
				if(role == 2){
					coach_interface(sc, dbcon);
					continue;
				}
				if(role == 3){
					guest_interface(sc, dbcon);
					continue;
				}
			}
			else if(input.equals("2"))
				exit(dbcon);
			else if(input.equals("3"))
				createUser_interface(sc, dbcon);
			else
				System.out.println("Invalid input.");
		}
	}
	private static void guest_interface(Scanner sc, Connection dbcon){
		
		while(true){
			System.out.println("\nHello! What do you want to do?");
			System.out.println("	1. Display Sport");
			System.out.println("	2. Display Event");
			System.out.println("	3. Country Rank");
			System.out.println("	4. Top k Athletes");
			System.out.println("	5. Connected Athletes");
			System.out.println("	6. Log out");
			System.out.print("Your selection: ");
			int input;
			try{
				input = Integer.parseInt(sc.next());
			}catch(Exception e){
				System.out.println(e.getMessage());
				continue;
			}
			switch(input){
				case 1:
					displaySport_interface(sc, dbcon); break;
				case 2:
					displayEvent_interface(sc, dbcon); break;
				case 3:
					countryRanking_interface(sc, dbcon); break;
				case 4:
					topkAthletes_interface(sc, dbcon); break;
				case 5:
					connectedAthletes_interface(sc, dbcon); break;
				case 6:
					logout(id, dbcon); return;
				default:
					System.out.println("Invalid input");
			}
		}
	}

	private static void coach_interface(Scanner sc, Connection dbcon){
		
		while(true){
			System.out.println("\nHello! What do you want to do?");
			System.out.println("	1. Display Sport");
			System.out.println("	2. Display Event");
			System.out.println("	3. Country Rank");
			System.out.println("	4. Top k Athletes");
			System.out.println("	5. Connected Athletes");
			System.out.println("	6. Create Team");
			System.out.println("	7. Register Team");
			System.out.println("	8. Add Participant");
			System.out.println("	9. Add Team Member");
			System.out.println("	10. Drop Team Member");
			System.out.println("	11. Log out");
			System.out.print("Your selection: ");
			int input;
			try{
				input = Integer.parseInt(sc.next());
			}catch(Exception e){
				System.out.println(e.getMessage());
				continue;
			}
			switch(input){
				case 1:
					displaySport_interface(sc, dbcon); break;
				case 2:
					displayEvent_interface(sc, dbcon); break;
				case 3:
					countryRanking_interface(sc, dbcon); break;
				case 4:
					topkAthletes_interface(sc, dbcon); break;
				case 5:
					connectedAthletes_interface(sc, dbcon); break;
				case 6:
					createTeam_interface(sc, dbcon);
				case 7:
					registerTeam_interface(sc, dbcon); break;
				case 8:
					addParticipant_interface(sc, dbcon); break;
				case 9:
					addTeamMember_interface(sc, dbcon); break;
				case 10:
					dropTeamMember_interface(sc, dbcon); break;
				case 11:
					logout(id, dbcon); return;
				default:
					System.out.println("Invalid input");
			}
		}
	}

	private static void organizer_interface(Scanner sc, Connection dbcon){
		
		while(true){
			System.out.println("\nHello! What do you want to do?");
			System.out.println("	1. Display Sport");
			System.out.println("	2. Display Event");
			System.out.println("	3. Country Rank");
			System.out.println("	4. Top k Athletes");
			System.out.println("	5. Connected Athletes");
			System.out.println("	6. Create User");
			System.out.println("	7. Drop User");
			System.out.println("	8. Create Event");
			System.out.println("	9. Add Event Outcome");
			System.out.println("	10. Log out");
			System.out.print("Your selection: ");
			int input;
			try{
				input = Integer.parseInt(sc.next());
			}catch(Exception e){
				System.out.println(e.getMessage());
				continue;
			}
			switch(input){
				case 1:
					displaySport_interface(sc, dbcon); break;
				case 2:
					displayEvent_interface(sc, dbcon); break;
				case 3:
					countryRanking_interface(sc, dbcon); break;
				case 4:
					topkAthletes_interface(sc, dbcon); break;
				case 5:
					connectedAthletes_interface(sc, dbcon); break;
				case 6:
					createUser_interface(sc, dbcon); break;
				case 7:
					dropUser_interface(sc, dbcon);	
					if(id == -1)
						return;
					break;
				case 8:
					createEvent_interface(sc, dbcon); break;
				case 9:
					addEventOutcome_interface(sc, dbcon); break;
				case 10:
					logout(id, dbcon); return;
				default:
					System.out.println("Invalid input");
			}
		}
	}

	public static int login_interface(Scanner sc, Connection dbcon){
		boolean e = false;
		while(!e){
			System.out.print ("Please enter your username: ");
			String username = sc.next();
			System.out.print("Please enter your passcode: ");
			String pwd = sc.next();
			
			int role_id = login(username, pwd, dbcon);
			if(role_id != -1)
				return role_id;
			System.out.println("Username and/or password not recognized");

			System.out.print("Do you want to re-enter? (y/n): ");
			String temp = sc.next().toLowerCase();
			if(!temp.equals("y"))
				e = true;
		}
		return -1;
	}
	public static int login(String username, String pwd, Connection dbcon){
		try{
				String sql = "select * from USER_ACCOUNT where username = ? and passkey = ?";
				PreparedStatement ps = dbcon.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, pwd);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					loggedIn = true;
					int role_id = rs.getInt("role_id");
					id = rs.getInt("user_id");
					System.out.println("Successfully logged in.\n");
					return role_id;
				}
				return -1;
			}catch(SQLException ex){
				while (ex != null) {
	                System.out.println("Message = " + ex.getMessage());
	                System.out.println("SQLState = " + ex.getSQLState());
	                System.out.println("Error code = " + ex.getErrorCode());
	                ex = ex.getNextException();
				}
				return -1;
			}
	}
	private static void createUser_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the username: ");
			sc.nextLine();
			String username = sc.nextLine();
			System.out.print("Please enter your passkey: ");
			String pass = sc.nextLine();
			System.out.print("Please enter your role \n	1 - Organizer\n 	2 - Coach\n 	3 - Guest)\n: ");
			int role = Integer.parseInt(sc.nextLine());
			createUser(username, pass, role, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	public static void createUser(String username, String passkey, int role_id, Connection dbcon){
		Calendar c = Calendar.getInstance();
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into USER_ACCOUNT values (account_seq.nextval, ?, ?, ?, ?)");
			ps.setString(1, username);
			ps.setString(2, passkey);
			ps.setInt(3, role_id);
			java.sql.Date cur_time = new java.sql.Date(c.getTime().getTime());
			ps.setDate(4, cur_time);
			int row = ps.executeUpdate();
			System.out.println("User "+username+" is created, "+row+" row affected\n");
		}catch(SQLException e){
            while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
			System.out.println("SQL Error, creation fail\n");
		}
	}
	private static void dropUser_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the User_id you want to delete: ");
			sc.nextLine();
			int user_id = Integer.parseInt(sc.nextLine());
			dropUser(user_id, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void dropUser(int user_id, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("delete from USER_ACCOUNT where user_id = ?");
			ps.setInt(1, user_id);
			int rows = ps.executeUpdate();
			if(user_id == id){
				System.out.println("You have deleted yourself.\n");
				id = -1;
				return;
			}
			System.out.println(rows+" row affected, "+"drop user complete\n");
		}catch (SQLException e){
			
            while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
			System.out.println("SQL Error, cannot delete user\n");
		}
	}
	private static void createEvent_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the sport_id of the event: ");
			sc.nextLine();
			int sport_id = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the venue_id of the event: ");
			int venue_id = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the gender of the event (M/F): ");
			char gender = sc.nextLine().charAt(0);
			System.out.print("Please enter the event date (yyyy-MM-dd): ");
			String dateIn = sc.nextLine();
			java.sql.Date date = java.sql.Date.valueOf(dateIn);
			createEvent(sport_id, venue_id, gender, date, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void createEvent(int sport_id, int venue_id, char gender, java.sql.Date dateIn, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into event values(event_seq.nextval, ?, ?, ?, ?)");
			ps.setInt(1, sport_id);
			ps.setInt(2, venue_id);
			ps.setString(3, String.valueOf(Character.toUpperCase(gender)));
			ps.setDate(4, dateIn);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, "+"Event successfully created\n");
		}catch(SQLException e){
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
			System.out.println("SQL error, Event not created\n");
		}
	}
	private static void addEventOutcome_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the Olympic_id: ");
			sc.nextLine();
			int olym = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the event_id: ");
			int event = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the team_id: ");
			int team = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the participant_id: ");
			int part = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the position of the athlete: ");
			int position = Integer.parseInt(sc.nextLine());

			addEventOutcome(olym, event, team, part, position, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void addEventOutcome(int olympic, int event, int team, int participant, int position, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into scoreboard values (?, ?, ?, ?, ?, null)");
			ps.setInt(1, olympic);
			ps.setInt(2, event);
			ps.setInt(3, team);
			ps.setInt(4, participant);
			ps.setInt(5, position);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, "+"scoreboard updated");
		}catch(SQLException e){
			System.out.println("scoreboard cannot be updated");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	/*Given an Olympic game (City, Year), sport, country, and the name of the team, 
	add a new team to system. Team IDs should be auto-generated, and only coaches can 
	create teams and their name is added as the team coach (team member).
	*/

	private static void createTeam_interface(Scanner sc, Connection dbcon){
		try{
			sc.nextLine();
			System.out.print("Please enter the year of the Olympic game: ");
			int year = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the sport_id that the team is attending: ");
			int sport = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the team name: ");
			String team_name = sc.nextLine();
			System.out.print("Please enter the country_id of the team: ");
			int country = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the coach_id of the team: ");
			int coach = Integer.parseInt(sc.nextLine());
			
			createTeam(year, sport, team_name, country, coach, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void createTeam(int year, int sport, String team_name, int country, int coach, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("select * from OLYMPICS where extract(year from OPENING_DATE) = ?");
			ps.setInt(1, year);
			ResultSet rs = ps.executeQuery();
			int olympic_id = -1;
			if(rs.next())
				olympic_id = rs.getInt("olympic_id");
			else{
				System.out.println("Olympic record not found");
				return;
			}
			ps = dbcon.prepareStatement("insert into Team values (team_seq.nextval, ?, ?, ?, ?, ?)");
			ps.setInt(1, olympic_id);
			ps.setString(2, team_name);
			ps.setInt(3, country);
			ps.setInt(4, sport);
			ps.setInt(5, coach);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, "+ "Team is created successfully");
		}catch(SQLException e){
			System.out.println("Team cannot be added");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}
	private static void registerTeam_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the team_id: ");
			sc.nextLine();
			int team = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the event_id: ");
			int event = Integer.parseInt(sc.nextLine());
			
			registerTeam(team, event, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void registerTeam(int team, int event, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into EVENT_PARTICIPATION values (?, ?, null)");
			ps.setInt(1, event);
			ps.setInt(2, team);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, " + "Team is registered to the event");
		}catch(SQLException e){
			System.out.println("Team cannot be registered to the event");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}
	private static void addParticipant_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter athlete first name: ");
			sc.nextLine();
			String fname = sc.nextLine();
			System.out.print("Please enter athlete last name: ");
			String lname = sc.nextLine();
			System.out.print("Please enter athlete nationality: ");
			String nationality = sc.nextLine();
			System.out.print("Please enter athlete birthplace: ");
			String birthplace = sc.nextLine();
			System.out.print("Please enter the athlete dob (yyyy-MM-dd): ");
			String dateIn = sc.nextLine();
			java.sql.Date date = java.sql.Date.valueOf(dateIn);
			
			addParticipant(fname, lname, nationality, birthplace, date, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	//Given the first name, last name, nationality, birth place, do, create participant.
	public static void addParticipant(String fname, String lname, String nationality, String birthplace, java.sql.Date date, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into PARTICIPANT values (part_seq.nextval, ?, ?, ?, ?, ?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, nationality);
			ps.setString(4, birthplace);
			ps.setDate(5, date);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, "+"Participant information is stored\n");
		}catch(SQLException e){
			System.out.println("Participat information cannot be stored");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	private static void addTeamMember_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the team_id: ");
			sc.nextLine();
			int team = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the participant_id: ");
			int part = Integer.parseInt(sc.nextLine());
			
			addTeamMember(team, part, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void addTeamMember(int team_id, int part, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("insert into TEAM_MEMBER values (?, ?)");
			ps.setInt(1, team_id);
			ps.setInt(2, part); 
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, " + "Team member is updated");
		}catch(SQLException e){
			System.out.println("Team member cannot be updated");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}	

	private static void dropTeamMember_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Please enter the participant_id: ");
			sc.nextLine();
			int part = Integer.parseInt(sc.nextLine());
			System.out.print("Are you still going to delete participant "+part+"? (y/n): ");
			String confirm = sc.nextLine().toUpperCase();
			if(confirm.equals("Y"))
				dropTeamMember(part, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	public static void dropTeamMember(int part_id, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			PreparedStatement ps = dbcon.prepareStatement("delete from participant where participant_id = ?");
			ps.setInt(1, part_id);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected, " + "Participant information is deleted\n");
		}catch(SQLException e){
			System.out.println("Participat information cannot be deleted\n");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	private static void displaySport_interface(Scanner sc, Connection dbcon){
		System.out.println("Which sport do you want to check?");
		String input = "";
		try{
			sc.nextLine();
			input = sc.nextLine();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		displaySport(input, dbcon);
	}

	public static void displaySport(String sportname, Connection dbcon){
		try{
			CallableStatement cs = dbcon.prepareCall("{call display_sport(?, ?)}");
			cs.setString(1, sportname);
			cs.registerOutParameter (2, OracleTypes.CURSOR);
			cs.execute();

            // get refcursor and convert it to ResultSet
            ResultSet rs = (ResultSet) cs.getObject(2);
            if (rs.next()){
            	System.out.printf("%-10s %-5s %-10s %-20s %-20s %-10s\n", "Year_added", "Year", "Gender", "Athelete", "Country", "Medal");
	            while(true){
	            	int year_added = rs.getInt(1);
					int year = rs.getInt(2);
					String gender = rs.getString(3);
					String name = rs.getString(4);
					String country = rs.getString(5);
					String medal = rs.getString(6);
					System.out.printf("%-10s %-5s %-10s %-20s %-20s %-10s\n", year_added, year, gender, name, country, medal);
					if(!rs.next())
						break;
				}
				rs.close();
			}
            else
            	System.out.println("No value stored");
		}catch(SQLException e){
			System.out.println("Information cannor be shown");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	private static void displayEvent_interface(Scanner sc, Connection dbcon){
		String city = "";
		String year = "";
		int event = -1;
		try{
			sc.nextLine();
			System.out.print("Please enter the Event id? ");
			event = Integer.parseInt(sc.nextLine());
			displayEvent(event, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	public static void displayEvent(int event_id, Connection dbcon){
		try{
			CallableStatement cs = dbcon.prepareCall("{call display_Event(?, ?)}");
			cs.setInt(1, event_id);
			cs.registerOutParameter (2, OracleTypes.CURSOR);
			cs.execute();

            // get refcursor and convert it to ResultSet
            ResultSet rs = (ResultSet) cs.getObject(2);
            if(rs.next()){
	            System.out.printf("%-7s %-7s %-15s %-20s %-10s %-10s\n", "City", "Year", "Game", "Athelete", "Position", "Medal");
				while(true){
					String city = rs.getString(1);
					String year = rs.getString(2);
					String game = rs.getString(3);
					String name = rs.getString(4);
					int position = rs.getInt(5);
					String medal = rs.getString(6);
					if (rs.wasNull())
						medal = "";
					System.out.printf("%-7s %-7s %-15s %-20s %-10s %-10s\n", city, year, game, name, position, medal);
					if(!rs.next())
						break;
				}
				rs.close();
			}
			else
				System.out.println("No value found");
		}catch(SQLException e){
			System.out.println("Information cannor be shown");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	private static void countryRanking_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Which Olympic do you want to check? ");
			sc.nextLine();
			int olym = Integer.parseInt(sc.next());
			countryRanking(olym, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	public static void countryRanking(int olympic_id, Connection dbcon){
		try{
			CallableStatement cs = dbcon.prepareCall("{call countryRanking(?, ?)}");
			cs.setInt(1, olympic_id);
			cs.registerOutParameter (2, OracleTypes.CURSOR);
			cs.execute();
            // get refcursor and convert it to ResultSet
            ResultSet rs = (ResultSet) cs.getObject(2);
            if(rs.next()){
	            System.out.printf("%-10s %-10s %-7s %-7s %-7s %-10s\n", "Country", "First_year", "Gold", "Silver", "Bronze", "Rank");
				while(true){
					String country = rs.getString(1);
					String first = rs.getString(2);
					int gold = rs.getInt(3);
					int silver = rs.getInt(4);
					int bronze = rs.getInt(5);
					int rank = rs.getInt(6);
					System.out.printf("%-10s %-10s %-7s %-7s %-7s %-10s\n", country, first, gold, silver, bronze, rank);
					if(!rs.next())
						break;
				}
				rs.close();
			}
			else
				System.out.println("No value found");
		}catch(SQLException e){
			System.out.println("Information cannor be shown");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	

	private static void topkAthletes_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Which Olympic do you want to check? ");
			sc.nextLine();
			int olym = Integer.parseInt(sc.nextLine());
			System.out.print("How many athletes do you want to see? ");
			int k = Integer.parseInt(sc.nextLine());
			
			topkAthletes(olym, k, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}
	/*
	Given an olympic id and a number k, display the top-k athletes 
	based on their rank along with the number of gold, silver and 
	bronze medals in a descending order of their rank. The rank is 
	computed based on the points associated with each metal.
	*/
	public static void topkAthletes(int olympic_id, int k, Connection dbcon){
		try{
			CallableStatement cs = dbcon.prepareCall("{call topkAthletes(?, ?)}");
			cs.setInt(1, olympic_id);
			cs.registerOutParameter (2, OracleTypes.CURSOR);
			cs.execute();

            // get refcursor and convert it to ResultSet
            ResultSet rs = (ResultSet) cs.getObject(2);
            if(rs.next()){
	            System.out.printf("%-20s %-7s %-7s %-7s %-7s\n", "Athlete", "Gold", "Silver", "Bronze", "Rank");
				while(true){
					String athlete = rs.getString(1);
					int gold = rs.getInt(2);
					int silver = rs.getInt(3);
					int bronze = rs.getInt(4);
					int rank = rs.getInt(5);
					if (rank > k)
					return;
					System.out.printf("%-20s %-7s %-7s %-7s %-7s\n", athlete, gold, silver, bronze, rank);
					if(!rs.next())
						break;
				}
				rs.close();
			}
			else
				System.out.println("No value found");
		}catch(SQLException e){
			System.out.println("Information cannor be shown");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}
	
	private static void connectedAthletes_interface(Scanner sc, Connection dbcon){
		try{
			System.out.print("Which Olympic do you want to check? ");
			sc.nextLine();
			int olym = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the athlete_id: ");
			int part_id = Integer.parseInt(sc.nextLine());
			System.out.print("Please enter the number n: ");
			int n = Integer.parseInt(sc.nextLine());
			
			connectedAthletes(part_id, olym, n, dbcon);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	public static void connectedAthletes(int part_id, int olym_id, int n, Connection dbcon){
		try{
			CallableStatement cs = dbcon.prepareCall("{call find_Athlete(?, ?, ?)}");
			cs.setInt(1, part_id);
			cs.setInt(2, olym_id);
			cs.registerOutParameter (3, OracleTypes.CURSOR);
			cs.execute();
			ResultSet rs = (ResultSet) cs.getObject(3);
			
			if(!rs.next()){
				System.out.println("Athlete not found");
				return;
			}
			String athlete = rs.getString(1);
            rs.close();

            ArrayList<Integer> connected = new ArrayList<>();
            connected.add(part_id);

            for(int i = 0; i < n + 1; i++){
            	connected = getAthlete(connected, olym_id - i, dbcon);
				connected.remove(new Integer(part_id));
            }
            if(connected.isEmpty()){
            	System.out.println("No athlete is connected with: "+ athlete);
            	return;
            }
            System.out.printf("\n%-20s %-20s\n\n", "Athlete", "Connected Athlete");
            while(!connected.isEmpty()){
            	cs = dbcon.prepareCall("{call find_Athletes(?, ?)}");
				cs.setInt(1, connected.remove(0));
				cs.registerOutParameter (2, OracleTypes.CURSOR);
				cs.execute();
				rs = (ResultSet) cs.getObject(2);
				rs.next();
				String con_athlete = rs.getString(1);
				System.out.printf("%-20s %-20s\n", athlete, con_athlete);
				rs.close();
            }


		}catch(SQLException e){
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

	private static ArrayList<Integer> getAthlete(ArrayList<Integer> part_id, int olym, Connection dbcon){
		ArrayList<Integer> athletes = new ArrayList<>();
		try{
			for(int i = 0; i < part_id.size(); i++){
				CallableStatement cs = dbcon.prepareCall("{call retrieve_Athletes(?, ?, ?)}");
				cs.setInt(1, part_id.get(i));
				cs.setInt(2, olym);
				cs.registerOutParameter (3, OracleTypes.CURSOR);
				cs.execute();
				ResultSet rs = (ResultSet) cs.getObject(3);
				while(rs.next()){
					athletes.add(rs.getInt(1));
				}
				rs.close();
			}
		}catch(SQLException e){
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
		athletes = removeDuplicates(athletes);
		return athletes;
	}

	private static ArrayList<Integer> removeDuplicates(ArrayList<Integer> in){
		ArrayList<Integer> out = new ArrayList<>();
		for(Integer a : in){
			if(!out.contains(a))
				out.add(a);
		}
		return out;
	}

	public static void logout(int curr_id, Connection dbcon){
		try{
			dbcon.setAutoCommit(true);
			Calendar c = Calendar.getInstance();
			java.sql.Date cur_time = new java.sql.Date(c.getTime().getTime());
			PreparedStatement ps = dbcon.prepareStatement("update USER_ACCOUNT set last_login = ? where user_id = ?");
			ps.setDate(1, cur_time);
			ps.setInt(2, curr_id);
			int rows = ps.executeUpdate();
			System.out.println(rows+" row affected.");
			System.out.println("Logged out.\n");
			id = -1;
		}catch(SQLException e){
			System.out.println("Logout fail");
			while (e != null) {
                System.out.println("Message = " + e.getMessage());
                System.out.println("SQLState = " + e.getSQLState());
                System.out.println("Error code = " + e.getErrorCode());
                e = e.getNextException();
			}
		}
	}

}
