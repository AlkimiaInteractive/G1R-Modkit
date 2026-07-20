UCLASS()
class AGothicUltraDynamicControlerAS : AGothicUltraDynamicController
{
    float32 UnselectedWeatherModifier = 20;
    EWeather NextWeatherWhenLeavingOverride = EWeather::Cloudy;

    FBiomeWeatherProbabilities BiomeProbabilities;
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::TemperateDecidiousForest, EWeather::Sunny, 30);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::TemperateDecidiousForest, EWeather::Cloudy, 60);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::TemperateDecidiousForest, EWeather::Rain_Level1, 10);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::TemperateDecidiousForest, EWeather::Rain_Level2, 1);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::TemperateDecidiousForest, EWeather::Rain_Level3, 1);

    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::RainfeldUpland, EWeather::Sunny, 40);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::RainfeldUpland, EWeather::Cloudy, 50);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::RainfeldUpland, EWeather::Rain_Level1, 15);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::RainfeldUpland, EWeather::Rain_Level2, 1);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::RainfeldUpland, EWeather::Rain_Level3, 5);

    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Wetland, EWeather::Sunny, 50);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Wetland, EWeather::Cloudy, 40);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Wetland, EWeather::Rain_Level1, 5);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Wetland, EWeather::Rain_Level2, 1);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Wetland, EWeather::Rain_Level3, 0);

    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Tundra, EWeather::Sunny, 5);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Tundra, EWeather::Cloudy, 20);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Tundra, EWeather::Rain_Level1, 40);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Tundra, EWeather::Rain_Level2, 15);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Tundra, EWeather::Rain_Level3, 5);

    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Desert, EWeather::Sunny, 55);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Desert, EWeather::Cloudy, 15);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Desert, EWeather::Rain_Level1, 5);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Desert, EWeather::Rain_Level2, 1);
    default BiomeProbabilities.AddWeatherProbabilityForBiome(EBiome::Desert, EWeather::Rain_Level3, 1);

    TMap<EWeather, FWeatherListContainer> ListContainer;
    TArray<EWeather> DisabledWeathers;

    UWeatherSubsystem WeatherSubsystem;
    FInGameTime LastKnownTime;
    EWeather LastKnownWeather;
    bool bAllowWeatherTransition = true;
    bool bIsLogicOverrided;
    bool bIsLastOverrideTransitionImmediate;

    TArray<EWeather> OrderedWeather;
    EWeather NextWeather;

    //Only executed on server
    UFUNCTION(BlueprintOverride)
    void HandleWeather()
    {
        auto DataSubsystem = UWeatherPersistentDataSubsystem::GetWeatherPersistantDataSubsystem();
        if (DataSubsystem == nullptr)
        {
            return;
        }

        if (WeatherSubsystem == nullptr)
        {
            InitializeBehavior(DataSubsystem.WeatherGameState);
            if (WeatherSubsystem == nullptr)
            {
                return;
            }
        }

        if (WeatherSubsystem.IsTimeFrozen())
        {
            return;
        }

        auto CurrentTime = WeatherSubsystem.GetCurrentSkyDayTime();
        if (bAllowWeatherTransition && 
            (CurrentTime.GetClockTime().Hour > LastKnownTime.GetClockTime().Hour || CurrentTime.GetDay() > LastKnownTime.GetDay()))
        {
            UpdateWeatherSimulation(false, DataSubsystem.WeatherGameState);
        }

        if (CurrentTime.GetDay() > LastKnownTime.GetDay())
        {
            OnDayElapsed(DataSubsystem.WeatherGameState);
        }

        LastKnownTime = CurrentTime;
        DataSubsystem.WeatherGameState.CurrentWeather = LastKnownWeather = GetCurrentWeather();
    }

    void InitializeBehavior(FWeatherSaveGame& SaveState)
    {
        WeatherSubsystem = UWeatherSubsystem::Get();
        if (WeatherSubsystem == nullptr)
        {
            return;
        }

        SetCurrentWeatherImmediate(SaveState.CurrentWeather);
        LastKnownTime = WeatherSubsystem.GetCurrentSkyDayTime();

        OrderedWeather.Empty();
        OrderedWeather.Add(EWeather::Sunny);
        OrderedWeather.Add(EWeather::Cloudy);
        OrderedWeather.Add(EWeather::Rain_Level1);
        OrderedWeather.Add(EWeather::Rain_Level2);
        OrderedWeather.Add(EWeather::Rain_Level3);

        if (SaveState.WeatherModifiers.IsEmpty())
        {
            for(auto Weather : OrderedWeather)
            {
                SaveState.WeatherModifiers.Add(Weather, 0.0f);
            }
        }

        NextWeather = GetCurrentWeather();
    }

    UFUNCTION(BlueprintOverride)
    void UpdateWeatherSimulation(bool IsInstant, FWeatherSaveGame& SaveState)
    {
        auto WeatherType = GetCurrentWeather();
        auto PossibleTransitions = GetPossibleWeatherTransitions(WeatherType, SaveState);

        float32 TotalProbability = 0;
        for(auto Transition : PossibleTransitions)
        {
            TotalProbability += Transition.TotalProbability;
        }

        NextWeather = EWeather::Cloudy;
        auto NextWeatherTransitionValue = Math::RandRange(0, TotalProbability);
        float32 CummulativeTransition = 0;
        for(auto Transition : PossibleTransitions)
        {
            CummulativeTransition += Transition.TotalProbability;
            if (NextWeatherTransitionValue <= CummulativeTransition)
            {
                NextWeather = Transition.WeatherType;
                break;
            }
        }
       
        SaveState.DailyWeathers.AddUnique(NextWeather);
        SaveState.WeatherModifiers.Add(NextWeather, 0.0f);
        if(IsInstant)
        {
            SetCurrentWeatherImmediate(NextWeather);
        }
        else
        {
            SetCurrentWeather(NextWeather);
        }
    }

    TArray<FModifiedWeather> GetPossibleWeatherTransitions(EWeather Weather, const FWeatherSaveGame& SaveState)
    {
        auto BiomeType = GetCurrentBiome();

        int WeatherIndex = OrderedWeather.FindIndex(Weather);
        TArray<FModifiedWeather> PossibleWeathers;
        auto PreviousWeatherIndex = WeatherIndex-1;
        if(PreviousWeatherIndex >= 0)
        {
            auto PreviousWeather = OrderedWeather[PreviousWeatherIndex];
            PossibleWeathers.Add(GetWeatherModifier(BiomeType, PreviousWeather, SaveState));

            //Rain breaker to cloudy
        }

        PossibleWeathers.Add(GetWeatherModifier(BiomeType, Weather, SaveState));

        auto NextWeatherIndex = WeatherIndex+1;
        if(NextWeatherIndex < OrderedWeather.Num())
        {
            PossibleWeathers.Add(GetWeatherModifier(BiomeType, OrderedWeather[NextWeatherIndex], SaveState));
        }

        //Cloud breaker
        if(Weather == EWeather::Rain_Level2 || Weather == EWeather::Rain_Level3)
        {
            PossibleWeathers.Add(GetWeatherModifier(BiomeType, EWeather::Cloudy, SaveState));
        }

        for (int i = PossibleWeathers.Num() - 1; i >= 0; i--)
        {
            if (DisabledWeathers.Contains(PossibleWeathers[i].WeatherType))
            {
                PossibleWeathers.RemoveAt(i);
            }
        }

        return PossibleWeathers;
    }

    FModifiedWeather GetWeatherModifier(EBiome Biome, EWeather Weather, const FWeatherSaveGame& SaveState)
    {
        FWeatherProbability BiomeProbability;
        BiomeProbabilities.WeatherProbabilities.Find(Biome, BiomeProbability);

        float32 WeatherProbability;
        BiomeProbability.Probabilities.Find(Weather, WeatherProbability);

        float32 Modifier;
        SaveState.WeatherModifiers.Find(Weather, Modifier);

        if (DisabledWeathers.Contains(Weather))
        {
            Modifier = 0;
            WeatherProbability = 0;
        }

        auto WeatherModifier = FModifiedWeather(WeatherProbability, Modifier, Weather);
        return WeatherModifier;
    }

    UFUNCTION(BlueprintOverride)
    void ChangeLocalWeather(bool IsInstantChange, bool HasDuration, int DurationLength, EWeather NextType)
    {
        if (bIsLogicOverrided)
        {
            return;
        }

        bIsLogicOverrided = true;
        bIsLastOverrideTransitionImmediate = IsInstantChange;
        if(IsInstantChange)
        {
            SetCurrentWeatherImmediate(NextType);
        }
        else
        {
            SetCurrentWeather(NextType);
        }

        if (HasDuration)
        {
            System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ResetAfterDuration"), DurationLength, false);
        }
    }

    UFUNCTION(BlueprintOverride, BlueprintCallable)
    void EnablePossibleWeathers(const TArray<EWeather>& WeathersToEnable)
    {
        for (auto Weather : WeathersToEnable)
        {
            DisabledWeathers.Remove(Weather);
        }
    }

    UFUNCTION(BlueprintOverride, BlueprintCallable)
    void DisablePossibleWeathers(const TArray<EWeather>& WeathersToDisable, EWeather DesiredWeatherIfCurrentIsDisabled)
    {
        for (auto Weather : WeathersToDisable)
        {
            DisabledWeathers.AddUnique(Weather);
        }

        if (WeathersToDisable.Contains(GetCurrentWeather()))
        {
            SetCurrentWeather(DesiredWeatherIfCurrentIsDisabled);
        }
    }

    UFUNCTION(BlueprintOverride)
    TArray<EWeather> GetDisabledPossibleWeathers()
    {
        return DisabledWeathers;
    }

    UFUNCTION(BlueprintCallable)
    void ResetAfterDuration()
    {
        ResetLocalWeather(bIsLastOverrideTransitionImmediate);
    }

    UFUNCTION(BlueprintOverride)
    void ResetLocalWeather(bool IsInstantChange)
    {
        bIsLogicOverrided = false;
        if(IsInstantChange)
        {
            SetCurrentWeatherImmediate(NextWeatherWhenLeavingOverride);
        }
        else
        {
            SetCurrentWeather(NextWeatherWhenLeavingOverride);
        }
    }

    UFUNCTION(BlueprintCallable)
    void OnDayElapsed(FWeatherSaveGame& SaveState)
    {
        for(auto Weather : OrderedWeather)
        {
            float32 NewMod = 0;
            if (!SaveState.DailyWeathers.Contains(Weather))
            {
                float32 PreviosMod;
                SaveState.WeatherModifiers.Find(Weather, PreviosMod);
                NewMod = PreviosMod + UnselectedWeatherModifier;
            }
            SaveState.WeatherModifiers.Add(Weather, NewMod);
        }

        SaveState.DailyWeathers.Empty();
    }

    UFUNCTION(BlueprintOverride)
    void SetAllowWeatherTransition(bool bAllow)
    {
        bAllowWeatherTransition = bAllow;
    }

    UFUNCTION(BlueprintOverride)
    bool GetAllowWeatherTransition()
    {
        return bAllowWeatherTransition;
    }

    UFUNCTION(BlueprintOverride)
    void DrawProbabilityGUI()
    {
        #if WITH_IMGUI
        auto DataSubsystem = UWeatherPersistentDataSubsystem::Get();
        if (DataSubsystem == nullptr)
        {
            ImGui::Text("Can't display settings, missing persistent data system");
            return;
        }

        ImGui::Spacing();

        ImGui::Text("Biome: "+GetCurrentBiome()+" / Weather: "+GetCurrentWeather());
        ImGui::Text("Is weather changing: "+(NextWeather!=GetCurrentWeather()));

        ImGui::Spacing();
        ImGui::Text("Weather Probabilities");
        for (auto Weather : OrderedWeather)
        {
            ShowWeather(Weather, DataSubsystem.WeatherGameState);
        }
        #endif
    }

    void ShowWeather(EWeather Weather, const FWeatherSaveGame& SaveState)
    {
        auto WeatherModifier = GetWeatherModifier(GetCurrentBiome(), Weather, SaveState);
        #if WITH_IMGUI
        ImGui::Text(""+ Weather +": Probability: "+WeatherModifier.Probability+". Mod:"+WeatherModifier.Mod+". Total: "+WeatherModifier.TotalProbability);
        #endif
    }
}

USTRUCT()
struct FWeatherListContainer
{
    TArray<EWeather> Weathers;
}

USTRUCT()
struct FModifiedWeather
{
    UPROPERTY()
    float32 Probability;
    UPROPERTY()
    float32 Mod;
    UPROPERTY()
    float32 TotalProbability;
    UPROPERTY()
    EWeather WeatherType;

    FModifiedWeather(float32 probability, float32 mod, EWeather weatherType)
    {
        this.Probability = probability;
        this.Mod = mod;
        this.TotalProbability = probability + mod;
        this.WeatherType = weatherType;
    }
}
