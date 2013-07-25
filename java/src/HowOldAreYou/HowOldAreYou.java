import java.util.Scanner;

public class HowOldAreYou
{
	public static void main( String[] args )
	{
		int drivingage = 16;
		int vote = 18;
		int rentcar = 25;
                Scanner keyboard = new Scanner(System.in);
                
                System.out.print( "Hello. What is your name? " );
		String name = keyboard.next();
                
                
                System.out.print( "Hi, " + name + " How old are you? " );
		int age = keyboard.nextInt();
                
                
		if ( age < drivingage ) // The if statement evaluates if the condition is true or false.
		{ // The curley brace defines a block of code.
			System.out.println( "You are not old enough to drive!" );
		}

		if ( age < vote )
		{
			System.out.println( "You are not old enough to vote!" );
		}

		if ( age < rentcar )
		{
			System.out.println( "You are not old enough to rent a car!" );
		}

		
	}
}

