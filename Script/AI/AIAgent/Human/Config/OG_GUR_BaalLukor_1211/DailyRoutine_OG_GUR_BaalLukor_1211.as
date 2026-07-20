UCLASS()
class UAIAgentConfig_Human_OG_GUR_BaalLukor_1211 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OG_GUR_BaalLukor_1211::StaticClass();

}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Start : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Guard(), n"FP_SC_GUARD_43");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Wait : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Menace(), n"FP_OG_GUARD_2");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Follow : UAIState_DailyRoutine_Human
{
    default bSimulateRoutineTasksFromStartTime = false;
    default Schedule(23, 0, UAIState_FollowHero(100, true, 150), Location::Anywhere);
}


UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Waitinsidetunnelone : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Stay(), n"FP_OG_TUNNEL1");
}


UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Waitinsidetunneltwo : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Stay(), n"FP_OG_TUNNEL2");
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_FirstDoor : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToStandAround(),n"FP_OG_CAVE");
}


UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Door : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Stay(), n"FP_OG_DOOR");
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_OpenFocusStoneDoor : UAIState_DailyRoutine_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Hearing);

    default Schedule(16, 0, UAIState_OG_GUR_BaalLukor_1211_OpenFocusStoneDoor(), n"FocusStone_Door724495");
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Meditate : UAIState_DailyRoutine_Human
{
    default Schedule(16, 0, UAIState_Meditate(), n"GRYD_082");
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Guide : UAIState_DailyRoutine_Human
{
    default Schedule(6, 30, UAIState_OG_GUR_BaalLukor_1211_Guide(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_AfterFocusDoor : UAIState_DailyRoutine_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Sight);
    default OwnedGameplayTags.AddTag(GameplayTag::Perception_KeepAwareness_Hearing);
    
    default Schedule(6, 30, UAIState_WanderLukor(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OG_GUR_BaalLukor_1211_Crazy : UAIState_DailyRoutine_Human
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Killable);
    default Schedule(6, 30, UAIState_StandAround(), n"FP_OG_TOMB");
}


UCLASS()
class UAIState_OG_GUR_BaalLukor_1211_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";

    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_SC_GUARD_43", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_SC_YEBERION_CHAMBER", EWalkSpeed::Walking));

}

UCLASS()
class UAIState_OG_GUR_BaalLukor_1211_OpenFocusStoneDoor : UAIState_OpenDoorOrGate
{
    default RoutineAfterOpening = UDailyRoutine_OG_GUR_BaalLukor_1211_AfterFocusDoor;
    default DoorConfigName = n"OG_MainTomb_Gate";
    default OpenTag = GameplayTag::Action_Door_Focus;
    default WaitTimeBeforeSwitchingRoutine = 3.f; 
}

UCLASS()
class UAIState_WanderLukor : UAIState_RandomInteractions_ChainedSpots_Human
{
    default ChanceToDoActionOnSpot = 1.f;

    default SpotNames.Add(n"BreadcrumbActor_OG_Lukor1");
    default SpotNames.Add(n"BreadcrumbActor_OG_Lukor2");
    default SpotNames.Add(n"FP_OG_TOMB"); 

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_CheckGoods,InDurationSeconds = 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround));

}