UCLASS()
class UAIAgentConfig_Human_OC_KDF_Damarok_401 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Damarok_401::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_KDF_Damarok_401_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_01);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_DAMAROK");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_DAMAROK");
}

UCLASS()
class UDailyRoutine_OC_KDF_Damarok_401_Start : UDailyRoutine_OC_KDF_Damarok_401_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(6, 10, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_66",500);
    default Schedule(7, 10, UAIState_PotionAlchemy(), n"IO_OC_POTION_ALCHEMY_01",500);
    default Schedule(12, 0, UAIState_Eat(), n"IO_OC_CHAIR_BENCH_66",500);
    default Schedule(13, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_03",500);
    default Schedule(16, 0, UAIState_PotionAlchemy(), n"IO_OC_POTION_ALCHEMY_01",500);
    default Schedule(20, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_62",500);
    default Schedule(21, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_62",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Damarok_401_PreRitual : UDailyRoutine_OC_KDF_Damarok_401_Ownership
{
    default Schedule(7, 10, UAIState_PotionAlchemy(), n"IO_OC_POTION_ALCHEMY_01",500);
    default Schedule(13, 0, UAIState_ReadBook_Shelf(), n"IO_OC_SHELF_03",500);
    default Schedule(16, 0, UAIState_PotionAlchemy(), n"IO_OC_POTION_ALCHEMY_01",500);
    default Schedule(20, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_62",500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Damarok_401_Kdfritual : UDailyRoutine_OC_KDF_Damarok_401_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAIRCASE_TOP_CHAPEL_DAMAROK");
}

UCLASS()
class UDailyRoutine_OC_KDF_Damarok_401_WaitYard : UDailyRoutine_OC_KDF_Damarok_401_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_YARD_5", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 