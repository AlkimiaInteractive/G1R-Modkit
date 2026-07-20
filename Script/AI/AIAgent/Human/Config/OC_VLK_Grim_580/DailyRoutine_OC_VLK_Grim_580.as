UCLASS()
class UAIAgentConfig_Human_OC_VLK_Grim_580 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_VLK_Grim_580::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_VLK_Grim_580_Ownership : UDailyRoutine_Digger
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_OuterRing_Hut_2);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_GRIM");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_GRIM");
}

UCLASS()
class UDailyRoutine_OC_VLK_Grim_580_Start : UDailyRoutine_OC_VLK_Grim_580_Ownership
{
    default Schedule(6, 30, UAIState_WashSelf(), n"FP_OC_WASHSELF_03",500.0f);
    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_26",700.0f);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_61",1000.0f);
    default Schedule(12, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_07",300.0f);
    default Schedule(12, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_61",300.0f);
    default Schedule(15, 30, UAIState_Eat(), n"IO_OC_CHAIR_26",300.0f);
    default Schedule(16, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_07",300.0f);
    default Schedule(18, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_30",300.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}

UCLASS()
class UDailyRoutine_OC_VLK_Grim_580_InExtremoWait : UDailyRoutine_OC_VLK_Grim_580_Ownership
{
    default Schedule(7, 0, UAIState_SitAround(), n"IO_OC_CHAIR_26",700.0f);
    default Schedule(10, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_61",1000.0f);
    default Schedule(12, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_07",300.0f);
    default Schedule(12, 30, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_61",300.0f);
    default Schedule(15, 30, UAIState_Eat(), n"IO_OC_CHAIR_26",300.0f);
    default Schedule(16, 0, UAIState_Cook(), n"IO_OC_CAMPFIRE_PAN_07",300.0f);
    default Schedule(18, 0, UAIState_SitCampfire(), n"IO_OC_CHAIR_30",300.0f);
    default Schedule(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);

    default ScheduleIfRaining(6, 30, UAIState_RainShelter_Digger(), Location::Home,500);
    default ScheduleIfRaining(23, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
}


UCLASS()
class UDailyRoutine_OC_VLK_Grim_580_WaitGuide : UDailyRoutine_OC_VLK_Grim_580_Ownership
{
    default Schedule(6, 30, UAIState_StandAround(), n"FP_GRIM_GUIDING_GOAL",500.0f);
}


UCLASS()
class UAIState_OC_VLK_Grim_580_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 120.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_VLK_Grim_580_WaitGuide::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Grim_Start",  EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Grim_02",  EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Grim_03",  EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Grim_04",  EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_GRIM_GUIDING_GOAL",  EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_OC_VLK_Grim_580_Guide : UAIState_DailyRoutine_Human
{
    default Schedule(22, 0, UAIState_OC_VLK_Grim_580_Guide(), Location::Anywhere);
}
