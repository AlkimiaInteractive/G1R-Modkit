UCLASS()
class UAIAgentConfig_Orc_UL_OSL_UrShak_2200 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_UL_OSL_UrShak_2200::StaticClass();
}

UCLASS()
class UDailyRoutine_UL_OSL_UrShak_2200_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_GUARD_ORC_179",400);
}

UCLASS()
class UDailyRoutine_UL_OSL_UrShak_2200_Leftfm : UAIState_DailyRoutine_Orc
{
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OrcEnclave);

    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_URSHAK_EXTERIOR",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_UL_OSL_UrShak_2200_Wait : UAIState_DailyRoutine_Orc
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_DailyRoutine_WatchFight);
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OrcEnclave);

    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_45",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_UL_OSL_UrShak_2200_AfterFight : UAIState_DailyRoutine_Orc
{
    default AssociatedCrimeAreas.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
    
    default Schedule(23, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_22",400);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}