    int s21 = sqrt(pow((x2-x1),2)+pow((y2-y1),2));
    int s32 = sqrt(pow((x3-x2),2)+pow((y3-y2),2));
    int s43 = sqrt(pow((x4-x3),2)+pow((y4-y3),2));
    int s14 = sqrt(pow((x1-x4),2)+pow((y1-y4),2));
    int s31 = sqrt(pow((x3-x1),2)+pow((y3-y1),2));
    int s24 = sqrt(pow((x2-x4),2)+pow((y2-y4),2));
    
    int d13 = sqrt(pow((x1-x3),2)+pow((y1-y3),2));
    int d24 = sqrt(pow((x2-x4),2)+pow((y2-y4),2));
    int dt24 = sqrt(pow(s32,2)+pow(s21,2));
    int dt31 = sqrt(pow(s14,2)+pow(s21,2));
    int dt23 = sqrt(pow(s24,2)+pow(s43,2));
    int dt14 = sqrt(pow(s31,2)+pow(s43,2));

    if (s21==s32&&s32==s43&&s43==s14&&d13==d24){
        cout << "Bangun: Persegi"<<endl;
        luas = pow((s21),2);
        cout << "Luas: "<<luas<<endl;
    } 
	else if (s21==s43&&s32==s14&&s21!=s14&&d13==d24&&x4==x1&&x3==x2){
        cout << "Bangun: Persegi Panjang"<<endl;
        if((x3-x2)>(x2-x1)){
            luas = sqrt(pow((x3-x2)*(y2-y1),2));
            cout << "Luas: "<<luas<<endl;
        } else {
            luas = sqrt(pow((x2-x1),2)*pow((y3-y2),2));
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if (s31==s24&&s32==s14&&s31!=s32&&x1==x3&&x2==x4){
        cout <<"Bangun: Persegi Panjang"<<endl;
			if ((x2-x1)>(x3-x1)){
				luas = sqrt(pow((x4-x3)*(y3-y1),2));
				cout << "Luas: "<<endl;
			} 
			else {
				luas = sqrt (pow((x4-x2),2)*pow((x1-x2),2));
				cout << "Luas: "<<endl;
			}
        } 
	else if ((s21==s43&&s32==s14)&&(x1!=x4&&x2!=x3)){
        cout << "Bangun: Jajargenjang"<<endl;
        if (x1<x4&&x2<x3){
            alas = ((x3-x1)-(x2-x1));
            tinggi = sqrt(pow((s14),2)-pow(alas,2));
            luas = sqrt(pow(((x2-x1)*tinggi),2));
            cout << "Luas: "<<luas<<endl;
			} 
		else {
            alas = ((x4-x1)-(x2-x1));
            tinggi = sqrt(pow((s31),2)-pow(alas,2));
            luas = sqrt(pow(((x2-x1)*tinggi),2));
            cout << "Luas: "<<luas<<endl;
			}
    } 
	else if ((s31==s24&&s21==s43)&&(x3!=x1&&x2!=x4)){
        cout <<"Bangun: Jajargenjang"<<endl;
        if (x1<x3&&x2<x4){
            alas = ((x4-x1)-(x2-x1));
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (x2-x1)*tinggi;
            cout << "Luas: "<<luas<<endl;
        }
		else {
            alas = ((x2-x3)-(x4-x3));
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (x4-x3)*tinggi;
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if ((s31==s24&&s21==s43)&&(x2!=x1&&x3!=x4)){
        cout <<"Bangun: Jajargenjang"<<endl;
        if (x1<x2&&x4<x3){
            alas = ((x3-x1)-(x4-x1));
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (x4-x1)*tinggi;
            cout << "Luas: "<<luas<<endl;
        } 
		else {
            alas = ((x4-x2)-(x3-x2));
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (x3-x2)*tinggi;
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if (s21==s43&&s14!=s32&&s14>s32||s21!=s43&&s32==s14&&s21>s43){
        cout << "Bangun: Trapesium sama kaki"<<endl;
        if(s14>s32){
            alas = ((x4-x1)-(x3-x2))/2;
            tinggi = sqrt(pow(s21,2)-pow(alas,2));
            luas = sqrt(pow(((((x4-x1)+(x3-x2))*tinggi)/2),2));
            cout << "Luas: "<<luas<<endl;
        } 
		else if (s21>s43){
            alas = ((x2-x1)-(x3-x4))/2;
            tinggi = sqrt (pow(s14,2)-pow(alas,2));
            luas = sqrt(pow(((((x2-x1)+(x3-x4))*tinggi)/2),2));
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if (s43!=s21&&s14==s32&&dt24==dt31){
        cout << "Bangun: Trapesium sama kaki"<<endl;
        if((x2-x1)>(x3-x4)){
            alas = ((x2-x1)-(x3-x4))/2;
            tinggi = sqrt(pow(s14,2)-pow(alas,2));
            luas = sqrt(pow(((((x2-x1)+(x3-x4))*tinggi)/2),2));
            cout << "Luas: "<<luas<<endl;
        } 
		else {
            alas = ((x3-x4)-(x2-x1))/2;
            tinggi = sqrt(pow(s32,2)-pow(alas,2));
            luas = sqrt(pow(((((x3-x4)+(x2-x1))*tinggi)/2),2));
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if (s31==s24&&s43!=s21&&dt14==dt23){
        cout << "Bangun: Trapesium sama kaki"<<endl;
        if ((x2-x1)>(x4-x3)){
            alas = ((x2-x1)-(x4-x3))/2;
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (((x2-x1)+(x4-x3))*tinggi)/2;
            cout << "Luas: "<<luas<<endl;
        } 
		else {
            alas = ((x4-x3)-(x2-x1))/2;
            tinggi = sqrt(pow(s31,2)-pow(alas,2));
            luas = (((x4-x3)+(x2-x1))*tinggi)/2;
            cout << "Luas: "<<luas<<endl;
        }
    } 
	else if (d13!=d24&&s21!=s43&&s32!=s14){
        cout << "Bangun: Layang-layang"<<endl;
        luas = (d13*d24)*0.5;
        cout << "Luas: "<<luas<<endl;
    } 
	else if (d13!=d24&&s21!=s43&&s14!=s32){
        cout << "Bangun: Layang-layang"<<endl;
        luas = (d13*d24)*0.5;
        cout << "Luas: "<<luas<<endl;