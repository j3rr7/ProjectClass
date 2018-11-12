    while (snakex[0]!=0 && snakex[0]!=39 && snakey[0]!= 0 && snakey[0]!= 19)
    {
        for (int i = 0 ;i < 20; i++)
        {
            for (int j = 0 ; j < 40 ; j++)
            {
                if (i==0||i==19)
                { 
                    map1[i][j] = '-';
                }
                else if (j==0||j==39) 
                {
                    map1[i][j] = '|';
                }
                else
                {
                    map1[i][j] = ' ';
                }
                for (int k = 0 ;k<5;k++)
                {
                    if (i==random_posy_makanan[k]&&j==random_posx_makanan[k]) 
                    {
                        map1[i][j] = '0';
                    }     
                     
                }
                for (int l=panjang; l>0;l--) 
                {
                    snakex[l] = snakex[l-1];
                    snakey[l] = snakey[l-1];
                }
                for (int m = 0 ; m <=panjang;m++) 
                {
                    map1[snakey[l]][snakex[l]] = '%';
                }
                if (kbhit())
                {
                    keyboard = getch();
                }
                if (keyboard=='w'||keyboard=='W')
                {
                    snakey[0]--;
                }
                if (keyboard=='s'||keyboard=='S') 
                {    
                    snakey[0]++;
                }
                if (keyboard=='a'||keyboard=='A')
                {
                    snakex[0]--;
                }
                if (keyboard=='d'||keyboard=='D') 
                {    
                    snakex[0]++;
                }
                for (int n = 0 ; n < 20;n++) 
                {    
                    for (int o = 0 ; o < 40 ;o++) 
                    {
                    cout << map1[n][o];
                    }
                cout << "\n";
                }
                if (map1[0][0]==map1[random_posy_makanan][random_posx_makanan])
                {
                    panjang++;
                    random_posx_makanan = 1+rand()%38;
                    score = score+1;
                }
            for (int nabrak = 1; nabrak < panjang ; nabrak++) 
                if (snakex[0]==snakex[nabrak]&&snakey[0]==snakey[nabrak]) 
                    snakex[0] = 0;
                 
             
                 
             
        Sleep(100);
        system("cls");
    }