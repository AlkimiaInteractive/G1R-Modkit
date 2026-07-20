UCLASS()
class UAIAgentConfig_Human_OC_GRD_Orry_254 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_GRD_Orry_254::StaticClass();

}



UCLASS()
class UDailyRoutine_OC_GRD_Orry_254_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 45, UAIState_SleepStanding(), n"WatchingPoint2",500);
    default Schedule(6, 0, UAIState_Eat(), n"WatchingPoint2",500);
    default Schedule(6, 30, UAIState_Guard(), n"WatchingPoint2",500);
    default Schedule(23, 32, UAIState_Eat(), n"WatchingPoint2",500);
    
    // Example for using the name of a spot as look-at-point: 
    // for each AIState, "IdleFocusSpotName" can be set.  UAIState_Guard has a constructor that takes in the variable to set
    default Schedule(6, 30, UAIState_Guard(n"FP_OrryLookAt"), n"WatchingPoint2",500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Orry_254_AbandonedMine : UAIState_DailyRoutine_Human
{
    default Schedule(6, 30, UAIState_Guard(), n"FP_AM_ORRY",500);
}

UCLASS()
class UDailyRoutine_OC_GRD_Orry_254_Omfull : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_OC_GRD_Orry_254_Fmtaken : UAIState_DailyRoutine_Human
{

}


UCLASS()
class UDailyRoutine_OC_GRD_Orry_254_Orcassault : UAIState_DailyRoutine_Human
{

} 
