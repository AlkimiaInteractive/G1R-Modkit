UCLASS()
class UAIAgentConfig_Human_OC_KDF_Drago_403 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Drago_403::StaticClass();

}


UCLASS()
class UDailyRoutine_OC_KDF_Drago_403_Ownership : UAIState_DailyRoutine_Human
{
   default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_01);
   default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DRAGO");
   default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DRAGO");
}

UCLASS()
class UDailyRoutine_OC_KDF_Drago_403_Start : UDailyRoutine_OC_KDF_Drago_403_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_55");
    default Schedule(7, 0, UAIState_PracticeMagic(), n"FP_OC_PRACTICEMAGIC_01",500);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_65",500);
    default Schedule(11, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_02",500);
    default Schedule(16, 0, UAIState_PracticeMagic(), n"FP_OC_PRACTICEMAGIC_01",500);
    default Schedule(20, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_55");
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_66");
}

UCLASS()
class UDailyRoutine_OC_KDF_Drago_403_PreRitual : UDailyRoutine_OC_KDF_Drago_403_Ownership
{
    default Schedule(7, 0, UAIState_PracticeMagic(), n"FP_OC_PRACTICEMAGIC_01",500);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_65",500);
    default Schedule(11, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_02",500);
    default Schedule(16, 0, UAIState_PracticeMagic(), n"FP_OC_PRACTICEMAGIC_01",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Drago_403_Kdfritual : UDailyRoutine_OC_KDF_Drago_403_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAIRCASE_TOP_CHAPEL_DRAGO");
}

UCLASS()
class UDailyRoutine_OC_KDF_Drago_403_WaitYard : UDailyRoutine_OC_KDF_Drago_403_Ownership
{
    default Schedule(20, 0, UAIState_StandAround(), n"FP_OC_STAND_YARD_1", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

