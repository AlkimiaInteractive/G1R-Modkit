UCLASS()
class UAIAgentConfig_Human_OC_KDF_Torrez_405 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Torrez_405::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_02);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_TORREZ");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_TORREZ");
}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_Ch2 : UDailyRoutine_OC_KDF_Torrez_405_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_58");
    default Schedule(7, 0, UAIState_ReadBook_Seated(), n"IO_OC_CHAIR_BENCH_61",500);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_66",500);
    default Schedule(10, 0, UAIState_Drink(), n"FP_OC_STAND_CAMPFIRE_01",500);
    default Schedule(11, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_52",500);
    default Schedule(16, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_05",500);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_58",500);
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_67",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_58");
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_54",500);
    default ScheduleIfRaining(16, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_05",500);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_58",500);
    default ScheduleIfRaining(21, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_54",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_Start : UDailyRoutine_OC_KDF_Torrez_405_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    // default Schedule(7, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_TORREZ_90", 600);
    // default Schedule(9, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_TORREZ_90",100);
    // default Schedule(15, 0, UAIState_Eat(), n"FP_OC_STANDAROUND_TORREZ_90",600);
     default Schedule(7, 0, UAIState_PracticeMagic(), n"FP_OC_STANDAROUND_TORREZ_90",600);

    default Schedule(17, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_TORREZ_91",100);
    // default Schedule(21, 0, UAIState_SitAround(), n"FP_OC_STANDAROUND_TORREZ_91",600);

    default ScheduleIfRaining(7, 0, UAIState_StandAround(), n"FP_OC_RAINSHELTER_200_TORREZ",500);
    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed);
}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_PreRitual : UDailyRoutine_OC_KDF_Torrez_405_Ownership
{
    default Schedule(9, 0, UAIState_ReadBook_Seated(), n"IO_OC_CHAIR_140",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_Kdfritual : UDailyRoutine_OC_KDF_Torrez_405_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAIRCASE_TOP_CHAPEL_TORREZ");
}

UCLASS()
class UDailyRoutine_OC_KDF_Torrez_405_WaitYard : UDailyRoutine_OC_KDF_Torrez_405_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_YARD_4", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 