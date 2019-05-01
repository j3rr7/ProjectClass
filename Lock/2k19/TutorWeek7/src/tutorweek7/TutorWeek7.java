/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorweek7;

/**
 *
 * @author User
 */
public class TutorWeek7 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //cara memanggil form
        MyForm mf=new MyForm();
        mf.setVisible(true);
        
        //cara lain memanggil form
        //new MyForm().setVisible(true);
        
        //syntax agar form tidak dapat diresize oleh user ketika program dijalankan
        //mf.setResizable(false);
    }
    
}
