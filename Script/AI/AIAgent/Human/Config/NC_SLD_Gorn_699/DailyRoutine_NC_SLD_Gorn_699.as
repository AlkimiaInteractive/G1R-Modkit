UCLASS()
class UAIAgentConfig_Human_NC_SLD_Gorn_699 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_SLD_Gorn_699::StaticClass();

}

#ifdef WITH_STORY_G1R
UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_Village_Huts_Gorn);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_GORN");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_GORN");
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Start : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), n"IO_NC_BED_GORN");
    default Schedule(8, 0, UAIState_LeanWall(), n"FP_NC_GUARD_46",500);
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_FourFriendsMeeting : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OM_GORN_CAMP");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_LightHouse : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(8, 0, UAIState_SitAround(), n"IO_OG_CHAIR_BENCH_4");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ncwait : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"NC_PATH52");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinwait : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_RunToStandAround(), n"FP_AM_GORN_BRIDGE");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinwait2 : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_RunToStandAround(), n"FP_AM_GORN_BRIDGE");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinabyss : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(7, 45, UAIState_NC_SLD_Gorn_699_Guide(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinfollow : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_NC_SLD_Gorn_699_FollowHeroWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinwall : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_MonasteryGate(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_WaitAtWall : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_RunToStandAround(), n"FP_AM_GORN_GATE");
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinfollowinside : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHeroAggressive(150), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinstay : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_AM_GORN_YARD",300);
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinstay_02 : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_StandAround(), n"FP_AM_GORN_YARD_02");
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ruinyard : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_NC_SLD_Gorn_699_FollowHeroWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Ncreport : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(8, 0, UAIState_LeanWall(), n"FP_NC_GUARD_46",500);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Guardnc : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Guard(), n"FP_NC_GORN_GUARD");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Followtofmc : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_NC_SLD_Gorn_699_FollowHeroInFMWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Waitfmc : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_FM_ENTRANCE");
}


UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Waitfm : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_FM_ENTRANCE_GATE2");
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_WaitMine : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_FM_ENTRANCE_MINE");  
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_Wait : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(23, 0, UAIState_Stay(), n"FP_FM_ENTRANCE_MINE");
}

UCLASS()
class UAIState_NC_SLD_Gorn_699_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 180.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_NC_SLD_Gorn_699_WaitGuide::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Running;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_1", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_2", EWalkSpeed::Running));
    // default GoAlongFreepoints.Add(FGuideFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_2b", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_6", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_FromTo_MonasteryBridgeToChamber_7", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_WaitGuide : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_AM_GORN_CHAMBER");
}

UCLASS()
class UDailyRoutine_NC_SLD_Gorn_699_PrepareFocus : UDailyRoutine_NC_SLD_Gorn_699_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(3);
    default AutoSwitchToRoutine = UDailyRoutine_NC_SLD_Gorn_699_CheckFocusGiven;

    default Schedule(8, 0, UAIState_SitAround(), n"IO_OG_CHAIR_BENCH_4");
}


class UAIState_MonasteryGate : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            if (InteractionSpots::IsSpotReachableByCharacter(CharacterState, FInteractionSpotHandle(n"FP_AM_GORN_YARD")))
            {
                AI.StandAround(n"FP_AM_GORN_YARD",200);
            }
            else
            {
                AI.StandAround(n"FP_AM_GORN_GATE",200,4);
            }

            WaitSeconds(1.f);
        }
    }
}

UCLASS()
class UAIState_NC_SLD_Gorn_699_FollowHeroWhenFarAwayThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutineAgressive
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_NC_SLD_Gorn_699_Ruinwall;
    default DistanceUntilStop = 10000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}

UCLASS()
class UAIState_NC_SLD_Gorn_699_FollowHeroInFMWhenFarAwayThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutineAgressive
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_NC_SLD_Gorn_699_Waitfmc;
    default DistanceUntilStop = 10000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}

class UDailyRoutine_NC_SLD_Gorn_699_CheckFocusGiven : UAIState_DailyRoutine_Human
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        if(G1R::Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN != nullptr && G1R::Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN.HasSucceeded())
    {
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay::StaticClass());
    }
    else
    {
        if(IsValid(FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState))
        FCharacterUniqueName(n"NC_SLD_Gorn_699").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinwait::StaticClass());
    }
    }
    
}
#endif