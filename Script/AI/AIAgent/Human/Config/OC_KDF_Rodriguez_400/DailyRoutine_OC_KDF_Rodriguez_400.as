UCLASS()
class UAIAgentConfig_Human_OC_KDF_Rodriguez_400 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Rodriguez_400::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_02);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_RODRIGUEZ");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_RODRIGUEZ");
}


UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_Start : UDailyRoutine_OC_KDF_Rodriguez_400_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_57",500);
    default Schedule(8, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_66",500);
    default Schedule(10, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_04");
    default Schedule(11, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_52",500);
    default Schedule(16, 0, UAIState_Inscription(), n"IO_OC_INSCRIPTION_01",500);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_57",500);
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_61",500);

    default ScheduleIfRaining(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default ScheduleIfRaining(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_57");
    default ScheduleIfRaining(7, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_54",500);
    default ScheduleIfRaining(16, 0, UAIState_Inscription(), n"IO_OC_INSCRIPTION_01",500);
    default ScheduleIfRaining(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_57",500);
    default ScheduleIfRaining(21, 0, UAIState_RainShelter_Shadow(), n"IO_OC_CHAIR_BENCH_54",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_PreRitual : UDailyRoutine_OC_KDF_Rodriguez_400_Ownership
{
    default Schedule(8, 0, UAIState_Inscription(), n"IO_OC_INSCRIPTION_01",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_Kdfritual : UDailyRoutine_OC_KDF_Rodriguez_400_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAIRCASE_TOP_CHAPEL_RODRIGUEZ");
}

UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_WaitYard : UDailyRoutine_OC_KDF_Rodriguez_400_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_YARD_2", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

UCLASS()
class UDailyRoutine_OC_KDF_Rodriguez_400_Door : UDailyRoutine_OC_KDF_Rodriguez_400_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_92_MILTEN");
}