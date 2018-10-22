#include <iostream>
#include <string>
#include <windows.h>
#include <conio.h>

using namespace std;

int main()
{
    int px=1,py=1;
    int kx=5,ky=1;
    string Move;
    char maze[7][7] =
    {
        {'+','-','-','-','-','-','+'},
        {'|',' ','|',' ','|','*','|'},
        {'|',' ','|','-','|',' ','|'},
        {'|',' ',' ',' ',' ',' ','|'},
        {'|','-',' ','-','-','-','|'},
        {'|',' ',' ','|',' ',' ','|'},
        {'+','-','-','-','-','-','+'},
    };
while (true){
    for(int i = 0;i<7;i++){
        for (int j = 0 ; j<7 ; j++){
            if (i==py&&j==px){
                cout << "P";
            }
            else if (i==5&&j==5){
                cout << "D";
            }
            else {
                cout << maze[i][j];
            }
            if (px==5&&py==5){
                system("cls");
                cout << "You Win!!!";
                cin >> Move;
            }
        }
        cout << "\n";
    }
    if (py==ky&&px==kx){
        maze[1][5]= ' ';
        maze[5][3]= ' ';
    }
    if (py==5&&px==2){

    }
    cin >> Move;
    if (Move == "w"&&py!=1){
        py-=1;
    }
    else if (Move == "a"&&px!=1){
        px-=1;
    }
    else if (Move == "s"&&py!=5){
        py+=1;
    }
    else if (Move == "d"&&px!=5){
        px+=1;
    }
    system("cls");
}
    return 0;
}
