/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package week6.rpg;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Matt
 */
public class Week6RPG {

    public static void main(String[] args) throws CloneNotSupportedException {
    char[][] map=new  char[15][42];
        for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 42; j++) {
                if(i==0||j==0||i==14||j==41)map[i][j]='#';
                else map[i][j]=' ';
            }
        }
    hero player=new fighter();
    Scanner inp=new Scanner(System.in);
    Random rnd =new Random();
    String pil;
    int rany,randx;
        System.out.println("PILIH JOB");
        System.out.println("#################    #################   #################");
        System.out.println("#Nama : Fighter #    #Nama : Elf     #   #Nama : Paladin #");
        System.out.println("#Atk  : 20      #    #Atk  : 10      #   #Atk  : 15      #");
        System.out.println("#Def  : 10      #    #Def  : 13      #   #Def  : 20      #");
        System.out.println("#HP   : 100     #    #HP   : 150     #   #HP   : 130     #");
        System.out.println("#################    #################   #################");    
        System.out.println("Pilihan : ");
        do{
        pil=inp.nextLine();
        }while(!pil.equalsIgnoreCase("Fighter")&&!pil.equalsIgnoreCase("Elf")&&!pil.equalsIgnoreCase("Paladin"));
        
        
        if(pil.equals("Fighter"))player=new fighter();
        else if(pil.equals("Elf"))player=new elf();
        else if(pil.equals("Paladin"))player=new paladin();
        System.out.println("Masukkan Nama Player ");
        String nama=inp.nextLine();
        ArrayList<hero> musuh=new ArrayList<>();
        map[player.getY()][player.getX()]='P';
        for (int i = 0; i < 3; i++) {
            do{
                 rany=rnd.nextInt(13)+1;
                 randx=rnd.nextInt(40)+1;
            }while(map[rany][randx]!=' ');
            musuh.add(new bat(rany,randx));
        }
        for(int i=0;i<2;i++){
            do{
                 rany=rnd.nextInt(13)+1;
                 randx=rnd.nextInt(40)+1;
            }while(map[rany][randx]!=' ');
            musuh.add(new slime(rany,randx));
        }
        for (hero x : musuh) {
            if(x.getName().equals("Bat"))map[x.getY()][x.getX()]='B';
            else map[x.getY()][x.getX()]='S'    ;
        }
        do{
            for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 42; j++) {
                if(i==0||j==0||i==14||j==41)map[i][j]='#';
                else map[i][j]=' ';
            }
        }
            map[player.getY()][player.getX()]='P';
        for (hero x : musuh) {
            if(x.getName().equals("Bat"))map[x.getY()][x.getX()]='B';
            else map[x.getY()][x.getX()]='S';
        }

            for (int i = 0; i < 15; i++) {
            for (int j = 0; j < 42; j++) {
                System.out.print(map[i][j]);
            }
                System.out.println("");
        }
            
           pil=inp.nextLine();
           player.moving(pil);
            for (int i=0;i<musuh.size();i++) {
               rany=rnd.nextInt(4);
               if(rany==1){
               if(map[musuh.get(i).getY()+1][musuh.get(i).getX()]==' '&&musuh.get(i).getY()<11)musuh.get(i).moving("S");
               }else if(rany==2){
               if(map[musuh.get(i).getY()-1][musuh.get(i).getX()]==' '&&musuh.get(i).getY()>1)musuh.get(i).moving("W");
               }else if(rany==3){
               if(map[musuh.get(i).getY()][musuh.get(i).getX()+1]==' '&&musuh.get(i).getX()<41)musuh.get(i).moving("D");
               }else if(rany==0){
               if(map[musuh.get(i).getY()][musuh.get(i).getX()-1]==' '&&musuh.get(i).getX()>1)musuh.get(i).moving("A");
               }
               if(musuh.get(i).getName().equals("Slime"))musuh.get(i).setPecah(musuh.get(i).getPecah()-1);
            }
            for (int i=0;i<musuh.size();i++) {
                if(musuh.get(i).getX()==player.getX()&&musuh.get(i).getY()==player.getY()){
                    boolean rpsx=true;
                    int cek;
                    do{
                    System.out.println("Player : "+nama+" - "+player.getName()+"          Enemy : "+musuh.get(i).getName());
                    System.out.println("Hp : "+player.getHp()+"                           HP: "+musuh.get(i).getHp());
                    System.out.println("==================================================================");
                    System.out.println("1. Gunting");
                    System.out.println("2. Batu ");
                    System.out.println("3. Kertas");
                    int pill=inp.nextInt();
                    player.setRps(pill-1);
                    musuh.get(i).setRps(rnd.nextInt(3));
                    cek=player.compareTo(musuh.get(i));
                    if(cek!=0)rpsx=false;
                    else System.out.println("Hasil Seri Pilih lagi");
                    }while(rpsx);
                    if(cek==1){
                        musuh.get(i).setHp(musuh.get(i).getHp()-(player.getAtk()-musuh.get(i).getDef()/2));
                        System.out.println(nama+" Menang");
                    }else{ 
                        player.setHp(player.getHp()-(musuh.get(i).getAtk()-player.getDef()/2));
                        System.out.println(nama+" Kalah");
                    }
                    if(map[musuh.get(i).getY()][musuh.get(i).getX()+1]==' ')musuh.get(i).setX(musuh.get(i).getX()+1);
                    else if(map[musuh.get(i).getY()][musuh.get(i).getX()-1]==' ')musuh.get(i).setX(musuh.get(i).getX()-1);
                    else if(map[musuh.get(i).getY()+1][musuh.get(i).getX()]==' ')musuh.get(i).setY(musuh.get(i).getY()+1);
                    else if(map[musuh.get(i).getY()-1][musuh.get(i).getX()]==' ')musuh.get(i).setY(musuh.get(i).getY()-1);
                
                    if(map[player.getY()][player.getX()+1]==' ')player.setX(player.getX()+1);
                    else if(map[player.getY()][player.getX()-1]==' ')player.setX(player.getX()-1);
                    else if(map[player.getY()+1][player.getX()]==' ')player.setY(player.getY()+1);
                    else if(map[player.getY()-1][player.getX()]==' ')player.setY(player.getY()-1);
                }
            }
                for (hero cekded : musuh) {
                    if(cekded.getHp()<=0)cekded.setDed(true);
                }
                for (int i=0;i<musuh.size();i++) {
                     if(musuh.get(i).isded())musuh.remove(i);
                }
                for (int i=0;i<musuh.size();i++) {
                    if(musuh.get(i).getName().equalsIgnoreCase("Slime")){
                        if (musuh.get(i).getPecah()<=0) {
                            slime titip=(slime) musuh.get(i).clone();     
                            if(musuh.get(i).getHp()>10)musuh.get(i).setHp(musuh.get(i).getHp()-5);
                            musuh.get(i).setPecah(5);
                            titip.setPecah(5);
                            musuh.add(titip);
                                do{
                                rany=rnd.nextInt(13)+1;
                                randx=rnd.nextInt(40)+1;
                                }while(map[rany][randx]!=' ');
                                musuh.get(musuh.size()-1).setX(randx);
                                musuh.get(musuh.size()-1).setY(rany);
 
                        }
                    }
                }
            
        }while(!player.isded()||musuh.size()<=0);
        if(player.isded())System.out.println("YOU LOSE");
        else System.out.println("YOU WIN");
     }
    
}
interface character{
    abstract void moving(String i);
    abstract boolean isded();
}
abstract class hero implements Cloneable,character,Comparator<hero>{
    protected int x,y,atk,def,hp,rps;
    protected String name;
    protected boolean ded;

