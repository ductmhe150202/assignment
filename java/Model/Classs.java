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
public class Classs {
    private int ClassID;
    private String ClassName;

    public int getClassID() {
        return ClassID;
    }

    public void setClassID(int ClassID) {
        this.ClassID = ClassID;
    }

    public String getClassName() {
        return ClassName;
    }

    public void setClassName(String ClassName) {
        this.ClassName = ClassName;
    }

    @Override
    public String toString() {
        return "Classs{" + "ClassID=" + ClassID + ", ClassName=" + ClassName + '}';
    }
    
}
