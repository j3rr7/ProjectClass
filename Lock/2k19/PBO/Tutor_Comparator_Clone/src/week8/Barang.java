/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week8;

import java.util.Comparator;

/**
 *
 * @author User
 */

//abstract: tdk pernah dicreate objectnya, dibuat hanya untuk strukturnya saja
public /*abstract*/ class Barang implements Comparable<Barang>, Cloneable {
    protected String kodeBarang, namaBarang;
    protected int hargaBarang;
    protected int jumlah;

    public Barang(String kb, String namaBarang, int hargaBarang, int jumlah) {
        this.namaBarang = namaBarang;
        this.hargaBarang = hargaBarang;
        this.jumlah = jumlah;
        kodeBarang=kb;
    }

    public String getKodeBarang() {
        return kodeBarang;
    }

    public void setKodeBarang(String kodeBarang) {
        this.kodeBarang = kodeBarang;
    }

    public String getNamaBarang() {
        return namaBarang;
    }

    public void setNamaBarang(String namaBarang) {
        this.namaBarang = namaBarang;
    }

    public int getHargaBarang() {
        return hargaBarang;
    }

    public void setHargaBarang(int hargaBarang) {
        this.hargaBarang = hargaBarang;
    }

    public int getJumlah() {
        return jumlah;
    }

    public void setJumlah(int jumlah) {
        this.jumlah = jumlah;
    }
    
    @Override
    public int compareTo(Barang t) {
        //mengembalikan selisih antara 2 object
        
        //berdasarkan stock
        //return jumlah-t.jumlah; //asc
        //return t.jumlah-jumlah; //desc
        
        //bdk harga, asc
        //return hargaBarang-t.hargaBarang;
        
        //bdk nama, asc
        //return namaBarang.compareTo(t.namaBarang);
        
        //bdk nama, desc
        return t.namaBarang.compareTo(namaBarang);
    }
    
    @Override
    public String toString() {
        return kodeBarang+ " "+namaBarang+" "+hargaBarang+" "+jumlah;
    }
    
    public static Comparator<Barang> BarangComparatorAsc=new Comparator<Barang>() {
        public int compare(Barang b1, Barang b2) {
            return b1.namaBarang.compareTo(b2.namaBarang);
        }
    };
    
    public static Comparator<Barang> BarangComparatorDesc=new Comparator<Barang>() {
        public int compare(Barang b1, Barang b2) {
            return b2.namaBarang.compareTo(b1.namaBarang);
        }
    };

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone(); //To change body of generated methods, choose Tools | Templates.
    }
    
}
