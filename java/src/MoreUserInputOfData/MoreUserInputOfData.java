import java.util.Scanner;

public class MoreUserInputOfData
{
	public static void main( String[] args )
	{
		Scanner keyboard = new Scanner(System.in);
                
                System.out.println("Please enter the following information so I can sell it for a profit!");
                
		System.out.print( "     First Name: " );
		String firstname = keyboard.next();
                
                System.out.print( "     Last Name: " );
		String lastname = keyboard.next();
                
                System.out.print( "     Grade (9-12): " );
		int grade = keyboard.nextInt();
                
                System.out.print( "     Student ID: " );
		int studentid = keyboard.nextInt();
                
                System.out.print( "     Login: " );
		String login = keyboard.next();
                
                System.out.print("     GPA (0.0-4.0): ");
		double gpa = keyboard.nextDouble();
                
                System.out.println();
                System.out.println();

		System.out.println("Your information: " );
                System.out.println();
                System.out.println();
                System.out.println("     First Name:  " + firstname );
                System.out.println("     Last Name: " + lastname );
                System.out.println("     Grade (9-12): " + grade );
                System.out.println("     Student ID: " + studentid );
                System.out.println("     Login: " + login );
                System.out.println("     GPA (0.0-4.0): " + gpa );
                
                
	}
}


