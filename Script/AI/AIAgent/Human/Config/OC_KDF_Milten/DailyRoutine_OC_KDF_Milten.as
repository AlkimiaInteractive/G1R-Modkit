UCLASS()
class UAIAgentConfig_Human_OC_KDF_Milten : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_KDF_Milten::StaticClass();
}

#ifdef WITH_STORY_G1R
UCLASS()
class UDailyRoutine_OC_KDF_Milten_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_FireMagesBuilding_Room_02);
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_MILTEN");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_MILTEN");
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Start : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), n"FP_OC_STANDAROUND_92_MILTEN",200);
    default Schedule(7, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_92_MILTEN",200);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Smalltalk : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(0, 0, UAIState_Smalltalk(), n"FP_OC_SMALLTALK_CARRISTO_MILTEN",200);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_FourFriendsMeeting : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OM_MILTEN_CAMP");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_LightHouse : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(8, 0, UAIState_SitAround(), n"IO_OG_CHAIR_BENCH_3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcWait : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(23, 0, UAIState_Stand(), n"FP_TC_MILTEN_FOCUS");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcGuide : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(23, 00, UAIState_OC_KDF_Milten_GuideTrollCanyon(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcCave : UDailyRoutine_OC_KDF_Milten_Ownership
{
    // Ensures Milten will ignore the Troll and the Goblins even if combat starts with the player
    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs); 

    default Schedule(0, 0, UAIState_RunToInspect(),n"FP_TC_MILTEN_CAVE");
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcScrollCraft : UDailyRoutine_OC_KDF_Milten_Ownership
{
    // Ensures Milten will ignore the Troll and the Goblins even if combat starts with the player
    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs);

    default Schedule(23, 00, UAIState_Inscription(), n"IO_TC_INSCRIPTION");
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcGate : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(20, 0, UAIState_OC_KDF_Milten_TcLever(), n"FP_TC_STANDAROUND_MILTEN", 2000);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcWaitAtDoor : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(20, 0, UAIState_StandAround(), n"FP_TC_STANDAROUND_MILTEN", 500);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TcAltar : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(0, 0, UAIState_RunToInspect(),n"FP_TC_MILTEN_ALTAR",2000);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Returntooc : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(12, 0, UAIState_SitAround(), n"LOCATION_02_04");
}


UCLASS()
class UDailyRoutine_OC_KDF_Milten_Ocwait : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(7, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_92_MILTEN",200);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Follow : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default bSimulateRoutineTasksFromStartTime = false;
	default Schedule(23, 0, UAIState_FollowHero(150), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_TCFollow : UDailyRoutine_OC_KDF_Milten_Ownership
{
	default bSimulateRoutineTasksFromStartTime = false;
	default Schedule(23, 0, UAIState_OC_KDF_Milten_FollowHeroWhenFarAwayThenChangeRoutine(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_PrepareFocus : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default AutoSwitchAfterTime = FInGameTime::FromMinutes(11);
    default AutoSwitchToRoutine = UDailyRoutine_OC_KDF_Milten_CheckFocusGiven;

    default Schedule(8, 0, UAIState_SitAround(), n"IO_OG_CHAIR_BENCH_3");
}

UCLASS()
class UAIState_OC_KDF_Milten_GuideTrollCanyon : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"WP_TC_MILTEN_END", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"WP_TC_MILTEN_END", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_WaitYard : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_STAND_YARD_6", 300);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
} 

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Hide : UDailyRoutine_OC_KDF_Milten_Ownership
{
    default Schedule(20, 0, UAIState_OC_KDF_Milten_GuideHide(), NAME_None);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_AfterCinematic : UAIState_DailyRoutine_Human
{
        default Schedule(20, 0, UAIState_Stand(), n"Guide_Path_Milten_To_Out_Of_OC_1", 300);
        default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::Never;
        default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);

}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_AfterCinematic2 : UAIState_DailyRoutine_Human
{
        default Schedule(20, 0, UAIState_RunToStandAround(), n"FP_OC_FIREMAGES_AFTERCINEMATIC", 300);
        default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::Never;
        default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_EscapeOC_First : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_OC_KDF_Milten_GuideOutOfOC_1(), NAME_None);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_EscapeOC_Second : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_OC_KDF_Milten_GuideOutOfOC_2(), NAME_None);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_OpenTowerDoor : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_OC_KDF_Milten_OpenTowerDoor(), NAME_None);
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
} 

