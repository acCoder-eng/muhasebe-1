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
public class employe {
    String name;
    String surname;
    String email;
    int rol_id;
    String company_id;

    public employe(String name, String surname, String email,int rol_id, String company_id) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.rol_id = rol_id;
        this.company_id = company_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRol_id(){
        if(rol_id ==1){
            return "işletme sahibi";
        }
        else if(rol_id ==2){
        return "ürün yöneticisi";
        }
         else if(rol_id ==3){
        return "ürün danışmanı";
        }
        return "muhasebe müdürü";
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public String getCompany_id() {
        return company_id;
    }

    public void setCompany_id(String company_id) {
        this.company_id = company_id;
    }
    
}
