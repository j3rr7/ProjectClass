/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorweek8.pkg2;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author User
 */
public class TutorWeek82 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Karakter k = new Karakter(5000,50);
        
        Scanner sc=new Scanner(System.in);
        
        int input=0;
        
        System.out.println("Sebelum diload");
        System.out.println("Atk: "+k.getAtk());
        System.out.println("HP: "+k.getHp());
        
        //deserialize object
        try {
            FileInputStream in = new FileInputStream("karakter.data");
            ObjectInputStream objIn = new ObjectInputStream(in);
            k = (Karakter) objIn.readObject();
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        System.out.println("Setelah diload");
        System.out.println("Atk: "+k.getAtk());
        System.out.println("HP: "+k.getHp());
        
        //serialize object
        try {
            FileOutputStream out = new FileOutputStream("karakter.data");
            ObjectOutputStream objOut = new ObjectOutputStream(out);
            objOut.writeObject(k);
            objOut.close();
            System.out.println("Sukses");
        }catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    
}

class Karakter implements Serializable{
    private int atk,hp;

    public Karakter(int atk, int hp) {
        this.atk = atk;
        this.hp = hp;
    }

    public int getAtk() {
        return atk;
    }

    public int getHp() {
        return hp;
    }

    public void setAtk(int atk) {
        this.atk = atk;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }
}
