package com.bonsai.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bonsai.config.DbConfig;
import com.bonsai.model.usermodell;

public class UserProfileService {  
    public static usermodell getUserById(int user_id) {
        usermodell user = null;

        try (Connection conn = DbConfig.getDbConnection()) {
            String sql = "SELECT * FROM user WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, user_id);  // Set the user ID parameter
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new usermodell();  // Changed to match the correct model name
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("Phone"));
                user.setLocation(rs.getString("Location"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
