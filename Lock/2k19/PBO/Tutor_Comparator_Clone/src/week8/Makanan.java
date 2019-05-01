/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week8;

/**
 *
 * @author User
 */
public class Makanan extends Barang {
    private String expired;
    
    public Makanan(String kb, String namaBarang, int hargaBarang, int jumlah, String ex) {
        super(kb, namaBarang, hargaBarang, jumlah);
        expired=ex;
    }

    public String getExpired() {
        return expired;
    }

    public void setExpired(String expired) {
        this.expired = expired;
    }
    
}
