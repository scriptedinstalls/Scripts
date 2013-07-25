/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Circle;

/**
 *
 * @author joeblow
 */
import java.awt.*;
import javax.swing.JFrame;

public class Circle extends Canvas
{
    public void paint( Graphics g )
    {
        g.setColor(Color.green);
        g.fillOval(300,200,200,200); // draw a filled-in oval
        
    }

    public static void main( String[] args )
    {
        // You can change the title or size here if you want.
        JFrame win = new JFrame("GraphicsDemo1");
        win.setSize(800,600);
        win.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        Circle canvas = new Circle();
        win.add( canvas );
        win.setVisible(true);
    }
}
