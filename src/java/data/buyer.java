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
public class buyer {
    int buyer_id;
    String buyer_ad;
    String buyer_soyad;
    String buyer_adress;
    String company_id;

    public buyer(int buyer_id, String buyer_ad, String buyer_soyad, String buyer_adress, String company_id) {
        this.buyer_id = buyer_id;
        this.buyer_ad = buyer_ad;
        this.buyer_soyad = buyer_soyad;
        this.buyer_adress = buyer_adress;
        this.company_id = company_id;
    }

    public int getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) {
        this.buyer_id = buyer_id;
    }

    public String getBuyer_ad() {
        return buyer_ad;
    }

    public void setBuyer_ad(String buyer_ad) {
        this.buyer_ad = buyer_ad;
    }

    public String getBuyer_soyad() {
        return buyer_soyad;
    }

    public void setBuyer_soyad(String buyer_soyad) {
        this.buyer_soyad = buyer_soyad;
    }

    public String getBuyer_adress() {
        return buyer_adress;
    }

    public void setBuyer_adress(String buyer_adress) {
        this.buyer_adress = buyer_adress;
    }

    public String getCompany_id() {
        return company_id;
    }

    public void setCompany_id(String company_id) {
        this.company_id = company_id;
    }
    
}
