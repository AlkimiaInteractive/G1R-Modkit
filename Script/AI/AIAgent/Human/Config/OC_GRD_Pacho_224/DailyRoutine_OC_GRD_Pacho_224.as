UCLASS()
class UAIAgentConfig_Human_OC_GRD_Pacho_224 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Pacho_224::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Pacho_224_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Sleep(), n"IO_BED_PACHO");
    default Schedule(8, 0, UAIState_PachoGuard(), n"FP_Watch_OW");
    default Schedule(12, 0, UAIState_Eat(), n"FP_SIT_OW");
    default Schedule(13, 0, UAIState_PachoGuard(), n"FP_SIT_OW");

     default ScheduleIfRaining(8, 0, UAIState_SitAround(), n"FP_SIT_OW_RAIN");
     default ScheduleIfRaining(14, 0, UAIState_Eat(), n"FP_SIT_OW_RAIN");
     default ScheduleIfRaining(0, 0, UAIState_Sleep(), n"IO_BED_PACHO");
}

UCLASS()
class UAIState_PachoGuard: UAIState_UseFreepoint 
{
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoTask()
    {
        while (!bShouldExitState)
        {
            int Random = Math::RandRange(0,100);
            
            if(Random >= 40)
            {
                AI.GuardPassage();
            }
            else
            {
                AI.Sit(24.0f);
            }
        }
    }
}