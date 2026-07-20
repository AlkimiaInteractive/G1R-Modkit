UCLASS()
class UAIAgentConfig_Human_OM_VLK_Grimes_586 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Grimes_586::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Grimes_586_Start : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_PickOre(), n"IO_OM_PICKORE_09");
    default Schedule(14, 0, UAIState_RoastScavenger(), n"IO_OM_CAMPFIRE_ROTISSERIE_01");
    default Schedule(20, 0, UAIState_PickOre(), n"IO_OM_PICKORE_09");
    default Schedule(23, 0, UAIState_Eat(), n"IO_OM_CHAIR_09",1000);
}

UCLASS()
class UDailyRoutine_OM_VLK_Grimes_586_Collapsed : UAIState_DailyRoutine_Human
{
    default Schedule(8, 30, UAIState_SitAround(), n"FP_OM_FL_WOUNDED_08");
    default Schedule(15, 0, UAIState_Wounded(), n"FP_OM_FL_WOUNDED_08");

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}