/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BoringWindow;
import javax.swing.JFrame;
/**
 *
 * @author joeblow
 */
public class BoringWindow extends JFrame {
    public static void main (String[] args )
    {
        JFrame fat = new BoringWindow();
        fat.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        fat.setSize(300, 200);
        fat.setVisible(true);
        
    }
}
