import java.util.Scanner;

public class BMICalc
{
	public static void main( String[] args )
	{
		Scanner keyboard = new Scanner(System.in);
                
                System.out.print( "Your height in inches: " );
		int height = keyboard.nextInt();
                
                System.out.print( "Your weight in pounds: " );
		int pounds = keyboard.nextInt();
                
                double totalheight = (height * height);

		System.out.println( "Your BMI is  " + ((pounds/totalheight) * 703) );
		
                
	}
}