    public int getRps() {
        return rps;
    }

    public void setRps(int rps) {
        this.rps = rps;
    }
    
    public int getX() {
        return x;
    }

    public int getAtk() {
        return atk;
    }

    public void setAtk(int atk) {
        this.atk = atk;
    }

    public int getDef() {
        return def;
    }

    public void setDef(int def) {
        this.def = def;
    }

    public int getHp() {
        return hp;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public void setDed(boolean ded) {
        this.ded = ded;
    }
    public void moving(String i){
    }

    int compareTo(hero x) {
     return 0;
    }
    public slime clone()throws CloneNotSupportedException{
        slime pecah= (slime)super.clone();
        return pecah;
    }
    int getPecah() {
     return 0;   
    }
    void setPecah(int i){
    }
    public boolean isded() {
        return false;
    }
}
class fighter extends hero implements character,Comparable<hero>{

   fighter(){
   this.name="Fighter";
   this.hp=100;
   this.atk=20;
   this.def=10;
   this.x=1;
   this.y=1;
   }
    public void moving(String i) {
     if(i.equalsIgnoreCase("W")){
         if(this.y>1)this.y--;
     }else if(i.equalsIgnoreCase("A")){
         if(this.x>1)this.x--;
     }else if(i.equalsIgnoreCase("D")){
         if(this.x<40)this.x++;
     }else if(i.equalsIgnoreCase("S")){
         if(this.y<11)this.y++;
     }
    }


