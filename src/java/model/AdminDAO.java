/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBContext;

/**
 *
 * @author Dash F15
 */
public class AdminDAO extends DBContext {

    public AdminDTO checkLogin(String username, String password) {
        String sql = "select * from admin where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AdminDTO a = new AdminDTO();
                a.setUsername(rs.getString(1));
                a.setPassword(rs.getString(2));
                a.setRole(rs.getString(3));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public AdminDTO checkExist(String usermame) {
        String sql = "select * from admin where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, usermame);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AdminDTO a = new AdminDTO();
                a.setUsername(rs.getString(1));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean addUser(String username, String password) {
        String sql = "insert into admin values(?,?,?)";
        boolean check = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, "2");
            check = st.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }

    public boolean changePass(String username, String password) {
        String sql = "update admin set password = ? where username = ?";
        boolean check = false;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            check = st.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return check;
    }
}
