import java.util.Scanner;

public class AskingQuestions
{
	public static void main( String[] args )
	{
		Scanner keyboard = new Scanner(System.in);

		System.out.print( "How old are you? " );
		int age = keyboard.nextInt();

		System.out.print( "How tall are you? " );
		String height = keyboard.next();

		System.out.print( "How much do you weigh? " );
		double weight = keyboard.nextDouble();

		System.out.println( "So you're " + age + " old, " + height + " tall and " + weight + " heavy." );
	}
}