    public int compareTo(hero t) {
        if(this.rps==t.getRps())return 0;
        else{
           if(this.rps==0&&t.getRps()==1)return 2;
           else if(this.rps==1&&t.getRps()==2)return 2;
           else if(this.rps==2&&t.getRps()==0)return 2;
           else if(this.rps==1&&t.getRps()==0)return 1;
           else if(this.rps==2&&t.getRps()==1)return 1;
           else if(this.rps==0&&t.getRps()==2)return 1;
           else return 0;
       }
    }
    public boolean isded(){
        return this.ded;
    }

    @Override
    public int compare(hero t, hero t1) {
       if(t.rps==t1.getRps())return 0;
        else{
           if(t.rps==0&&t1.getRps()==1)return 2;
           else if(t.rps==1&&t1.getRps()==2)return 2;
           else if(t.rps==2&&t1.getRps()==0)return 2;
           else if(t.rps==1&&t1.getRps()==0)return 1;
           else if(t.rps==2&&t1.getRps()==1)return 1;
           else if(t.rps==0&&t1.getRps()==2)return 1;
           else return 0;
       }
    }
}

class elf extends hero implements character,Comparable<hero>{

    elf(){
   this.name="Elf";
   this.hp=150;
   this.atk=10;
   this.def=13;
   this.x=1;
   this.y=1;
   this.ded=false;
    }
        public void moving(String i) {
     if(i.equalsIgnoreCase("W")){
         if(this.y>1)this.y--;
     }else if(i.equalsIgnoreCase("A")){
         if(this.x>1)this.x--;
     }else if(i.equalsIgnoreCase("D")){
         if(this.x<40)this.x++;
     }else if(i.equalsIgnoreCase("S")){
         if(this.y<11)this.y++;
     }
    }
    public int compareTo(hero t) {
        if(this.rps==t.getRps())return 0;
        else{
           if(this.rps==0&&t.getRps()==1)return 2;
           else if(this.rps==1&&t.getRps()==2)return 2;
           else if(this.rps==2&&t.getRps()==0)return 2;
           else if(this.rps==1&&t.getRps()==0)return 1;
           else if(this.rps==2&&t.getRps()==1)return 1;
           else if(this.rps==0&&t.getRps()==2)return 1;
           else return 0;
       }
    }
    public boolean isded(){
       return this.ded;
    }
    public int compare(hero t, hero t1) {
       if(t.rps==t1.getRps())return 0;
        else{
           if(t.rps==0&&t1.getRps()==1)return 2;
           else if(t.rps==1&&t1.getRps()==2)return 2;
           else if(t.rps==2&&t1.getRps()==0)return 2;
           else if(t.rps==1&&t1.getRps()==0)return 1;
           else if(t.rps==2&&t1.getRps()==1)return 1;
           else if(t.rps==0&&t1.getRps()==2)return 1;
           else return 0;
       }
    }
}
class paladin extends hero implements character,Comparable<hero>{
 paladin(){
   this.name="Paladin";
   this.hp=130;
   this.atk=15;
   this.def=20;
    this.x=1;
   this.y=1;  
   this.ded=false;
 }
    
