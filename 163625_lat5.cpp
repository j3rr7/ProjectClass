#include<iostream>
using namespace std;
int main () {
    int gmt2 , jam,hari,tgl,bln,th,gmt1,inp3;
    cout<<"input 1:";
    cin>>gmt1;
    cout<<"input 2:";
    cin>>jam>>gmt2;
    cout<<"input 3:";
    cin>>inp3;

    tgl = inp3/1000000;
    bln = inp3 / 10000 % 10;
    th = inp3 % 10000;

    cout <<tgl <<endl << bln<< endl<<th<< endl<<endl;

    gmt1= gmt1 + (gmt2* -1);
    jam = jam + gmt1;

    if (jam>=24){
        jam = jam-24;
        cout<< "jam :" <<jam << endl << "1" << endl;
        if(tgl==31 && bln==12){
            tgl = 1;
            bln = bln % 12;
            th = th + 1;
        }else if (tgl==30 && bln==4 || bln ==6 || bln ==9 || bln ==11){
            tgl = 1;
            bln = bln + 1;
        }else if (tgl==29 && bln==2){
            tgl = 1;
            bln = bln + 1;
        }else if (tgl==31 && bln!=4 || bln !=6 || bln !=9 || bln !=11 || bln!=2 || bln!=12){
            tgl = 1;
            bln = bln + 1;
        }else{
            tgl=tgl+1;
        }
    }else if (jam<=0 && tgl == 1){
        jam = 24 + jam ;
        cout << "jam :" << jam << endl << "-1" << endl ;
        if (bln==1){
            tgl = 31;
            bln = 12;
            th = th - 1;
        }else if (bln==3){
            tgl = 29;
            bln = 2;
        }else if (bln == 5 || bln == 7 || bln == 10 || bln == 12){
            tgl = 30;
            bln = bln - 1;
        }else{
            tgl = 31;
            bln = bln - 1;
        }
    }else if (jam<=0){
        jam = 24 + jam ;
        tgl = tgl -1;
        cout << "jam :" << jam << endl << -1 << endl ;
    }else if ( jam>0 && jam<24){
        cout <<"jam :" << jam <<endl<<"0"<<endl;
    }
    cout << tgl <<"/"<< bln <<"/" << th;

}
