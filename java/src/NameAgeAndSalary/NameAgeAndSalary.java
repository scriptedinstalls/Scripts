import java.util.Scanner;

public class NameAgeAndSalary
{
	public static void main( String[] args )
	{
		Scanner keyboard = new Scanner(System.in);

		System.out.print( " Hello.  What is your name? " );
		String name = keyboard.next();
                
                System.out.print( "Hi, " + name + "!" + " How old are you? " );
		int age = keyboard.nextInt();
                
                //System.out.println( "So you're " + age + " old, " + height + " tall and " + weight + " heavy." );

		System.out.println( " So you're " + age + ", eh?" + " That" + "'s" + " not old at all!" );
                
                System.out.print("How much do you make, " + name + " ? ");
		double wage = keyboard.nextDouble();

		System.out.println( + wage + "!" + " I hope that's per hour and not per year! LOL!" );
	}
}