        public void moving(String i) {
     if(i.equalsIgnoreCase("W")){
         if(this.y>1)this.y--;
     }else if(i.equalsIgnoreCase("A")){
         if(this.x>1)this.x--;
     }else if(i.equalsIgnoreCase("D")){
         if(this.x<40)this.x++;
     }else if(i.equalsIgnoreCase("S")){
         if(this.y<11)this.y++;
     }
   }
    public int compareTo(hero t) {
        if(this.rps==t.getRps())return 0;
        else{
           if(this.rps==0&&t.getRps()==1)return 2;
           else if(this.rps==1&&t.getRps()==2)return 2;
           else if(this.rps==2&&t.getRps()==0)return 2;
           else if(this.rps==1&&t.getRps()==0)return 1;
           else if(this.rps==2&&t.getRps()==1)return 1;
           else if(this.rps==0&&t.getRps()==2)return 1;
           else return 0;
       }
    }
        public boolean isded(){
        return this.ded;
    }
    public int compare(hero t, hero t1) {
       if(t.rps==t1.getRps())return 0;
        else{
           if(t.rps==0&&t1.getRps()==1)return 2;
           else if(t.rps==1&&t1.getRps()==2)return 2;
           else if(t.rps==2&&t1.getRps()==0)return 2;
           else if(t.rps==1&&t1.getRps()==0)return 1;
           else if(t.rps==2&&t1.getRps()==1)return 1;
           else if(t.rps==0&&t1.getRps()==2)return 1;
           else return 0;
       }
    }
}
class slime extends hero implements character,Cloneable,Comparable<hero>{
    protected int pecah;

    public int getPecah() {
        return pecah;
    }

    public void setPecah(int pecah) {
        this.pecah = pecah;
    }
    @Override
    public void moving(String i) {
     if(i.equalsIgnoreCase("W")){
         if(this.y>1)this.y--;
     }else if(i.equalsIgnoreCase("A")){
         if(this.x>1)this.x--;
     }else if(i.equalsIgnoreCase("D")){
         if(this.x<40)this.x++;
     }else if(i.equalsIgnoreCase("S")){
         if(this.y<11)this.y++;
     }
    }

    public slime(int y,int x){
        this.y=y;
        this.x=x;
        this.name="Slime";
        this.atk=(int)(Math.random()*3+7);
        this.def=(int)(Math.random()*3+8);
        this.ded=false;
        this.pecah=5;
        this.hp=120;
    }
    
    public slime clone()throws CloneNotSupportedException{
        slime pecah= (slime)super.clone();
        return pecah;
    }
        public boolean isded(){
        return this.ded;
    }

    @Override
    public int compareTo(hero t) {
    return 1;
    }
    public int compare(hero t, hero t1) {
       if(t.rps==t1.getRps())return 0;
        else{
           if(t.rps==0&&t1.getRps()==1)return 2;
           else if(t.rps==1&&t1.getRps()==2)return 2;
           else if(t.rps==2&&t1.getRps()==0)return 2;
           else if(t.rps==1&&t1.getRps()==0)return 1;
           else if(t.rps==2&&t1.getRps()==1)return 1;
           else if(t.rps==0&&t1.getRps()==2)return 1;
           else return 0;
       }
    }
        
}
class bat extends hero implements character,Comparable<hero>{

     public void moving(String i) {
     if(i.equalsIgnoreCase("W")){
         if(this.y>1)this.y--;
     }else if(i.equalsIgnoreCase("A")){
         if(this.x>1)this.x--;
     }else if(i.equalsIgnoreCase("D")){
         if(this.x<40)this.x++;
     }else if(i.equalsIgnoreCase("S")){
         if(this.y<11)this.y++;
     }
   }
    public bat(int y,int x){
        this.y=y;
        this.x=x;
        this.name="Bat";
        this.atk=(int)(Math.random()*3+10);
        this.def=(int)(Math.random()*6+10);
        this.ded=false;
        this.hp=100;
    }
        public boolean isded(){
        return this.ded;
    }
    public int compareTo(hero t) {
    return 1;
    }
    public int compare(hero t, hero t1) {
       if(t.rps==t1.getRps())return 0;
        else{
           if(t.rps==0&&t1.getRps()==1)return 2;
           else if(t.rps==1&&t1.getRps()==2)return 2;
           else if(t.rps==2&&t1.getRps()==0)return 2;
           else if(t.rps==1&&t1.getRps()==0)return 1;
           else if(t.rps==2&&t1.getRps()==1)return 1;
           else if(t.rps==0&&t1.getRps()==2)return 1;
           else return 0;
       }
    }
}