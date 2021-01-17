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
public class bill {
    int bill_id;
    String seller_id;
    int buyer_id;
    int bill_cost;
    int paid_cost;
    String buyer_name;
    String buyer_location;

    public bill(int bill_id, String seller_id, int buyer_id, int bill_cost, int paid_cost, String buyer_name, String buyer_location) {
        this.bill_id = bill_id;
        this.seller_id = seller_id;
        this.buyer_id = buyer_id;
        this.bill_cost = bill_cost;
        this.paid_cost = paid_cost;
        this.buyer_name = buyer_name;
        this.buyer_location = buyer_location;
    }


    
    
    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }
    
    public String getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(String seller_id) {
        this.seller_id = seller_id;
    }

    public int getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) {
        this.buyer_id = buyer_id;
    }

    public int getBill_cost() {
        return bill_cost;
    }

    public void setBill_cost(int bill_cost) {
        this.bill_cost = bill_cost;
    }

    public int getPaid_cost() {
        return paid_cost;
    }

    public void setPaid_cost(int paid_cost) {
        this.paid_cost = paid_cost;
    }

    public String getBuyer_name() {
        return buyer_name;
    }

    public void setBuyer_name(String buyer_name) {
        this.buyer_name = buyer_name;
    }

    public String getBuyer_location() {
        return buyer_location;
    }

    public void setBuyer_location(String buyer_location) {
        this.buyer_location = buyer_location;
    }
    
    
}
