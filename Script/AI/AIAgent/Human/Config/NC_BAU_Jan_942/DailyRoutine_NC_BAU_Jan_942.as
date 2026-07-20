
UCLASS()
class UAIAgentConfig_Human_NC_BAU_Jan_942 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_BAU_Jan_942::StaticClass();
    default m_AnimConfig = UAnimConfig_NC_BAU_Jan;
}

UCLASS()
class UDailyRoutine_NC_BAU_Jan_942_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_ILWM_JanHouse_01);
    default KnownPlaces.Add(Location::Bed, n"IO_BED_JAN_942");
    default KnownPlaces.Add(Location::Home, n"IO_BED_JAN_942");
}

UCLASS()
class UDailyRoutine_NC_BAU_Jan_942_Start : UDailyRoutine_NC_BAU_Jan_942_Ownership
{
    default Schedule(0, 30, UAIState_Sleep(), n"IO_BED_JAN_942", 500);
    default Schedule(8, 0, UAIState_WashSelf(), n"FP_NC_WASHSELF_4", 500);
	default Schedule(8, 45, UAIState_Drink(), n"FP_DRINK_JAN_942", 500);
    default Schedule(9, 45, UAIState_Pee(), n"FP_PEE_JAN_942", 500);
    default Schedule(10, 30, UAIState_Eat_Seated(), n"IO_CHAIR_JAN_942", 500);
	default Schedule(14, 0, UAIState_Cook(), n"IO_PAN_JAN_942", 500);
    default Schedule(15, 0, UAIState_Eat_Seated(), n"IO_CHAIR_JAN_942_03", 500);
    default Schedule(16, 20, UAIState_Sleep_Seated(), n"IO_CHAIR_JAN_942", 500);
	default Schedule(17, 30, UAIState_WashSelf(), n"FP_NC_WASHSELF_4", 500);
	default Schedule(20, 0, UAIState_Cook(), n"IO_PAN_JAN_942", 500);
	default Schedule(21, 0, UAIState_Eat_Seated(), n"IO_CHAIR_JAN_942_02", 500);
	default Schedule(22, 20, UAIState_StandAround(), n"FP_DRINK_JAN_942", 500);

    default ScheduleIfRaining(0, 30, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(8, 0, UAIState_RainShelter_Shadow(), Location::Home);

}

UCLASS()
class UDailyRoutine_NC_BAU_Jan_942_TrainFight : UDailyRoutine_NC_BAU_Jan_942_Ownership
{
    default Schedule(0, 30, UAIState_StandAround(), n"FP_NC_WAIT_FIGHT_JAN", 100);
}