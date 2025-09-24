class Lasagna
{
    public int ExpectedMinutesInOven() 
    {
        return 40;
    }

    public int RemainingMinutesInOven(int elapsedTimeInMinutes) 
    {
        return ExpectedMinutesInOven() - elapsedTimeInMinutes;
    }

    public int PreparationTimeInMinutes(int layers)
    {
        return layers * 2;
    }

    public int ElapsedTimeInMinutes(int layers, int elapsedTimeInMinutes)
    {
        return PreparationTimeInMinutes(layers) + elapsedTimeInMinutes;
    }
}
