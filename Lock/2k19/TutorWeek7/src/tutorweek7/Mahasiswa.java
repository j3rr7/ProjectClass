/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorweek7;

/**
 *
 * @author User
 */

//ini hanya class biasa
public class Mahasiswa {
    private String nama, jurusan;
    private int nilai, jumlahSks;

    public Mahasiswa(String nama, String jurusan, int nilai, int jumlahSks) {
        this.nilai = nilai;
        this.jurusan = jurusan;
        this.nama = nama;
        this.jumlahSks = jumlahSks;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public int getNilai() {
        return nilai;
    }

    public void setNilai(int nilai) {
        this.nilai = nilai;
    }

    public String getJurusan() {
        return jurusan;
    }

    public void setJurusan(String jurusan) {
        this.jurusan = jurusan;
    }

    public int getJumlahSks() {
        return jumlahSks;
    }

    public void setJumlahSks(int jumlahSks) {
        this.jumlahSks = jumlahSks;
    }

    @Override
    public String toString() {
        return nama + " - " + jurusan + " - " + nilai + " - " + jumlahSks;
    }
    
}
