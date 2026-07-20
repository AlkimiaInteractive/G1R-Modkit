UCLASS(Abstract)
class URegionTrait_SleeperTempleRegionTrait_Dream : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::State_Killable);
    default TagsToApplyOnEnter.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
    default TagsToApplyOnEnter.AddTag(GameplayTag::State_Spell_Transform_Blocked);

    UPROPERTY()
    FName m_SaveValue = n"";
    UPROPERTY()
    FName m_WorldEventName = n"";

    UPROPERTY()
    FGameplayTag m_SleeperStateTag = FGameplayTag();

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (CharacterState.Character == nullptr)
            return;
        if(CharacterState.Character.CharacterDefinition.m_CharacterType == GameplayTag::AIAgent_Creature_TheSleeper)
            SetupSleeper(CharacterState.Character);
        if (CharacterState.Character.IsPlayerCharacter())
            SetupDream(CharacterState.Character);

        
    }

    void SetupSleeper(AGothicCharacter Character)
    {
        Character.GetGothicAbilitySystemComponent().AddTag(m_SleeperStateTag);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (CharacterState.Character == nullptr || !CharacterState.Character.IsPlayerCharacter())
            return;

        UWeatherSubsystem::Get().UnfreezeSkyTime();
        UWeatherSubsystem::Get().SetPlayerWeatherImmediate(EWeather::Sunny);

        if (CharacterState.Character.m_BloodComponent != nullptr)
        {
            CharacterState.Character.m_BloodComponent.ClearBlood();
        }

        if (CharacterState.Character.m_DirtComponent != nullptr)
        {
            CharacterState.Character.m_DirtComponent.SetDirt(0.0f);
        }

        if (CharacterState.Character.WeatherComponent != nullptr)
        {
            CharacterState.Character.WeatherComponent.SetWetness(0.0f);
        }
    }

    UPROPERTY()
    FClockTime ClockTime;

    UPROPERTY()
    EWeather Weather;

    /** Override to add functionality */
    UFUNCTION()
    void SetupDream(AGothicCharacter Character) 
    {
        UWeatherSubsystem::Get().FreezeSkyTime(FInGameTime::FromSeconds(ClockTime.GetTotalSeconds()));
        UWeatherSubsystem::Get().SetPlayerWeatherImmediate(Weather);
        UGameTimeSubsystem::Get().AdvanceToClockTime(ClockTime);

        if(ShouldTriggerCharacterSpawn())
        {
            UPuzzlesSubsystem::CallGlobalEvent(Character.GetWorld(), m_WorldEventName);
            SaveDreamProgression();
        }
    }

    bool ShouldTriggerCharacterSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
            {
                return false;
            }
        }
        return true;
    }

    void SaveDreamProgression()
    {
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Harpies"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Harpies : URegionTrait_SleeperTempleRegionTrait_Dream
{
    bool ShouldTriggerCharacterSpawn() override
    {
        return false;
    }
    
    default Weather = EWeather::Rain_Level3;
    default ClockTime = FClockTime(03, 0);
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Harpies Spawn"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Harpies_Spawn : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Harpies";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Harpies_Spawn";
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Mine"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Mine : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Mine";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Mine_Spawn";

    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(00, 0);

    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Mine;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(0.228094, 0.228094, 0.228094));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Orcs"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Orcs : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(16, 0);

    //@DE - Spawn controlled by event on sand tornado
    bool ShouldTriggerCharacterSpawn() override
    {
        return false;
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Diego"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Diego : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Diego";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Diego_Spawn";

    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(16, 0);

    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Diego;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(1, 1, 1));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Milten"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Milten : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Milten";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Milten_Spawn";

    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(00, 0);

    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Milten;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(1,1,1));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Gorn"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Gorn : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Gorn";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Gorn_Spawn";

    default Weather = EWeather::Rain_Level2;
    default ClockTime = FClockTime(12, 0);

    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Gorn;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(1, 1, 1));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Lester"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Lester : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Lester";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Lester_Spawn";

    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(15, 0);
    
    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Lester;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(1.966857, 1.966857, 1.966857));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Xardas"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Xardas : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default m_SaveValue = n"SleeperTempleRegionTrait_Dream_Xardas";
    default m_WorldEventName = n"SleeperTempleRegionTrait_Dream_Xardas_Spawn";

    default Weather = EWeather::Rain_Level2;
    default ClockTime = FClockTime(12, 0);

    default m_SleeperStateTag = GameplayTag::State_SleeperDream_Xardas;

    void SetupSleeper(AGothicCharacter Character) override
    {
        Super::SetupSleeper(Character);
        Character.SetActorScale3D(FVector(1,1,1));
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Kalom"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Kalom : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(00, 0);

    //@DE - Spawn controlled by event on the heart altar
    bool ShouldTriggerCharacterSpawn() override
    {
        return false;
    }
}

UCLASS(meta=(DisplayName="Sleeper Temple Region Trait Dream Kalom Mid"))
class URegionTrait_SleeperTempleRegionTrait_Dream_Kalom_Mid : URegionTrait_SleeperTempleRegionTrait_Dream
{
    default Weather = EWeather::Sunny;
    default ClockTime = FClockTime(00, 0); 

    //@DE - Spawn controlled by event on the heart altar
    bool ShouldTriggerCharacterSpawn() override
    {
        return false;
    }
}