UCLASS()
class UAIAgentConfig_Human_SC_NOV_Lester : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_SC_NOV_Lester::StaticClass();
    default m_AnimConfig = UAnimConfig_Lester_Sleeper::StaticClass();
}

#ifdef WITH_STORY_G1R
UCLASS()
class UDailyRoutine_SC_NOV_Lester_Start : UAIState_DailyRoutine_Human
{
     default Schedule(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_29");

     default ScheduleIfRaining(8, 0, UAIState_Smalltalk(), n"FP_SC_SMALLTALK_12");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_OldMineTunnel : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_LESTER_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_OldMineLookingFor4Friends : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smoke(), n"FP_OM_LESTER_CAMP");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_OutsideOldMine : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Guard(), n"FP_OM_LESTER_WAIT2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_GuideToWatterfall : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_Lester_Guide(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_FourFriendsMeeting : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smoke(), n"FP_OM_LESTER_CAMP");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_TempleEntrance : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Stand(), n"FP_SC_LESTER_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_LightHouse : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Smoke(), n"FP_OM_LESTER_CAMP2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Fortresswait : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Stand(), n"FP_FORTRESS_LESTER_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_FortressAfterBridge : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Stand(), n"FP_FORTRESS_LESTER_AFTERBRIDGE");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Fortressfollow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_SC_NOV_Lester_FollowHeroWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_SecondFloor : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_RunToStandAround(), n"FP_FORTRESS_LESTER_SECONDFLOOR");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Balkon : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_RunToStandAround(),n"FP_FORTRESS_LESTER_BALKON");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Waitatfocus : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Stay(), n"FP_FORTRESS_LESTER_TALK");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_SecretDoor : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Inspect_Down(), n"FP_FORTRESS_LESTER_SECRETDOOR");
}


UCLASS()
class UDailyRoutine_SC_NOV_Lester_Book : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_ReadBook(), n"IO_MF_BOOKSHELF_01");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Guidetosmith : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_Lester_Guidetosmith(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_SC_NOV_Lester_Guidetotempel : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_Lester_Guidetotempel(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_SC_NOV_Lester_Guidetotrain : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_Lester_Guidetotrain(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_SC_NOV_Lester_Guidetoherb : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_SC_NOV_Lester_Guidetoherb(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_WaitSmithForOneHour : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Lester_Start;

    default Schedule(0, 0, UAIState_StandAround(), n"GuidePoint_SC_Blacksmith",400);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_WaitTempelForOneHour : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Lester_Start;

    default Schedule(0, 0, UAIState_StandAround(), n"GuidePoint_SC_Temple",400);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_WaitTrainForOneHour : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Lester_Start;

    default Schedule(0, 0, UAIState_StandAround(), n"GuidePoint_SC_Train",400);
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_WaitHerbForOneHour : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromHours(1);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Lester_Start;

    default Schedule(0, 0, UAIState_Smoke(), n"GuidePoint_SC_Herb",400);
}

UCLASS()
class UAIState_SC_NOV_Lester_Guidetosmith : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Blacksmith"));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Blacksmith"));
}

UCLASS()
class UAIState_SC_NOV_Lester_Guidetotempel : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Temple"));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Temple"));
}

UCLASS()
class UAIState_SC_NOV_Lester_Guidetotrain : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Train"));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Train"));
}

UCLASS()
class UAIState_SC_NOV_Lester_Guidetoherb : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Herb"));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"GuidePoint_SC_Herb"));
}

UCLASS()
class UAIState_SC_NOV_Lester_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 100.f;
    default WaitAtPlaceAction = UAIState_Smoke::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_SC_NOV_Lester_FourFriendsMeeting::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_OldMineToWaterfall_end", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_PrepareFocus : UAIState_DailyRoutine_Human
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(7);
    default AutoSwitchToRoutine = UDailyRoutine_SC_NOV_Lester_CheckFocusGiven;

    default Schedule(8, 0, UAIState_Smoke(), n"FP_OM_LESTER_CAMP2");
}

UCLASS()
class UDailyRoutine_SC_NOV_Lester_Ritual : UAIState_DailyRoutine_Human
{
    default Schedule(8, 00, UAIState_StandAround(), n"FP_SC_PROPHECY_LESTER");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UAIState_SC_NOV_Lester_FollowHeroWhenFarAwayThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutineAgressive
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_SC_NOV_Lester_Fortresswait;
    default DistanceUntilStop = 10000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}

class UDailyRoutine_SC_NOV_Lester_CheckFocusGiven : UAIState_DailyRoutine_Human
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        if(G1R::Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && G1R::Quest::SwampCamp_SCCHAPTER3_FORTRESS.HasSucceeded())
    {
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book::StaticClass());
    }
    else
    {
        if(IsValid(FCharacterUniqueName(n"SC_NOV_Lester").NPCState))
        FCharacterUniqueName(n"SC_NOV_Lester").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortresswait::StaticClass());
    }
    }
    
}
#endif