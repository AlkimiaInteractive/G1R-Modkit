UCLASS()
class UAIAgentConfig_TC_TrollAdult_01 : UAIAgentConfig_Troll
{
    default m_CharacterDefinition = UCharacterDefinition_TC_TrollAdult_01::StaticClass();
}

class UDailyRoutine_TC_TrollAdult_01_Patrol : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAISTate_Patrolling_Route_TrollAdult_01(), n"Breadcrumb_TC_Troll_01");
}

UCLASS()
class UAISTate_Patrolling_Route_TrollAdult_01 : UAIState_RandomInteractions_ChainedSpots_Human
{
    default SpotNames.Add(n"Breadcrumb_TC_Troll_01");
    default SpotNames.Add(n"Breadcrumb_TC_Troll_02");
    default SpotNames.Add(n"Breadcrumb_TC_Troll_03");
    default SpotNames.Add(n"Breadcrumb_TC_Troll_04");
    default SpotNames.Add(n"Breadcrumb_TC_Troll_05");
    default SpotNames.Add(n"Breadcrumb_TC_Troll_06");
}
