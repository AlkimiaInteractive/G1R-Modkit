UCLASS()
class UAIAgentConfig_Human_OC_GRD_Guard40_292N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Guard40_292N::StaticClass();
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard40_292N_Start : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Hut);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Cage_01);
    default Schedule(9, 0, UAIState_CheckGoods_TakeNotes(), n"ExchangeZone_Supplies_Freepoint_6",2000);
    default Schedule(13, 0, UAIState_Eat_Seated(), n"IO_EZ_CHAIR_BENCH_02",400);
    default Schedule(14, 30, UAIState_CheckGoods_TakeNotes(), n"ExchangeZone_Supplies_Freepoint_6",2000);
    default Schedule(19, 0, UAIState_Drink(), n"IO_EZ_CHAIR_BENCH_02",400);
    default Schedule(0, 0, UAIState_Sleep(), n"IO_EZ_CHAIR_BENCH_02",400);
}

UCLASS()
class UDailyRoutine_OC_GRD_Guard40_292N_Mining : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Hut);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ExchangeZone_Cage_01);

    default Schedule(9, 0, UAIState_PickOre(), n"FP_EZ_MINING",400);
}