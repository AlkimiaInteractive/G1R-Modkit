UCLASS()
class UAIAgentConfig_Human_XT_DMB_Xardas_404 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_XT_DMB_Xardas_404::StaticClass();

}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404 : UAIState_DailyRoutine_Human
{
}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_FirstMet : UDailyRoutine_XT_DMB_Xardas_404
{
    default Schedule(6, 0, UAIState_StandAround(), n"IO_XT_STANDAROUND_01",150);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;

}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_Start : UDailyRoutine_XT_DMB_Xardas_404
{
    default Schedule(6, 0, UAIState_Inscription(), n"IO_XT_INSCRIPTION_02",150);
    default Schedule(10, 0, UAIState_Xardas_CheckNotes(), n"IO_XT_TAKENOTES_01",150);
    default Schedule(17, 0, UAIState_Inscription(), n"IO_XT_INSCRIPTION_02",150);

    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_Study : UDailyRoutine_XT_DMB_Xardas_404
{
    default Schedule(6, 0, UAIState_Inscription(), n"IO_XT_INSCRIPTION_ENTRANCE",150);
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_SleeperTempleWait : UDailyRoutine_XT_DMB_Xardas_404
{
    default RolesWhileAssigned.AddTag(GameplayTag::State_Perceptions_Ignore_NPCs);

    default Schedule(15, 0, UAIState_Wounded(), n"FP_ST_XARDAS");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_Bedroom : UDailyRoutine_XT_DMB_Xardas_404
{
    default Schedule(8, 0, UAIState_StandAround(), n"FP_XT_STANDAROUND_01");
    default Schedule(11, 0, UAIState_PotionAlchemy(), n"IO_XT_POTION_ALCHEMY_01");
    default Schedule(12, 30, UAIState_PracticeMagic(), n"IO_XT_TAKENOTES_3");
    default Schedule(15, 0, UAIState_Xardas_CheckNotes(), n"IO_XT_TAKENOTES_02");
    default Schedule(18, 0, UAIState_PotionAlchemy(), n"IO_XT_POTION_ALCHEMY_01");
    default Schedule(23, 0, UAIState_Sleep(), n"Interactive_Bed_Xardas472597");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}


UCLASS()
class UDailyRoutine_XT_DMB_Xardas_404_Teleport : UAIState_DailyRoutine_Human
{
    default Schedule(6, 0, UAIState_Teleport_Xardas(UItAr_Rune_TeleportToNecromancer), n"WP_OW_TP_XARDASTOWER", 200);
}

class UAIState_Teleport_Xardas : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
    TSubclassOf<USpellContainer> Rune;

    UAIState_Teleport_Xardas(TSubclassOf<USpellContainer> InRune)
    {
        Rune = InRune;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        // if(IsInDailyRoutineSimulation())
        // {
        //     CharacterState.TeleportToSpot(n"WP_OW_TP_XARDASTOWER");
        // }
        // else
        // {
        //     AI.DrawMagicSpell(Rune);
        //     AI.CastSpell();
            
        //     AI.ExchangeDailyRoutine(UDailyRoutine_XT_DMB_Xardas_404_Bedroom::StaticClass());
        // }
        // AI.ExchangeDailyRoutine(UDailyRoutine_XT_DMB_Xardas_404_Bedroom::StaticClass());
        auto abComp = Cast<UGothicAbilitySystemComponent>(AbilitySystemComponent);
        abComp.SendGameplayEvent(GameplayTag::Event_Teleport_Scripted_Xardas_End, FGameplayEventData());
        //abComp.GiveAbility(UGA_Xardas_404_Teleport::StaticClass(), 1, -1, nullptr);
    }
}