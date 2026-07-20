UCLASS()
class UAIAgentConfig_Human_BC_BAN_Arlin_852 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_BC_BAN_Arlin_852::StaticClass();

}

UCLASS()
class UDailyRoutine_BC_BAN_Arlin_852_Start : UAIState_DailyRoutine_Human
{
    default Schedule(10, 0, UAIState_Sit(), n"FP_OC_CELL_1", 300);
    default OwnedGameplayTags.AddTag (GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UDailyRoutine_BC_BAN_Arlin_852_Fear : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_Fake_Fear(), n"FP_OC_CELL_3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_BC_BAN_Arlin_852_Home : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_BC_BAN_Arlin_852_Guide(), Location::Anywhere);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_BC_BAN_Arlin_852_Home2 : UAIState_DailyRoutine_Human
{
    default Schedule(8, 0, UAIState_RunToSit(), n"IO_BC_CHAIR_BENCH_02");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UAIState_BC_BAN_Arlin_852_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default CloseDistance = 4.f;
    default WaitDistance = 5.f;
    default AbandonDistance = 5.f;
    default WaitAtPlaceDurationSeconds = 0.1f;
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_BC_BAN_Arlin_852_Home2::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Running;

    default InterstationReachedDistance = 1.0f;
    default TerminusReachDistance = 1.0f;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Castle_Cell_Guard239_5",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Castle_Cell_Guard239_1",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Castle_Cell_Guard239_6",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Castle_Cell_Guard239_11",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_OC_GUARDPASSAGE_43",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"FP_OC_GUARDPASSAGE_36",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Castle_Out_Guard245_17",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"BreadcrumbActor_OC_Drunk_41",EWalkSpeed::Running));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Grim_Start",EWalkSpeed::Running));
}