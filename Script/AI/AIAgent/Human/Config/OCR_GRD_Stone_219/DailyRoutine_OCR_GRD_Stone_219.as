UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Stone_219 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Stone_219::StaticClass();

}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_STONE");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_STONE");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_Start : UDailyRoutine_OCR_GRD_Stone_219_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(),  Location::Bed);
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_34");
    default Schedule(8, 0, UAISTate_Stone_Smith(), n"IO_OC_FORGE_01");
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_22",300);

    default ScheduleIfRaining(1, 0, UAIState_Sleep(),  Location::Bed);
    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_88");
    default ScheduleIfRaining(8, 0, UAISTate_Stone_Smith(), n"IO_OC_FORGE_01");
    default ScheduleIfRaining(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_11",300);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_OCHeroInsideForge : UAIState_DailyRoutine_Human
{
    default Schedule(1, 0, UAIState_Sleep(),  Location::Bed);
    default Schedule(7, 0, UAIState_Eat(), n"FP_OC_CAMPFIRE_34");
    default Schedule(8, 0, UAIState_Smith_Anvil_Spawn(), n"IO_OC_ANVIL_01",100);
    default Schedule(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_22",300);

    default ScheduleIfRaining(1, 0, UAIState_Sleep(),  Location::Bed);
    default ScheduleIfRaining(7, 0, UAIState_Eat(), n"FP_OC_RAINSHELTER_88");
    default ScheduleIfRaining(8, 0, UAIState_Smith_Anvil_Spawn(), n"IO_OC_ANVIL_01",100);
    default ScheduleIfRaining(20, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_11",300);
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_Ot : UAIState_DailyRoutine_Human
{
    default Schedule(7, 0, UAIState_Sit(), n"FP_OC_STANDAROUND_14", 200);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Coward);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Oblivious);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_Otnew : UDailyRoutine_OCR_GRD_Stone_219_Ownership
{
    default Schedule(7, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_15");
    default SmithSchedule(8, 20, n"IO_OC_FORGE_01");
    default Schedule(20, 0, UAIState_SitAround(), n"IO_OC_CHAIR_BENCH_61");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_ScNew : UAIState_DailyRoutine_Human
{
    default Schedule(8, 31, UAIState_Smith_Fire(), n"IO_SC_FORGE_01");
    default Schedule(12, 10, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(15, 30, UAIState_Eat(), n"IO_SC_CHAIR_10");
    default Schedule(17, 31, UAIState_Smith_Fire(), n"IO_SC_FORGE_01");
    default Schedule(20, 10, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(23, 50, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_SCHeroInsideForge : UAIState_DailyRoutine_Human
{
    default Schedule(8, 31, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(15, 30, UAIState_Eat(), n"IO_SC_CHAIR_10");
    default Schedule(17, 31, UAIState_Smith_Anvil_Spawn(), n"IO_SC_ANVIL_2",100);
    default Schedule(23, 50, UAIState_Sleep_Seated(), n"IO_SC_CHAIR_10");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_NcNew : UAIState_DailyRoutine_Human
{
    default Schedule(11, 10, UAIState_Drink(), n"IO_NC_CHAIR_13",100);
    default Schedule(23, 30, UAIState_Sleep_Table(), n"IO_NC_CHAIR_13");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OCR_GRD_Stone_219_FollowHero : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Coward);
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Oblivious);
    
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(0, 0, UAIState_FollowHero(300.0f), Location::Anywhere); 
}

UCLASS()
class UAIState_OCR_GRD_Stone_219_GoToAlongFreepoints_NC : UAIState_GoToAlongFreepoints
{
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToNc_1"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToNc_2"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToNc_3"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToNc_4"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToNc_5"));

    default RoutineToReturnTo = UDailyRoutine_OCR_GRD_Stone_219_NcNew::StaticClass();
}

UCLASS()
class UAIState_DailyRoutine_OCR_GRD_Stone_219_GoToAlongFreepoints_NC : UAIState_DailyRoutine_Human
{
    default Schedule(10, 00, UAIState_OCR_GRD_Stone_219_GoToAlongFreepoints_NC(), NAME_None);
}

UCLASS()
class UAIState_OCR_GRD_Stone_219_GoToAlongFreepoints_SC : UAIState_GoToAlongFreepoints
{
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_1"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_2"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_3"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_4"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_5"));
	default GoAlongFreepoints.Add(FGoToFreepoint(n"GoToAlong_Path_FromTo_OcToSc_6"));

    default RoutineToReturnTo = UDailyRoutine_OCR_GRD_Stone_219_ScNew::StaticClass();
}

UCLASS()
class UAIState_DailyRoutine_OCR_GRD_Stone_219_GoToAlongFreepoints_SC : UAIState_DailyRoutine_Human
{
    default Schedule(10, 00, UAIState_OCR_GRD_Stone_219_GoToAlongFreepoints_SC(), NAME_None);
}