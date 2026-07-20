UCLASS()
class UAIAgentConfig_Orc_OW_OPS_Umakhal_2402 : UAIAgentConfig_Orc
{
    default m_CharacterDefinition = UCharacterDefinition_Orc_OW_OPS_Umakhal_2402::StaticClass();
}

class UDailyRoutine_OW_OPS_Umakhal_2402_Start : UAIState_DailyRoutine_Orc
{
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_46");
}

class UDailyRoutine_OW_OPS_Umakhal_2402_Follow : UAIState_DailyRoutine_Orc
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHeroWhenCloseThenWaitEntrance(), Location::Anywhere);
}

class UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone : UAIState_DailyRoutine_Orc
{
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_47");
}

class UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance : UAIState_DailyRoutine_Orc
{
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_50");
}

class UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena : UAIState_DailyRoutine_Orc
{
    default RolesWhileAssigned.AddTag(GameplayTag::Role_OrcDungeonGuard);
    
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_52");
}

class UDailyRoutine_OW_OPS_Umakhal_2402_WaitCave : UAIState_DailyRoutine_Orc
{
    default Schedule(17, 0, UAIState_Orc_StandAround(), n"FP_OTOWN_STAND_54");
}

UCLASS()
class UAIState_FollowHeroWhenCloseThenWaitEntrance : UAIState_FollowWhenCloseThenDoRoutine
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance;
    default DistanceUntilStop = 5000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}