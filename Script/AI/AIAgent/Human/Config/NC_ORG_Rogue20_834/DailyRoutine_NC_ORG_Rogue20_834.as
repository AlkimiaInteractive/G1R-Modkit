UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue20_834 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue20_834::StaticClass();

}



UCLASS()
class UDailyRoutine_NC_ORG_Rogue20_834_Start : UAIState_DailyRoutine_Human
{
    // default Schedule(0, 0, UAIState_Sleep(), n"FP_NC_GUARD_06",100);
    // default Schedule(8, 0, UAIState_Eat(), n"FP_NC_GUARD_06",100);
    default Schedule(9, 5, UAISTate_Guard_Watch_Patrolling_Rogue20(), n"BreadcrumbActor_NC_ENTRANCE_PATROL_1",100);
    //default Schedule(13, 5, UAIState_GuardPatrol(), n"FP_NC_GUARD_07", 100.0f);
    //default Schedule(18, 5, UAIState_Guard(), n"FP_NC_GUARD_08",100);
    //default Schedule(23, 30, UAIState_Eat(), n"FP_NC_GUARD_09",100);
}

UCLASS()
class UAISTate_Guard_Watch_Patrolling_Rogue20 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f; // 1.f => try to perform an action on every spot on the way

    default SpotNames.Add(n"BreadcrumbActor_NC_ENTRANCE_PATROL_1");
    default SpotNames.Add(n"BreadcrumbActor_NC_ENTRANCE_PATROL_2");
    default SpotNames.Add(n"BreadcrumbActor_NC_ENTRANCE_PATROL_3");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_GuardWatch));
}