UCLASS()
class UAIState_OC_KDF_Milten_TcLever : UAIState_OpenDoorOrGate
{
    default RoutineAfterOpening = UDailyRoutine_OC_KDF_Milten_TCFollow;
    default DoorConfigName = n"TrollPuzzle_Gate";
    default OpenTag = GameplayTag::Action_Lever_Mantain;
    default WaitTimeBeforeSwitchingRoutine = 2.f; 
}


UCLASS()
class UAIState_OC_KDF_Milten_OpenTowerDoor : UAIState_OpenDoorOrGate
{
    default RoutineAfterOpening = UDailyRoutine_OC_KDF_Milten_EscapeOC_Second;
    default DoorConfigName = n"OldCampTowerSecretDoor";
    default OpenTag = GameplayTag::Action_Lever;
    default WaitTimeBeforeSwitchingRoutine = 3.f; 
}


UCLASS()
class UDailyRoutine_OC_KDF_Milten_AbandonedHouse : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_OC_SCPAPE", 300);
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
} 

UCLASS()
class UAIState_OC_KDF_Milten_GuideHide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Hide_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Hide_end", EWalkSpeed::Running));

    default CloseDistance = 400.f;
    default WaitDistance = 1000.f;
}

UCLASS()
class UAIState_OC_KDF_Milten_GuideOutOfOC_1 : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero"; 

    // default GoAlongFreepoints.Add(FGuideFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_1", EWalkSpeed::Running));
    // default GoAlongFreepoints.Add(FGuideFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_6", EWalkSpeed::Running));

    default CloseDistance = 400.f;
}

UCLASS()
class UAIState_OC_KDF_Milten_GuideOutOfOC_2 : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero"; 

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_start_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_10", EWalkSpeed::Running)); 
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_11", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_Milten_To_Out_Of_OC_12", EWalkSpeed::Running));
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_Lswait : UAIState_DailyRoutine_Human
{
    default Schedule(12, 0, UAIState_Stand(), n"FP_NC_MILTEN_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OC_KDF_Milten_Lsaway : UAIState_DailyRoutine_Human
{
    default Schedule(23, 00, UAIState_OC_KDF_Milten_GuideAway(), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_OC_KDF_Milten_LsGuideOre : UAIState_DailyRoutine_Human
{
    default Schedule(23, 00, UAIState_OC_KDF_Milten_GuideOreMount(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_LsGuideOre_Second : UAIState_DailyRoutine_Human
{
    default Schedule(23, 00, UAIState_OC_KDF_Milten_GuideOreMount_Second(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_KDF_Milten_WaitOrePile : UAIState_DailyRoutine_Human
{
    default Schedule(20, 0, UAIState_Stand(), n"FP_NC_OREMOUNT_MILTEN", 100);
} 

UCLASS()
class UAIState_OC_KDF_Milten_GuideAway : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_NC_WATER_MILTEN_IN", EWalkSpeed::Running));
}

UCLASS()
class UAIState_OC_KDF_Milten_GuideOreMount : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 180.f;
    default WaitAtPlaceAction = UAIState_PracticeMagic::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_KDF_Milten_WaitOrePile::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_start", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_2", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_3", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_4", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_5", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_6", EWalkSpeed::Running));
}

UCLASS()
class UAIState_OC_KDF_Milten_GuideOreMount_Second : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 180.f;
    default WaitAtPlaceAction = UAIState_PracticeMagic::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_KDF_Milten_WaitOrePile::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_7", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_8", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_9", EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_to_OreMount_end", EWalkSpeed::Running));
}

UCLASS()
class UAIState_OC_KDF_Milten_FollowHeroWhenFarAwayThenChangeRoutine : UAIState_FollowWhenCloseThenDoRoutine
{
    default FollowCharacterUniqueName = n"Hero";
    default RoutineToDoAfterLosingTarget = UDailyRoutine_OC_KDF_Milten_TcWaitAtDoor;
    default DistanceUntilStop = 5000.f;
    default FollowDistance = 150.0f;
    default SprintWhenFurtherAwayThan = 750.f;
    default bCopyWalkSpeed = true;
}

class UDailyRoutine_OC_KDF_Milten_CheckFocusGiven : UAIState_DailyRoutine_Human
{
    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        if(G1R::Quest::OldCamp_OCCHAPTER3_TROLLCANYON != nullptr && G1R::Quest::OldCamp_OCCHAPTER3_TROLLCANYON.HasSucceeded())
    {
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcAltar::StaticClass()); 
    }
    else
    {
        if(IsValid(FCharacterUniqueName(n"OC_KDF_Milten").NPCState))
        FCharacterUniqueName(n"OC_KDF_Milten").NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcWait::StaticClass()); 
    }
    }
    
}
#endif