#include <iostream>
#include <string>
#include <conio.h>
#include <vector>
#include <windows.h>
#include <cstdlib>
#include <time.h>


using namespace std;

int main()
{
    bool mapp,up=false,le=false,ri=false,dow=false;
    char map[20][80],pa;
    char cou[6][1]={{'6'}, {'5'}, {'4'}, {'3'}, {'2'}, {'1'}};
    srand(time(0));
    int x1=rand()&37+2,a1,chanc,z=0,x=1,xp,yp,game=1;
    int f1=rand()&36+2, f2=rand()&36+1, f3=rand()&36+2, f4=rand()&36+2, f5=rand()&36+2;
    int g1=rand()%17+2, g2=rand()%17+2, g3=rand()%17+2, g4=rand()%17+2, g5=rand()%17+2, lx=rand()%37+2, ly=rand()%17+1;
    int rx=rand()%37+2, ry=rand()%17+1, wx=rand()%37+2, wy=rand()%17+1;
    xp=rand()%37+2;
    yp=rand()%17+1;
    int y1=5%17+2;
do {

    if(mapp==false){
        for (int i = 0; i < 20; i++){
            for (int j = 0; j< 40; j++){
                if (i==0||i==19||j==0||j==39){
                    map[i][j] = '#';
                }
                else
                    map[i][j] = ' ';
                }
            }
        }
    if(x==1){
        map[y1][x1]='M';
        a1=rand()%4+1;
        if(a1==1 && y1>1)
            y1--;
        else if(a1==2 && y1<18)
            y1++;
        else if(a1==3 && x1<38)
            x1++;
        else if(a1==4 && x1>1)
            x1--;
        map[yp][xp]='*';
        map[g1][f1]='o';
        map[g2][f2]='o';
        map[g3][f3]='o';
        map[g4][f4]='o';
        map[g5][f5]='o';
        map[ly][lx]='L';
        map[ry][rx]='R';
        map[wy][wx]='W';
        if(ly==yp && lx==xp){
            mapp = !mapp;
        }

    else if(x==0){
//        for(int k=0; k<6; k++)
//        {
//            map[y1][x1]=cou[k][0];
//        }/
            map[y1][x1]='6';
        a1=rand()%4+1;
        if(a1==1 && y1>1)
            y1--;
        else if(a1==2 && y1<18)
            y1++;
        else if(a1==3 && x1<38)
            x1++;
        else if(a1==4 && x1>1)
            x1--;
        map[yp][xp]='*';
        map[g1][f1]='o';
        map[g2][f2]='o';
        map[g3][f3]='o';
        map[g4][f4]='o';
        map[g5][f5]='o';
        map[ly][lx]='L';
        map[ry][rx]='R';
        map[wy][wx]='W';
        if(ly==yp && lx==xp)
            mapp = !mapp;
        }
    if(up==true)
        yp--;
    else if(ri==true)
        xp++;
    else if(le==true)
        xp--;
    else if(dow==true)
        yp++;
    if(xp==39 || xp==0 || yp==0 || yp==19)
        game=0;
    z++;
    if(z==30)
    {
        chanc=rand()%2+1;
        if(chanc==1)
        {
            x=0;
            z=31;
        }
        else
        {
            x=1;
            z=0;
        }
    }
        for (int i = 0; i < 20; i++ ){
            for (int j = 0; j < 40; j++ ){
                cout << map[i][j];
            }
            cout << endl;
        }
    }
    else if (mapp){
        for (int i = 0; i < 20; i++){
            for (int j = 0; j < 80; j++){
                if (i==0||i==19||j==0||j==79){
                    map[i][j] = '#';
                }
                else {
                    map[i][j] = ' ';
                }
            }
        }
        for (int i = 0; i < 20; i++){
            for (int j = 0; j < 80; j++){
                cout << map[i][j];
            }
            cout << endl;
        }

    }

    if (kbhit()){
        pa = getch();
        if(pa=='w')
        {
            up=true;
            le=false;
            ri=false;
            dow=false;
        }
        else if(pa=='a')
        {
            up=false;
            le=true;
            ri=false;
            dow=false;
        }
        else if(pa=='s')
        {
            up=false;
            le=false;
            ri=false;
            dow=true;
        }
        else if(pa=='d')
        {
            up=false;
            le=false;
            ri=true;
            dow=false;
        }
       // else if(pa==' ')

        else if(pa==0)
            game=0;

    }
Sleep(100);
system("cls");
} while (game==1);
if(game==0)
    cout << "You Lose";
    return 0;
}
