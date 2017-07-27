package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
	
	static Connection con = null;
	
	public static Connection dbCon() {
		
		try {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("Hello");
			} catch (ClassNotFoundException e) {
				// TODO Tell Administrator to install Oracle Database
				e.printStackTrace();
			}
			//Change here for different user in a database
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","multibanking","multibanking");
			System.out.println("connection is created ");
			
		}catch(java.sql.SQLException e) {
			e.printStackTrace();
			System.out.println("No Connection");
		}
		
		return con;
	}

}
