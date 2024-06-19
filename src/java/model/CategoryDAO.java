/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBContext;

/**
 *
 * @author Dash F15
 */
public class CategoryDAO extends DBContext {

    public List<CategoryDTO> getAllCategories() {
        List<CategoryDTO> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CategoryDTO c = new CategoryDTO();
                c.setId(rs.getString(1));
                c.setName(rs.getString(2));
                c.setDescribe(rs.getString(3));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public CategoryDTO getCategoryById(int id) {
        String sql = "select * from categories where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                CategoryDTO c = new CategoryDTO();
                c.setId(rs.getString(1));
                c.setName(rs.getString(2));
                c.setDescribe(rs.getString(3));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        CategoryDAO c = new CategoryDAO();
        List<CategoryDTO> list = c.getAllCategories();
        System.out.println(list.get(3).getName());
    }

}
