class UWeatherConfigG1R : UWeatherSubsystemConfig
{
    /** If set to something valid, the sky will be static at the given time. */
	default StaticSkyTime = FClockTime::Invalid();

    default WindForce.Add(EWeather::Cloudy, 0.0f);
    default WindForce.Add(EWeather::Sunny, 0.0f);
    default WindForce.Add(EWeather::Rain_Level1, 0.0f);
    default WindForce.Add(EWeather::Rain_Level2, 0.0f);
    default WindForce.Add(EWeather::Rain_Level3, 0.0f);

    default WindForceVariability = 0.0f;
    default WindForceChangeProbability = 0.0f;

    default WetnessIncreaseFactor = 0.1f;
    default WetnessDecreaseFactor = 0.01f;

    default MinLightingSpawnTime = 5.0f;
    default MaxLightingSpawnTime = 20.0f;
    default InitialThunderBias = 7.0f;
    
    default MaterialParameterCollection = n"/Script/Engine.MaterialParameterCollection'/Game/Materials/ParameterCollections/MPC_Gothic_Global_Parameters.MPC_Gothic_Global_Parameters'";

}