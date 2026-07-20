UCLASS()
class UAIAgentConfig_Human_OC_VLK_Digger43_579N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Digger43_579N::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Digger43_579N_Start : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Eat_Seated(), n"IO_OC_CHAIR_41",500);
    default Schedule(8, 30, UAIState_RoastScavenger(), n"IO_OC_CAMPFIRE_ROTISSERIE_03",500);
    //default Schedule(12, 30, UAIState_Eat_Seated(), n"IO_OC_CHAIR_41",500);
    //default Schedule(13, 30, UAIState_SitAround(), n"IO_OC_CHAIR_41",500);
    default Schedule(0, 30, UAIState_Sleep_Seated(), n"IO_OC_CHAIR_41",500);

    default ScheduleIfRaining(6, 30, UAIState_Eat_Seated(), n"IO_OC_CHAIR_41",1500);
    default ScheduleIfRaining(8, 30, UAIState_SitAround(), n"IO_OC_CHAIR_41",1500);
    default ScheduleIfRaining(12, 30, UAIState_Eat_Seated(), n"IO_OC_CHAIR_41",1500);
    default ScheduleIfRaining(13, 30, UAIState_SitAround(), n"IO_OC_CHAIR_41",1500);
    default ScheduleIfRaining(0, 30, UAIState_Sleep_Seated(), n"IO_OC_CHAIR_41",1500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger43_579N_InExtremoWait : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Stand(), n"FP_OC_INEXTREMO_Fire_02", 200);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger43_579N_InExtremoConcert : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Firespit(), n"FP_OC_INEXTREMO_Fire_02", 200);
}

UCLASS()
class UDailyRoutine_OC_VLK_Digger43_579N_AfterConcert : UDailyRoutine_Digger
{
    default Schedule(6, 30, UAIState_Sweep(), n"FP_OC_INEXTREMO_Fire_02", 200);
}

