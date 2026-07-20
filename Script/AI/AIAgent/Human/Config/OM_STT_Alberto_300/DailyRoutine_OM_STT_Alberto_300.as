UCLASS()
class UAIAgentConfig_Human_OM_STT_Alberto_300 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_STT_Alberto_300::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_STT_Alberto_300_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_LeanBar(), n"FP_OM_STAND_03");
    default Schedule(18, 3, UAIState_LeanBar(), n"FP_OM_STAND_03");

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UDailyRoutine_OM_STT_Alberto_300_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_03");
    default Schedule(11, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_01");
    default Schedule(13, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_02");
    default Schedule(16, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_03");
    default Schedule(19, 0, UAIState_TakeNotes(), n"FP_OM_FL_ANOTATEGOODS_01");
    default Schedule(21, 0, UAIState_StandAround(), n"FP_OM_STAND_03");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}