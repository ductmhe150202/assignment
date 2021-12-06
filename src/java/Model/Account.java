/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ductm
 */
public class Account {
    private String Username;
    private String Password;
    private String Name;
    private Boolean IsAdmin;    

    public Account() {
    }

    public Account(String Username, String Password, String Name, Boolean IsAdmin) {
        this.Username = Username;
        this.Password = Password;
        this.Name = Name;
        this.IsAdmin = IsAdmin;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public Boolean getIsAdmin() {
        return IsAdmin;
    }

    public void setIsAdmin(Boolean IsAdmin) {
        this.IsAdmin = IsAdmin;
    }
}
