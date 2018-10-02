#include <iostream>
#include <cstdlib>
#include <time.h>

using namespace std;

int main()
{
    //agar randoman mselalu berbeda setiap di compile
    srand(time(NULL));
    while(true){
        //random dari 0-99
        cout<<rand()%100;
        //random dari 1-100
        cout<<rand()%100+1;
        string hold;
        cin>>hold;
    }

    return 0;
}
