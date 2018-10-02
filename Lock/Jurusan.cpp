#include <iostream>

using namespace std;

int main()
{
    int nrp;
    cout << "Masukkan NRP: ";
    cin >> nrp;

    int noangkatan = nrp/1000000;
    int nojurusan = nrp/10000%100;
    int nourut = nrp%10000;

    int tahun = noangkatan/100;
    int tahun2 = noangkatan%100;
    int tNew1 = (noangkatan/100)*1000+tahun2;
    int tNew2 = (noangkatan/100)*1900+tahun2;

    if (tahun==2){
        cout << "Angkatan= "<<tNew1<<endl;
    } else if (tahun==1) {
        cout << "Angkatan= "<<tNew2<<endl;
    }
	
    if (nojurusan==01){
        cout << "Jurusan: D3 INF";
    } else if (nojurusan==10){
        cout << "Jurusan: S1 ELK";
    } else if (nojurusan==11){
        cout << "Jurusan: S1 INF";
    } else if (nojurusan==12){
        cout << "Jurusan: S1 IND";
    } else if (nojurusan==14){
        cout << "Jurusan: S1 DESP";
    } else if (nojurusan==17){
        cout << "Jurusan: S1 DKV";
    } else if (nojurusan==18) {
        cout << "Jurusan: S1 SIB";
    }
	else {
		cout << "Kok jurusannya beda ya :V"<<endl;
	}
    cout << "\n" << "Nomor: "<<nourut<<endl;
    return 0;
}
