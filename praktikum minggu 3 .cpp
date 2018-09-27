#include <iostream>
#include <cstdlib>
#include <time.h>
using namespace std;

int main()
{
	srand(time(NULL));
	int angka1;
	int pilih;
	bool menu = 1;
	int i, j, k;
	int anu = rand() % 5 + 1;
	int turn = 0;
	int user1=0,hasil,user2=0;
	//int menu2 = 0;int player1=0, hasil, player2, spasi;hasil = angka1 - anu - player1;

	while (menu == true) {
		cout << "Masukkan angka awal : " << endl;
		cin >> angka1;
		for (i = 1; i <= angka1; i++) {
			if (i == 1 && angka1 > 0 && angka1 < 10) {
				cout << "|_____" << "0" << angka1 << "_____|" << endl;
			}
			else if (i != 1) {
				cout << "|____________|" << endl;
			}
			else {
				cout << "|_____" << angka1 << "_____|" << endl;
			}
		}
		menu = false;
	}
//==========================================================================
	while (menu == false) {
		cout << "Masukan pilihan menu : " << endl;
		cout << "1. User vs AI" << endl;
		cout << "2. User vs User" << endl;
		cin >> pilih;

		while (pilih == 2) {
			if (turn % 2 == 0) {
				cout << "User1 turun : " << endl;
				cin >> user1;
				int temp = user1;

				if (user1 == 1 || user1 == 3 || user1 == 4) {
					for (i = 1; i <= user1; i++) {
						cout << "|            |" << endl;
					}
					for (j = 1; j <= angka1-user1-user2; j++) {
						if (j == 1) {
							cout << "|_____" << angka1 - user1 - user2 << "_____|" << endl;
						}
						else {
							cout << "|____________|" << endl;
						}
					}
				}
			}

			else {
				cout << "User2 turun : " << endl;
				cin >> user2;

				if (user2 == 1 || user2 == 3 || user2 == 4) {
					for (i = 1; i <= user2; i++) {
						cout << "|            |" << endl;
					}
					for (i = 1; i <= angka1-user1-user2; i++) {
						if (i == 1) {
							cout << "|_____" << angka1 - user1 - user2 << "_____|" << endl;
						}
						else {
							cout << "|____________|" << endl;
						}
					}
				}
			}
			turn++;
		}

	}
		

		/*while (pilih == 1) {
			if (anu == 1 || anu == 3 || anu == 4) {
				menu2 = 1;
			}
			else {
				anu = 1 + rand() % 5;
			}

			if (menu2 == 1) {
				cout << "AI : " << anu << endl;
				for (i = 1; i <= anu; i++) {
					cout << "|            |" << endl;
				}
				for (i = 1; i <= hasil; i++) {
					if (i == 1) {
						cout << "|_____" << hasil << "_____|" << endl;
					}
					else {
						cout << "|____________|" << endl;
					}
				}
				//menu2 = 2;
			}
			//while (menu2 == 2) {
				cout << "Player 1 : " << endl;
				cin >> player1;
				if (player1 == 1 && hasil > 10 || player1 == 3 && hasil > 10 || player1 == 4 && hasil > 10) {
					for (i = 1; i <= spasi; i++) {
						cout << "|            |" << endl;
					}
					for (i = 1; i <= hasil; i++) {
						if (i == 1) {
							cout << "|_____" << hasil << "_____|" << endl;
						}
						else {
							cout << "|____________|" << endl;
						}
					}
					//menu2 = 1;
				}
				else if (player1 == 1 && hasil < 10 || player1 == 3 && hasil < 10 || player1 == 4 && hasil < 10) {
					for (i = 1; i <= spasi; i++) {
						cout << "|            |" << endl;
					}
					for (i = 1; i <= hasil; i++) {
						if (i == 1) {
							cout << "|_____" << "0" << hasil << "_____|" << endl;
						}
						else {
							cout << "|____________|" << endl;
						}
					}
					//menu2 = 1;
				}
				else {
					//menu2 = 2;
				}
			//}
		}*/



		return 0;
	}
