#include <iostream>
#include <cstdlib>
#include <time.h>
using namespace std;

int main()
{
	srand(time(NULL));
	int angka1;
	bool menu = 1;
	int menu2 = 0;
	int i, j, k;
	int pilih;
	int anu = rand() % 5 + 1;
	int player1=0, hasil, player2, spasi;

	hasil = angka1 - anu - player1;

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
		cout << "Masukan pilihan menu : " << endl;
		cout << "1. VS AI" << endl;
		cout << "2. VS PLAYER" << endl;
		cin >> pilih;

		while (pilih == 1) {
			if (anu == 1 || anu == 3 || anu == 4) {
				menu2 = 1;
			}
			else {
				anu = 1 + rand() % 5;
			}

			if (menu2 == 1) {
				cout << "AI : " << anu << endl;
                hasil = angka1 - anu - player1;
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
                hasil = angka1 - anu - player1;
				if (player1 == 1 || player1 == 3 || player1 == 4) {
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
		}

		while (pilih == 2) {
			cout << "Pilihan 2" << endl;
		}


		return 0;
	}
