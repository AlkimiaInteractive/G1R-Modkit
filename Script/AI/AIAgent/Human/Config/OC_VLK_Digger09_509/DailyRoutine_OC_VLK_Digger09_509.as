UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger09_509 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger09_509::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_VLK_Digger09_509_Start : UAIState_DailyRoutine_Human_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_36);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DIGGER509");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DIGGER509");

    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_35",500);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_01",500.f);
    default Schedule(14, 0, UAIState_RepairBuilding(), n"FP_OC_REPAIRHUT_35",500);
    default Schedule(19, 0, UAIState_Eat(), n"IO_OC_CHAIR_01",500);
    default Schedule(20, 30, UAIState_SitAround(), n"IO_OC_CHAIR_01", WaypointRadius = 500);
}
