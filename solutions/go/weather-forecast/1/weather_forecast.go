// Package weather provides an API for querying the weather forecast.
package weather

var (
    // CurrentCondition represents the current weather conditions. Example: Raining, Sunny, Cloudy.
	CurrentCondition string
    // CurrentLocation represents the name of the city where the weather condition is occurring.
	CurrentLocation  string
)

// Forecast returns the weather conditions for the specified city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
