// ConsoleApplication1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <cstdlib>
#include <time.h>
#include <string>
using namespace std;

int main()
{
	srand(time(NULL));
	int angka1;
	bool menu = 1;
	int menu2 = 0;
	int i, j, k;
	int pilih;
	int total;
	int ai = 0;
	int player1;
	int hasil, hasil2 = 0, hasilai = 0;
	int player2;
	int spasi;

	while (menu == true) {
		cout << "Masukkan angka awal : " << endl;
		cin >> angka1;
		if (angka1 <= 0) {
			cout << "Masukkan angka awal : " << endl;
			cin >> angka1;
		}
		else if (angka1 > 0) {
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
		}
		cout << "Masukan pilihan menu : " << endl;
		cout << "1. VS AI" << endl;
		cout << "2. VS PLAYER" << endl;
		cin >> pilih;
//=======================================================================================================================================================================
		while (pilih == 1) {
			cout << "Player 1 : " << endl;
			cin >> player1; //kasih input

			if (player1 == 1 || player1 == 3 || player1 == 4) {
				hasil2 += player1; //sum dari input player 1
				hasil = angka1 - hasil2 - ai;//pengurangan angka awal dengan sum
				cout << "hasil2 : " << hasil2 << endl;
				if (hasil > 0) {
					for (i = 1; i <= angka1 - hasil; i++) {
						cout << "|            |" << endl;
					}
					for (i = 1; i <= hasil; i++) {
						if (i == 1) {
							if (hasil > 10) {
								cout << "|_____" << hasil << "_____|" << endl;
							}
							else {
								cout << "|_____" << "0" << hasil << "_____|" << endl;
							}
						}
						else {
							cout << "|____________|" << endl;
						}
					}
				}

			}
			//==============================================================================

			if (ai != 1 || ai != 3 || ai != 4) {
				for (i = 1; i <= 4; i++) {
					ai = rand() % 5;
				}
					cout << "AI: " << ai << endl;
					hasilai += ai;
					total = hasil - hasilai;
					if (total > 0) {
						for (i = 1; i <= angka1 - total; i++) {
							cout << "|            |" << endl;
						}
						for (i = 1; i <= total; i++) {
							if (i == 1) {
								if (total > 10) {
									cout << "|_____" << total << "_____|" << endl;
								}
								else {
									cout << "|_____" << "0" << total << "_____|" << endl;
								}
							}
							else {
								cout << "|____________|" << endl;
							}
						}if (total == 0) {
							cout << "AI MENANG" << endl;
						}
					}
			}


			}if (total < 0) {

				hasilai -= ai;
			}
			if (hasil < 0)
			{
				hasil2 -= player1;
			}


			if (hasil == 0) {
				cout << "P1 Menang" << endl;
			}
//=======================================================================================================================================================================
				

		}
			
	return 0;
}


/*for (i = 1; i <= player1; i++) {
					cout << "|            |" << endl;
				}
				for (i = 1; i <= hasil; i++) {
					if (i == 1) {
						cout << "|_____" << hasil << "_____|" << endl;
					}
					else {
						cout << "|____________|" << endl;
					}
				}*/
