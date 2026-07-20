UCLASS()
class UAIAgentConfig_Human_OM_STT_Santino_335 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OM_STT_Santino_335::StaticClass();

}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Level_01_Santino);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_81);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_80);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_Virtual_SantinoDoor);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_01_CM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_01_CM");
}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_Ownership_AllowPlayer : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldMine_Interior_GreatStope_Level_01_Santino);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_81);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_80);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_01_CM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_01_CM");
}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_Start : UDailyRoutine_OM_STT_Santino_335_Ownership
{
    
    default Schedule(0, 0, UAIState_LeanBar(), n"FP_OM_SHOP_01");
    default Schedule(12, 0, UAIState_LeanBar(), n"FP_OM_SHOP_01");

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_Chapter3 : UDailyRoutine_OM_STT_Santino_335_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_104",200);
    default Schedule(12, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_105",200);
    default Schedule(15, 0, UAIState_Sit(), n"IO_OC_CHAIR_142",200);
    default Schedule(16, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(18, 0, UAIState_CheckGoods(), n"FP_OC_CHECKGOODS_01");
    default Schedule(20, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(23, 0, UAIState_Smoke(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(10, 0, UAIState_Sit(), n"IO_OC_CHAIR_142");
    default ScheduleIfRaining(18, 0, UAIState_CheckGoods(), n"FP_OC_CHECKGOODS_01");
    default ScheduleIfRaining(22, 0, UAIState_Smoke(), n"FP_OC_STANDAROUND_106");
    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_Chapter3Allow : UDailyRoutine_OM_STT_Santino_335_Ownership_AllowPlayer
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_104",200);
    default Schedule(12, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_105",200);
    default Schedule(15, 0, UAIState_Sit(), n"IO_OC_CHAIR_142",200);
    default Schedule(16, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(18, 0, UAIState_CheckGoods(), n"FP_OC_CHECKGOODS_01");
    default Schedule(20, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(23, 0, UAIState_Smoke(), n"FP_OC_STANDAROUND_108",200);
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);

    default ScheduleIfRaining(10, 0, UAIState_Sit(), n"IO_OC_CHAIR_142");
    default ScheduleIfRaining(18, 0, UAIState_CheckGoods(), n"FP_OC_CHECKGOODS_01");
    default ScheduleIfRaining(22, 0, UAIState_Smoke(), n"FP_OC_STANDAROUND_106");
    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OM_STT_Santino_335_GuidePassage : UDailyRoutine_OM_STT_Santino_335_Ownership_AllowPlayer
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_107",200);
}