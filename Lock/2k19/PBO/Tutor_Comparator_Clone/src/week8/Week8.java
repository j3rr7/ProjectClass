/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week8;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Week8 {

    public static void main(String[] args) {
        
        //Barang b=new Barang(); ==> error krn Barang cannot be instantiated krn abstract
        ArrayList<Barang> arr=new ArrayList<Barang>();
        arr.add(new Makanan("B01","Indomie Seleraku",1000,100,"10/10/2019"));
        arr.add(new Makanan("B02","Fanta",15000,50,"10/05/2019"));
        arr.add(new Makanan("B03","Lays",7500,20,"02/10/2019"));
        arr.add(new Elektronik("E01","Hairdryer",500000,100,12));
        arr.add(new Elektronik("E02","Oven",250000,30,24));
        
        System.out.println("Urutkan dengan compareTo");
        Collections.sort(arr);
        for (Barang b:arr) {
            System.out.println(b);
        }
        System.out.println("");
        
        System.out.println("Urutkan dengan BarangComparatorAsc");
        Collections.sort(arr,Barang.BarangComparatorAsc); 
        for (Barang b:arr) {
            System.out.println(b);
        }
        System.out.println("");
        
        Barang b1=arr.get(0);
        Barang b2=b1;   //object reference, bukan cloning --> b2 hanyalah nama lain dari b1
        System.out.println(b1);
        System.out.println(b2);
        
        Barang b3=null;
        try {
            b3=(Barang)b1.clone();
        } catch (CloneNotSupportedException ex) {
            //jk cloning gagal
            System.out.println("Cloning gagal");
            Logger.getLogger(Week8.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        b3.setJumlah(369);
        System.out.println(b3);
    }
    
}
