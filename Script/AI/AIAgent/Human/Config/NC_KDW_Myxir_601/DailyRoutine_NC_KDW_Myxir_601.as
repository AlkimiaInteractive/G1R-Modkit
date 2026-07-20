UCLASS()
class UAIAgentConfig_Human_NC_KDW_Myxir_601: UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_KDW_Myxir_601::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_Ownership : UAIState_DailyRoutine_Human
{
    default AreaOwnership.OwnedAreas.AddTag(GameplayTag::Area_NewCamp_Cave_WaterMages_Rooms_Myxir);
    default KnownPlaces.Add(Location::Bed, n"IO_NC_BED_MYXIR");
    default KnownPlaces.Add(Location::Home, n"IO_NC_BED_MYXIR");
}


UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_Start : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(8, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(9, 15, UAIState_Inscription(), n"IO_NC_INSCRIPTION_01");
    default Schedule(10, 15, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_01",2000);
    default Schedule(11, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_24");
    default Schedule(13, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(14, 30, UAIState_ReadBook_Shelf(), n"IO_NC_SHELL_01");
    default Schedule(17, 0, UAIState_Inscription(), n"IO_NC_INSCRIPTION_01");
    default Schedule(22, 30, UAIState_Eat(), n"IO_NC_CHAIR_52");

}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_TalkMiltenAway : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(0, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(5, 0, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(6, 0, UAIState_Inscription(), n"IO_NC_INSCRIPTION_01");
    default Schedule(10, 0, UAIState_Inscription(), n"IO_NC_INSCRIPTION_01");
    default Schedule(11, 0, UAIState_Smalltalk(), n"FP_NC_SMALLTALK_24");
    default Schedule(12, 34, UAIState_Eat(), n"IO_NC_CHAIR_52");
    default Schedule(13, 0, UAIState_Sleep(), Location::Bed, WaypointRadius = 500);
    default Schedule(19, 0, UAIState_Inscription(), n"IO_NC_INSCRIPTION_01");
}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_Wait : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(6, 0, UAIState_Inspect_Front(), n"FP_SW_MYXIR_WAIT");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_BeachRight : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(8, 0, UAIState_RunToInspect(),n"FP_SW_MYXIR_BEACH_RIGHT");
}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_BeachLeft : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(8, 0, UAIState_RunToInspect(),n"FP_SW_MYXIR_BEACH_LEFT");
}

UCLASS()
class UDailyRoutine_NC_KDW_Myxir_601_Teleport : UDailyRoutine_NC_KDW_Myxir_601_Ownership
{
    default Schedule(6, 0, UAIState_Teleport(UItAr_Rune_TeleportToMagiciansOfWater), n"FP_SW_MYXIR_BEACH_LEFT", 50);

    default bForceSimulationUpdateEveryTick = true;
}

class UAIState_Teleport : UGothicCharacterSimulateableAIState
{

    UAIState_Teleport(TSubclassOf<USpellContainer> InRune)
    {
        Rune = InRune;
    }

    UPROPERTY()
    TSubclassOf<USpellContainer> Rune;

    UPROPERTY()
    TSubclassOf<UAIState_DailyRoutine> NextRoutineAfterTeleport = UDailyRoutine_NC_KDW_Myxir_601_Start;

    UPROPERTY()
    FInteractionSpotHandle TargetTeleportWaypoint = FInteractionSpotHandle(n"WP_NC_TELEPORT_01");

    UPROPERTY()
    float TargetTeleportAllowanceRadius = 500.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (!CharacterState.HasItem(Rune))
        {
            CharacterState.AddItemToInventory(Rune);
        }

        while (!bShouldExitState)
        {
            // Casting the spell may have interrupted this AIState, so when restarted, check if we're already there and do the routine switch if so
            if (TargetTeleportWaypoint.GetDistanceToActor(CharacterState) < TargetTeleportAllowanceRadius)
            {
                CharacterState.TeleportToSpot(TargetTeleportWaypoint.SpotName);
                AI.ExchangeDailyRoutine(NextRoutineAfterTeleport);
                return;
            }

            if(IsInDailyRoutineSimulation())
            {
                CharacterState.TeleportToSpot(TargetTeleportWaypoint.SpotName);
                AI.ExchangeDailyRoutine(NextRoutineAfterTeleport);
            }
            else
            {
                if (AI.DrawMagicSpell(Rune).WasSuccessful())
                {
                    AI.CastSpell();
                }
            }

            WaitOneTick();
        }
    }

    
}