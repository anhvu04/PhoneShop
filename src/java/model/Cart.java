/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dash F15
 */
public class Cart {

    private List<Item> listItems;

    public Cart() {
        listItems = new ArrayList<>();
    }

    public Cart(List<Item> list) {
        this.listItems = list;
    }

    public List<Item> getListItems() {
        return listItems;
    }

    public void setListItems(List<Item> listItems) {
        this.listItems = listItems;
    }

//    lấy sản phẩm qua id
    public Item getItemById(String id) {
        for (Item i : listItems) {
            if (i.getProduct().getId().trim().equals(id.trim())) {
                return i;
            }
        }
        return null;
    }

//    lấy số lượng của sản phẩm 
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }

//   thêm item vào giỏ hàng
    public void addItem(Item i) {
        // có trong danh sách giỏ hàng rồi
        if (getItemById(i.getProduct().getId()) != null) {
            Item t = getItemById(i.getProduct().getId());
            t.setQuantity(t.getQuantity() + i.getQuantity());
        } else {
            // chưa có trong danh sách giỏ hàng
            listItems.add(i);
        }
    }

//    xóa item khỏi giỏ hàng
    public void deleteItem(String id) {
        if (getItemById(id) != null) {
            listItems.remove(getItemById(id));
        }
    }

//   tổng tiền của giỏ hàng
    public double totalCartMoney() {
        double total = 0;
        for (Item i : listItems) {
            total += i.getPrice() * i.getQuantity();
        }
        return total;
    }
}
