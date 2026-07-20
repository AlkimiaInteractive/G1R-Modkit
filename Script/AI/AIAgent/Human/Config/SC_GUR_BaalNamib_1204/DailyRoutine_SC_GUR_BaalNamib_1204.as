UCLASS()
class UAIAgentConfig_Human_SC_GUR_BaalNamib_1204: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_GUR_BaalNamib_1204::StaticClass();

}

UCLASS()
class UDailyRoutine_SC_GUR_BaalNamib_1204_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_SwampCamp_Village_Huts_BaalNamib);
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalNamib_1204_Start : UDailyRoutine_SC_GUR_BaalNamib_1204_Ownership
{
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_30");

    default ScheduleIfRaining(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_15");
}

UCLASS()
class UDailyRoutine_SC_GUR_BaalNamib_1204_CampDivided : UDailyRoutine_SC_GUR_BaalNamib_1204_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OG_STANDAROUND_01",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

