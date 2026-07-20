UCLASS()
class UAIAgentConfig_Human_OC_KDF_Corristo_402 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Corristo_402::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_CORRISTO");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_CORRISTO");
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_01);
}

class UDailyRoutine_OC_KDF_Corristo_402_Start : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(16, 0, UAIState_Inscription(), n"IO_OC_INSCRIPTION_02",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_AfterPermission : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_59",500);
    default Schedule(7, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_01",300);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_59");
    default Schedule(13, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_01",500);
    default Schedule(16, 0, UAIState_Inscription(), n"IO_OC_INSCRIPTION_02",500);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_59");
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_59");
}

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_Kdfritual : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAIRCASE_TOP_CHAPEL", 300);
}

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_Waitforsc : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_HALLCHAPEL_CORRISTO", 300);
} 

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_WaitYard : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_YARD_3", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

UCLASS()
class UDailyRoutine_OC_KDF_Corristo_402_LastChance : UDailyRoutine_OC_KDF_Corristo_402_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_GOMEZ_ROOM", 300);
}