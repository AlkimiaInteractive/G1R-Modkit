UCLASS()
class UAIAgentConfig_Human_OM_STT_Ian_301 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_STT_Ian_301::StaticClass();

}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OM_STAND_04",100);
}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_SmallTalk : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OM_SMALLTALK_05");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_OutsideMine : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OM_REST_03");
}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_GreatHearing : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_GUARDPASSAGE_30");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_Repair : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_GUARDPASSAGE_30");
    default Schedule(10, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_37");
    default Schedule(12, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_38");
    default Schedule(17, 0, UAIState_StandAround(), n"FP_OC_GUARDPASSAGE_30");
    default Schedule(10, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_37");
    default Schedule(12, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_38");
}

UCLASS()
class UDailyRoutine_OM_STT_Ian_301_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_LeanBar(), n"FP_OM_FL_LEANBAR_01");

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}