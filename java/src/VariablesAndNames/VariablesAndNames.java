public class VariablesAndNames
{
    public static void main( String[] args )
    {
        int cars = 100;
        double space_in_a_car = 4.0;
        int drivers = 30;
        int passengers = 90;
        int cars_not_driven = cars - drivers;
        int cars_driven = drivers;
        double carpool_capacity = cars_driven * space_in_a_car;
        double average_passengers_per_car = passengers / cars_driven;


        System.out.println( "There are " + cars + " cars available." );
        System.out.println( "There are only " + drivers + " drivers available." );
        System.out.println( "There will be " + cars_not_driven + " empty cars today." );
        System.out.println( "We can transport " + carpool_capacity + " people today." );
        System.out.println( "We have " + passengers + " to carpool today." );
        System.out.println( "We need to put about " + average_passengers_per_car + " in each car." );
    }
}
