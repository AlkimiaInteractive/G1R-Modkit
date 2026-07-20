UCLASS()
class UAIAgentConfig_Human_OM_VLK_Digger18_562 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_VLK_Digger18_562::StaticClass();

}



UCLASS()
class UDailyRoutine_OM_VLK_Digger18_562_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_PickOre(), n"IO_OM_PICKORE_15");
    default Schedule(14, 0, UAIState_GrindingOven_TurnWheel(), n"IO_OM_TURNWHEEL_02");
}