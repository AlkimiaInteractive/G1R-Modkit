UCLASS()
class UAIAgentConfig_Human_OC_EBR_Raven_105 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OC_EBR_Raven_105::StaticClass();

}

UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_Dungeons);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_Cellar);
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_OldCamp_Castle_Room_GomezBuilding_RavenArea);

    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_RAVEN");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_RAVEN");
}


UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_Start : UDailyRoutine_OC_EBR_Raven_105_Ownership
{
    default Schedule(1, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_StandAround(), n"FP_OC_STANDAROUND_90_RAVEN2",100);

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}

UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_Prestart : UDailyRoutine_OC_EBR_Raven_105_Ownership
{
    default Schedule(22, 0, UAIState_Stand(), n"FP_OC_STANDAROUND_90_RAVEN2");

    default OwnedGameplayTags.AddTag(GameplayTag::Character_AllowFarInteractions);
}


UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_Guide : UDailyRoutine_OC_EBR_Raven_105_Ownership
{
    default Schedule(7, 45, UAIState_OC_EBR_Raven_105_Guide(), Location::Anywhere);
}

UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_Ot : UDailyRoutine_OC_EBR_Raven_105_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_13");
}

UCLASS()
class UDailyRoutine_OC_EBR_Raven_105_WaitGuide : UDailyRoutine_OC_EBR_Raven_105_Ownership
{
    default Schedule(20, 0, UAIState_Guard(), n"FP_OC_STANDAROUND_31");
}

UCLASS()
class UAIState_OC_EBR_Raven_105_Guide : UAIState_GuideCharacter
{
    default FollowCharacterUniqueName = n"Hero";
    default WaitAtPlaceDurationSeconds = 60.f;
    default WaitAtPlaceAction = UAIState_StandAround::StaticClass();
    default bReturnToPathStart = false;
    default RoutineToReturnTo = UDailyRoutine_OC_EBR_Raven_105_WaitGuide::StaticClass();
    default ReturnWalkSpeed = EWalkSpeed::Walking;

    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_RavenTo_Gomez_start", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_RavenTo_Gomez_2", EWalkSpeed::Walking));
    default GoAlongFreepoints.Add(FGoToFreepoint(n"Guide_Path_RavenTo_Gomez_end", EWalkSpeed::Walking));
}

