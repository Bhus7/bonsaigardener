package com.bonsai.controller;

import com.bonsai.config.DbConfig;
import com.bonsai.model.usermodell;
import com.bonsai.util.cookieutil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Successful login
            	int role_id = rs.getInt("role_id");
            	int user_id = rs.getInt("user_id");
            	String user_name = rs.getString("username");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String location = rs.getString("location");
                
             // Create a usermodell object and set user information
                usermodell user = new usermodell(user_id, user_name, password, email, role_id, null, location, phone);
            	
            	
            	//set user_id into session
            	HttpSession session = request.getSession();
            	session.setAttribute("user_id", user_id);
                
            	
                
                if (role_id == 2) {
                	request.getRequestDispatcher("/WEB-INF/pages/admindashboard.jsp").forward(request, response);
                    
                } else {
                	request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
                }

            
                
                

            } else {
                // Invalid credentials
                request.setAttribute("error", "Invalid username or password!");
                System.out.print("Invalid username or password!");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}


