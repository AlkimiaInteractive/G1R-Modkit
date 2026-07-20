UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue02_804 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue02_804::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue02_804_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_LaresGuards);
    default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_16",100);
    default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_16",100);
    default Schedule(8, 30, UAIState_Guard(), n"FP_NC_GUARD_16",100);
    default Schedule(23, 30, UAIState_Eat(), n"FP_NC_GUARD_16",100);
}