UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_02 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_02::StaticClass();

}



UCLASS()
class UDailyRoutine_BC_BAN_Bandit_02_Start : UAIState_DailyRoutine_Human
{
    // default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp_LootCave);
    default Schedule(0, 0, UAIState_Guard(), n"FP_BC_Guard_02");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_BC_Guard_02");

    default ScheduleIfRaining(0, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_02", 300);
}