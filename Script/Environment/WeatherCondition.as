
/*
UCLASS()
class UWeatherCondition_Cloudy: UWeatherCondition
{
	default m_Weathers.Add(EWeather::Cloudy);
};
*/
UCLASS()
class UWeatherCondition_Rain: UWeatherCondition
{
	default Weathers.Add(EWeather::Rain_Level1);
	default Weathers.Add(EWeather::Rain_Level2);
	default Weathers.Add(EWeather::Rain_Level3);
};

UCLASS()
class UWeatherCondition_Sunny: UWeatherCondition
{
	default Weathers.Add(EWeather::Sunny);
};

UCLASS()
class UWeatherCondition_NoRain: UWeatherCondition
{
	default Weathers.Add(EWeather::Sunny);
	default Weathers.Add(EWeather::Cloudy);
};


UCLASS()
class UWeatherCondition_All: UWeatherCondition
{
	default bAllWeather = true;
};