#include <iostream>
#include <windows.h>
#include <conio.h>
#include <time.h>
using namespace std;

int main()
{
    int score,highscore;
    int game=1;
    while (game==1)
    {
    srand(time(0));
    score=0;
    int fx1=(rand()-1)%38+1, fy1=(rand()-1)%18+1;
    int fx2=(rand()-1)%38+1, fy2=(rand()-1)%18+1;
    int fx3=(rand()-1)%38+1, fy3=(rand()-1)%18+1;
    int fx4=(rand()-1)%38+1, fy4=(rand()-1)%18+1;
    int fx5=(rand()-1)%38+1, fy5=(rand()-1)%18+1;
    int mx1=(rand()-1)%38+1, my1=(rand()-1)%18+1;
    int mx2=(rand()-1)%38+1, my2=(rand()-1)%18+1;
    int mx3=(rand()-1)%38+1, my3=(rand()-1)%18+1;
    int lx=(rand()-1)%38+1, ly=(rand()-1)%18+1;
    int chanc1, chanc2, chanc3;
    int m1,m2,m3,sec=0,k1=6,k2=8,k3=5;
    int x[1000];
    int y[1000];
    x[0]=10;// awal snake, haruse acak msh lom ngerti tpi yake ngene gpp
    y[0]=10;
    x[1]=9;
    y[1]=10;
    x[2]=8;
    y[2]=10;
    int ular=3 ;
    string a[80][40];
    char ctr='d';
    while (x[0]!=0 && x[0]!=39 && y[0]!=0 && y[0]!=19 )
    {
        for (int i=0;i<20;i++)
        {
            for (int j=0;j<40;j++)
            {
                if ( j==0 || j==39 || i==0 || i==19)
                     a[i][j]="*";
                else
                     a[i][j]=" ";
            }
        }
        a[fy1][fx1]="o";
        a[fy2][fx2]="o";
        a[fy3][fx3]="o";
        a[fy4][fx4]="o";
        a[fy5][fx5]="o";
        a[my1][mx1]="M";
        a[my2][mx2]="M";
        a[my3][mx3]="M";
        a[ly][lx]="L";
        m1=rand()%4+1;
        sec++;
        if(m1==1 && my1>1)
            my1--;
        else if(m1==2 && my1<18)
            my1++;
        else if(m1==3 && mx1<39)
            mx1++;
        else if(m1==4 && mx1>1)
            mx1--;
        m2=rand()%4+1;
        if(m2==1 && my2>1)
            my2--;
        else if(m2==2 && my2<18)
            my2++;
        else if(m2==3 && mx2<39)
            mx2++;
        else if(m2==4 && mx2>1)
            mx2--;
        m3=rand()%4+1;
        if(m3==1 && my3>1)
            my3--;
        else if(m3==2 && my3<18)
            my3++;
        else if(m3==3 && mx3<39)
            mx3++;
        else if(m3==4 && mx3>1)
            mx3--;
        if(sec==10)
        {
            chanc1=rand()%2;
            chanc2=rand()%2;
            chanc3=rand()%2;
            sec=0;
        }
        if(chanc1==1 && k1==0)
        {
            a[my1][mx1]=k1;
            k1--;
            if(k1==0)
                chanc1=0;
        }
        if(chanc2==1 && k2==0)
        {
            a[my2][mx2]=k2;
            k2--;
            if(k1==0)
                chanc2=0;
        }
        if(chanc3==1 && k3==0)
        {
            a[my3][mx3]=k3;
            k3--;
            if(k3==0)
                chanc3=0;
        }
        for(int s=ular;s>0;s--)
        {
            x[s]=x[s-1];//badan snake
            y[s]=y[s-1];
        }
        for (int r=0;r<=ular;r++)
        {
            a[y[r]][x[r]]="%";
        }
        if (kbhit())
        {
            ctr=getch();
        }
        a[y[0]][x[0]]="*";
        if(ctr=='w')
            y[0]--;
        if(ctr=='s')
            y[0]++;
        if(ctr=='a')
            x[0]--;
        if(ctr=='d')
            x[0]++;
        for(int m=0;m<20;m++)
        {
            for (int n=0;n<40;n++)
            {
                cout << a[m][n];
            }
        cout <<endl;
        }
        if(a[0][0]==a[ly][lx])
         {
             game=2;
         }
        else if (a[0][0]==a[fy1][fx1])
        {
            ular++;
            fy1=rand()%19;
            if (fy1%19==0)
                fy1++;
            fx1=rand()%19;
            if (fx1%19==0)
                fx1++;
            score=score+1;
         }
         else if (a[0][0]==a[fy2][fx2])
        {
            ular++;
            fy2=rand()%19;
            if (fy2%19==0)
                fy2++;
            fx2=rand()%19;
            if (fx2%19==0)
                fx2++;
            score=score+1;
         }
         else if (a[0][0]==a[fy3][fx3])
        {
            ular++;
            fy3=rand()%19;
            if (fy3%19==0)
                fy3++;
            fx3=rand()%19;
            if (fx3%19==0)
                fx3++;
            score=score+1;
         }
         else if (a[0][0]==a[fy4][fx4])
        {
            ular++;
            fy4=rand()%19;
            if (fy4%19==0)
                fy4++;
            fx4=rand()%19;
            if (fx4%19==0)
                fx4++;
            score=score+1;
         }
         else if (a[0][0]==a[fy5][fx5])
        {
            ular++;
            fy5=rand()%19;
            if (fy5%19==0)
                fy5++;
            fx5=rand()%19;
            if (fx5%19==0)
                fx5++;
            score=score+1;
         }
        for (int gh=1;gh<ular;gh++) //Ni snake mati klo nyentuh ndiri, di Internet :'v, haruse kan kepotong blm th
        {
            if (x[0]==x[gh] && y[0]==y[gh] )
            {
                x[0]=0;
            }
        }
    Sleep(100);
    system("cls");
    }
    cout << "GAMEOVER!" <<endl;
    cout << "Score = " << score<<endl;
    if (score > highscore)
    {
        highscore=score;
    }
    cout << "High Score = "<<highscore<<endl;
    cout << "Play Again? (1/0)"; cin >>game;
    }
    while (game==2)
    {
    srand(time(0));
    score=0;
    int fx1=(rand()-1)%78+1, fy1=(rand()-1)%18+1;
    int fx2=(rand()-1)%78+1, fy2=(rand()-1)%18+1;
    int fx3=(rand()-1)%78+1, fy3=(rand()-1)%18+1;
    int fx4=(rand()-1)%78+1, fy4=(rand()-1)%18+1;
    int fx5=(rand()-1)%78+1, fy5=(rand()-1)%18+1;
    int mx1=(rand()-1)%78+1, my1=(rand()-1)%18+1;
    int mx2=(rand()-1)%78+1, my2=(rand()-1)%18+1;
    int mx3=(rand()-1)%78+1, my3=(rand()-1)%18+1;
    int lx=(rand()-1)%78+1, ly=(rand()-1)%18+1;
    int chanc1, chanc2, chanc3;
    int m1,m2,m3,sec=0,k1=6,k2=8,k3=5;
    int x[1000];
    int y[1000];
    x[0]=10;// awal snake, haruse acak msh lom ngerti tpi yake ngene gpp
    y[0]=10;
    x[1]=9;
    y[1]=10;
    x[2]=8;
    y[2]=10;
    int ular=3 ;
    string a[80][80];
    char ctr='d';
    while (x[0]!=0 && x[0]!=79 && y[0]!=0 && y[0]!=19)
    {
        for (int i=0;i<20;i++)
        {
            for (int j=0;j<80;j++)
            {
                if ( j==0 || j==79 || i==0 || i==19)
                     a[i][j]="*";
                else
                     a[i][j]=" ";
            }
        }
        a[fy1][fx1]="o";
        a[fy2][fx2]="o";
        a[fy3][fx3]="o";
        a[fy4][fx4]="o";
        a[fy5][fx5]="o";
        a[my1][mx1]="M";
        a[my2][mx2]="M";
        a[my3][mx3]="M";
        m1=rand()%4+1;
        sec++;
        if(m1==1 && my1>1)
            my1--;
        else if(m1==2 && my1<18)
            my1++;
        else if(m1==3 && mx1<79)
            mx1++;
        else if(m1==4 && mx1>1)
            mx1--;
        m2=rand()%4+1;
        if(m2==1 && my2>1)
            my2--;
        else if(m2==2 && my2<18)
            my2++;
        else if(m2==3 && mx2<79)
            mx2++;
        else if(m2==4 && mx2>1)
            mx2--;
        m3=rand()%4+1;
        if(m3==1 && my3>1)
            my3--;
        else if(m3==2 && my3<18)
            my3++;
        else if(m3==3 && mx3<79)
            mx3++;
        else if(m3==4 && mx3>1)
            mx3--;
        if(sec==10)
        {
            chanc1=rand()%2;
            chanc2=rand()%2;
            chanc3=rand()%2;
            sec=0;
        }
        if(chanc1==1 && k1==0)
        {
            a[my1][mx1]=k1;
            k1--;
            if(k1==0)
                chanc1=0;
        }
        if(chanc2==1 && k2==0)
        {
            a[my2][mx2]=k2;
            k2--;
            if(k1==0)
                chanc2=0;
        }
        if(chanc3==1 && k3==0)
        {
            a[my3][mx3]=k3;
            k3--;
            if(k3==0)
                chanc3=0;
        }
        for(int s=ular;s>0;s--)
        {
            x[s]=x[s-1];//badan snake
            y[s]=y[s-1];
        }
        for (int r=0;r<=ular;r++)
        {
            a[y[r]][x[r]]="%";
        }
        if (kbhit())
        {
            ctr=getch();
        }
        a[y[0]][x[0]]="*";
        if(ctr=='w')
            y[0]--;
        if(ctr=='s')
            y[0]++;
        if(ctr=='a')
            x[0]--;
        if(ctr=='d')
            x[0]++;
        for(int m=0;m<20;m++)
        {
            for (int n=0;n<80;n++)
            {
                cout << a[m][n];
            }
        cout <<endl;
        }
        if (a[0][0]==a[fy1][fx1])
        {
            ular++;
            fy1=rand()%19;
            if (fy1%19==0)
                fy1++;
            fx1=rand()%19;
            if (fx1%19==0)
                fx1++;
            score=score+1;
         }
         else if (a[0][0]==a[fy2][fx2])
        {
            ular++;
            fy2=rand()%19;
            if (fy2%19==0)
                fy2++;
            fx2=rand()%19;
            if (fx2%19==0)
                fx2++;
            score=score+1;
         }
         else if (a[0][0]==a[fy3][fx3])
        {
            ular++;
            fy3=rand()%19;
            if (fy3%19==0)
                fy3++;
            fx3=rand()%19;
            if (fx3%19==0)
                fx3++;
            score=score+1;
         }
         else if (a[0][0]==a[fy4][fx4])
        {
            ular++;
            fy4=rand()%19;
            if (fy4%19==0)
                fy4++;
            fx4=rand()%19;
            if (fx4%19==0)
                fx4++;
            score=score+1;
         }
         else if (a[0][0]==a[fy5][fx5])
        {
            ular++;
            fy5=rand()%19;
            if (fy5%19==0)
                fy5++;
            fx5=rand()%19;
            if (fx5%19==0)
                fx5++;
            score=score+1;
         }
        for (int gh=1;gh<ular;gh++) //Ni snake mati klo nyentuh ndiri, di Internet :'v, haruse kan kepotong blm th
        {
            if (x[0]==x[gh] && y[0]==y[gh] )
            {
                x[0]=0;
            }
        }
    Sleep(100);
    system("cls");
    }
    cout << "GAMEOVER!" <<endl;
    cout << "Score = " << score<<endl;
    if (score > highscore)
    {
        highscore=score;
    }
    cout << "High Score = "<<highscore<<endl;
    cout << "Play Again? (1/0)"; cin >>game;
    }
    return 0;
}
