package com.bonsai.controller;
import com.bonsai.util.cookieutil;
import com.bonsai.util.sessionutil;
import com.bonsai.model.*;
import com.bonsai.services.registerservice;

import java.io.IOException;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class register
 */
@SuppressWarnings("unused")
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String role_name = request.getParameter("role_name");
	    String Location = request.getParameter("Location");
	    String Phone = request.getParameter("Phone");
	    
	    usermodell usermodell = new usermodell(username, password);
	    Boolean loginStatus = addUser(usermodell);
	     
	    if (loginStatus!= null && loginStatus)
	    {
	    	sessionutil.setAttribute(request, "username", username);
	    	if (username.equals("admin"))
	    	{
	    		cookieutil.addCookie(response, "role_name", "admin", 0*30*60);
	    		response.sendRedirect(request.getContextPath()+"/admindashboard");
	    	}
	    	else
	    	{
	    		cookieutil.addCookie(response, username, role_name, 0*30*60);
	    		response.sendRedirect(request.getContextPath()+"/home");
	    	}
	    	
	    }
	    

	    String errorMessage = null;

	    String textPattern = "^[a-zA-Z]+$";
	    String emailPattern = "^[a-zA-Z0-9@.]+$";
	    String passwordPattern = "^[a-zA-Z0-9]{8,}$";

	    if (username.isEmpty() || email.isEmpty() || password.isEmpty() || Location.isEmpty() || Phone.isEmpty()) {
	        errorMessage = "All fields are required!";
	    } else if (!Pattern.matches(textPattern, username)) {
	        errorMessage = "Username can only contain letters!";
	    } else if (!Pattern.matches(emailPattern, email)) {
	        errorMessage = "Email can only contain letters, numbers, and '@.'!";
	    } else if (!Pattern.matches(passwordPattern, password)) {
	        errorMessage = "Password must be at least 8 characters long and contain only letters and numbers!";
	    }else if (!Pattern.matches(textPattern, Location)) {
	        errorMessage = "Location must be at least 8 characters long and contain only letters and numbers!";
	    }

	    if (errorMessage != null) {
	        request.setAttribute("errorMessage", errorMessage);
	        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	        System.out.println("registration failed");
	    } else {
	        // Create user model and set values
	        usermodell usermodell1 = new usermodell();
	        usermodell1.setUsername(username);
	        usermodell1.setPassword(password);
	        usermodell1.setEmail(email);
	        usermodell1.setrole_name(role_name);
	        usermodell1.setLocation(Location);
	        usermodell1.setPhone(Phone);

	        // Call service
	        com.bonsai.services.registerservice registerService = new com.bonsai.services.registerservice();
	        Boolean isRegistered = registerService.addUser(usermodell1);

	        if (isRegistered != null && isRegistered) {
	            System.out.println("Successfully registered!");
	            request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
	        } else {
	            System.out.println("Failed to register!");
	            request.setAttribute("errorMessage", "Something went wrong during registration.");
	            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	        }
	    }
	}

	private Boolean addUser(usermodell usermodell) {
		// TODO Auto-generated method stub
		return null;
	}
}
