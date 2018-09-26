#include <iostream>

using namespace std;

int main()
{
    int in,men,j;

    cout << "Masukan angka awal = ";
    cin >> in;
    cout << "1. Lawan AI" << endl;
    cout << "2. Lawan Player" <<endl;
    cout << "Pilihan";
    cin >> men;
    if(men==2)
    {
        int p1,p2,a,b,c,k;
        p1=0;
        p2=0;
        j=0;
    while(j<=in)
    {
        j++;
    if(in>=0 && j%2==1)
    {

        for(int i=1; i<=in-(p1+p2);i++)
        {

            if(i==1+p1+p2 || i==1+p1+p2)
            {
                cout <<"|__" <<in-(p1+p2)<<"__|";
            }
            for(int j=1; j<=8; j++)
            {
            if(j==1 && i!=1 || j==8 && i!=1)
            {
                cout << "|";
            }
            else if(i!=1)
            {
                cout << "_";
            }
        }
        cout << endl;
    }
    cout << "p1 turun = ";
    cin >> a;
    if(a==1 || a==3 || a==4)
        p1=p1+a;
    else
        j=j-2;
        }
    if(in>=0 && j%2==0)
        {
    for(int i=1; i<=in-(p1+p2);i++)
    {
            if(i==1+p1+p2 || i==1+p1+p2)
            {
                cout  <<"|__" <<in-(p1+p2)<<"__|";
            }
        for(int j=1; j<=8; j++)
        {
            if(j==1 && i!=1 || j==8 && i!=1)
            {
                cout << "|";
            }
            else if(i!=1)
            {
                cout << "_";
            }
        }
        cout << endl;
    }
    cout << "p2 turun = ";
    cin >> b;
    if(b==1 || b==3 || b==4)
        p2=p2+a;
    else
        j=j-1;
        }
    }
    }
    return 0;
}
