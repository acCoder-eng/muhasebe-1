/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author qosmio
 */
public class product {
    int product_id;
    String product_name;
    String company_id;
    int cost;
    int piece;
    int sell_cost;
    float total_price;
    int amount;

    public product(int product_id, String product_name, String company_id, int cost, int piece, int sell_cost, float total_price, int amount) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.company_id = company_id;
        this.cost = cost;
        this.piece = piece;
        this.sell_cost = sell_cost;
        this.total_price = total_price;
        this.amount = amount;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getCompany_id() {
        return company_id;
    }

    public void setCompany_id(String company_id) {
        this.company_id = company_id;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public int getPiece() {
        return piece;
    }

    public void setPiece(int piece) {
        this.piece = piece;
    }

    public int getSell_cost() {
        return sell_cost;
    }

    public void setSell_cost(int sell_cost) {
        this.sell_cost = sell_cost;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

   
}
