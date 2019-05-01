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
public class Elektronik extends Barang implements BisaRetur{
    private int garansi;    //dalam bulan
    
    public Elektronik(String kb, String namaBarang, int hargaBarang, int jumlah,int g) {
        super(kb, namaBarang, hargaBarang, jumlah);
        garansi=g;
    }

    public int getGaransi() {
        return garansi;
    }

    public void setGaransi(int garansi) {
        this.garansi = garansi;
    }

    @Override   //memastikan ada method yang dioverride di induk/interface
    public void retur(int jumlah) {
        this.jumlah=this.jumlah-jumlah;
    }

    @Override
    public void terima(int jumlah) {
        this.jumlah=this.jumlah+jumlah;
    }
    
}
