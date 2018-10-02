#include <iostream>

using namespace std;

int main()
{
    cout <<"LAHIR: ";
    int lahir;
    cin >> lahir;
    cout <<"SEKARANG: ";
    int sekarang;
    cin >> sekarang;

    int tgl1,bln1,thn1,tgl2,bln2,thn2;

    tgl1 = lahir/1000000;
    bln1 = lahir/10000%100;
    thn1 = lahir%10000;
    tgl2 = sekarang/1000000;
    bln2 = sekarang/10000%100;
    thn2 = sekarang%10000;

    if (tgl2>=tgl1){
        if (bln2>=bln1){
            cout<<thn2-thn1<<"\n";
        }
        else {
            cout << thn2-thn1-1<<"\n";
        }
    }
    else if (tgl2>=tgl1){
        if (bln2<=bln1){
            cout<<thn2-thn1<<"\n";
            }
        else {
            cout << thn2-thn1-1<<"\n";
        }
    }
    else {
        cout << thn2-thn1<<endl;
    }
    return 0;
}
