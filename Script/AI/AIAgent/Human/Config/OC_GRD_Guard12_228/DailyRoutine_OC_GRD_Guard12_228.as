UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard12_228 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard12_228::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_GRD_Guard12_228_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GUARD228");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GUARD228");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard12_228_Prestart : UDailyRoutine_OC_GRD_Guard12_228_Ownership
{
    default Schedule(19, 55, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_21");
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard12_228_Start : UDailyRoutine_OC_GRD_Guard12_228_Ownership
{
    default Schedule(8, 0, UAIState_EatAndEnsureGateIsOpened(), n"Interactive_Winch851135");
    default Schedule(8, 30, UAIState_SharpWeaponAndEnsureGateIsOpened(), n"Interactive_Winch851135");
    default Schedule(13, 0, UAIState_EatAndEnsureGateIsOpened(), n"Interactive_Winch851135");
    default Schedule(14, 30, UAIState_SharpWeapon(), n"Interactive_Winch851135");
    default Schedule(17, 45, UAIState_EatAndEnsureGateIsOpened(), n"Interactive_Winch851135");
    default Schedule(22, 30, UAIState_SitAroundAndEnsureGateIsOpened(), n"Interactive_Winch851135");
    default Schedule(23, 30, UAIState_Sleep(), Location::Bed,300);
}

UCLASS()
class UAIState_EatAndEnsureGateIsOpened : UAIState_EnsureGateIsOpened 
{
    default WinchSpot = n"Interactive_Winch851135";
    default SpawnedInteractionTask = UAIState_EatAndEnsureGateIsOpened_Spawned;
}

UCLASS()
class UAIState_SharpWeaponAndEnsureGateIsOpened : UAIState_EnsureGateIsOpened
{
    default WinchSpot = n"Interactive_Winch851135";
    default SpawnedInteractionTask = UAIState_SharpWeaponAndEnsureGateIsOpened_Spawned;
}

UCLASS()
class UAIState_SitAroundAndEnsureGateIsOpened : UAIState_EnsureGateIsOpened
{
    default WinchSpot = n"Interactive_Winch851135";
    default SpawnedInteractionTask = UAIState_SitAroundAndEnsureGateIsOpened_Spawned;
}

UCLASS()
class UAIState_EatAndEnsureGateIsOpened_Spawned : UAIState_RandomInteractions 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Open_Gate, InMayUseCustomAbility = true));
    default Interactions.Last().Priority = 1;
        
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat,InDurationSeconds = 5.0f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;

    default AdditionalLocationAndRadius.Add(n"IO_OC_CHAIR_BENCH_03", 1000.0f);
}

UCLASS()
class UAIState_SharpWeaponAndEnsureGateIsOpened_Spawned : UAIState_RandomInteractions_Human 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Open_Gate, InMayUseCustomAbility = true));
    default Interactions.Last().Priority = 1;
        
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon,InDurationSeconds = 5.0f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;

    default AdditionalLocationAndRadius.Add(n"IO_OC_CHAIR_BENCH_03", 1000.0f);
} 

UCLASS()
class UAIState_SitAroundAndEnsureGateIsOpened_Spawned : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Open_Gate, InMayUseCustomAbility = true));
    default Interactions.Last().Priority = 1;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink_Seated, 0.25f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayStone_Seated, 0.15f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_PlayKnife, 0.15f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SmokeWeed_Seated, 0.25f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CarveWood, 0.15f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon, 0.1f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Ground, 0.25f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.1f, InDurationVariance = 1.0f));
    default Interactions.Last().Priority = 0;

    default AdditionalLocationAndRadius.Add(n"IO_OC_CHAIR_BENCH_03", 1000.0f);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard12_228_Fmtaken : UDailyRoutine_OC_GRD_Guard12_228_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_21");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard12_228_Orcassault : UAIState_DailyRoutine_Human
{

}