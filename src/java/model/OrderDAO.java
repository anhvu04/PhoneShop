/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import utils.DBContext;

/**
 *
 * @author Dash F15
 */
public class OrderDAO extends DBContext {

    public void addOrder(Cart cart, AdminDTO admin) {
        LocalDate localDate = LocalDate.now();
        Date curDate = Date.valueOf(localDate);
        try {
            // insert hóa đơn vào table
            String sql = "insert into [order] values(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, curDate);
            st.setString(2, admin.getUsername());
            st.setDouble(3, cart.totalCartMoney());
            st.executeUpdate();

            //lấy ra orderId vừa được add vào
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            // thêm vào bảng orderdetail
            if (rs.next()) {
                int oid = rs.getInt(1);
                for (Item i : cart.getListItems()) {
                    String sql2 = "insert into orderdetail values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setString(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
