/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package UsingSwingForInput;
import javax.swing.*;


/**
 *
 * @author joeblow
 */
public class UsingSwingForInput {
    public static void main (String[] args)
    {
        String name = JOptionPane.showInputDialog("Whats your name? ");
        String input = JOptionPane.showInputDialog("How old are you?");
        int age = Integer.parseInt(input);
        
        System.out.print("Hello, " + name + "." );
        System.out.println("Next year, you'll be " + (age+1) );
        
        System.exit(0);
    }
    
}
