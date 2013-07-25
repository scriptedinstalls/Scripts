/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SmilingFace;

/**
 *
 * @author joeblow
 */
import java.awt.*;
import javax.swing.JFrame;

public class SmilingFace extends Canvas
{
    public void paint( Graphics g )
    {
        g.setColor(Color.black);
            for ( int x=0; x<800; x+= 50 )
        g.drawString( String.valueOf(x), x, 50 );
            for ( int y=100; y<600; y+= 50 )
        g.drawString( String.valueOf(y), 28, y ); // lines
        g.setColor(Color.lightGray);
            for ( int x=0; x<800; x+= 50 )
        g.drawLine(x,0,x,599);    // horizontal
            for ( int y=0; y<600; y+= 50 )
        g.drawLine(0,y,799,y);    // vertical
            
        g.setColor(Color.YELLOW);
        g.fillOval(300,200,200,200); // draw a filled-in oval
        g.setColor(Color.BLUE);
        g.fillOval(340, 275, 20, 20);
        g.fillOval(440, 275, 20, 20);
        g.setColor(Color.RED);
        g.drawArc(360,300,70,70,200,140);
        
        
    }

    public static void main( String[] args )
    {
        // You can change the title or size here if you want.
        JFrame win = new JFrame("GraphicsDemo1");
        win.setSize(800,600);
        win.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        SmilingFace canvas = new SmilingFace();
        win.add( canvas );
        win.setVisible(true);
    }
}
