UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard41_293N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard41_293N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard41_293N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(7, 30, UAISTate_Guard_Watch_Patrolling_Route_Guard41(), n"BreadcrumbActor_OC_FallenTower_Guard293N_1");
}