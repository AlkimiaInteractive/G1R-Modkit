UCLASS()
class UAIAgentConfig_Human_BC_BAN_Bandit_01 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Bandit_01::StaticClass();

}

UCLASS()
class UDailyRoutine_BC_BAN_Bandit_01_Start : UAIState_DailyRoutine_Human
{
    // default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_BanditsCamp_Plateau_MainCamp_LootCave);
    default Schedule(0, 0, UAIState_Guard(), n"FP_BC_Guard_01");
    default Schedule(23, 0, UAIState_Sleep(), n"FP_BC_Guard_01");

    default ScheduleIfRaining(0, 0, UAIState_RainShelter(), n"FP_BC_RAINSHELTER_01", 300);
}