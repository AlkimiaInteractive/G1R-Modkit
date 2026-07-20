/** Do a Pyrokinesis spell */
UCLASS()
class UCM_OrcShamanSpell_Pyrokinesis_CastForSeconds : UCM_CastSpell_Orc_Shaman
{
    UCM_OrcShamanSpell_Pyrokinesis_CastForSeconds(float InSeconds)
    {
        MinSeconds = Math::Clamp(InSeconds, 0.0f, MAX_flt);
        MaxSeconds = MinSeconds;
    }

    UCM_OrcShamanSpell_Pyrokinesis_CastForSeconds(float InMinSeconds, float InMaxSeconds)
    {
        MinSeconds = Math::Clamp(InMinSeconds, 0.0f, MAX_flt);
        MaxSeconds = Math::Clamp(InMaxSeconds, MinSeconds, MAX_flt);
    }

    default _SpellTag = GameplayTag::Spell_Pyrokinesis;

    UPROPERTY()
    float MinSeconds = 10.0f;

    UPROPERTY()
    float MaxSeconds = 10.0f;

    bool ConditionsToContinueSpell() const override
    {
        if (!IsValid(Combat.CharacterOfInterest) || Combat.DistanceToCharacterOfInterest < 200.0f)
        {
            OnShouldStopSpell();
        }

        return Super::ConditionsToContinueSpell();
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Already doing magic";
            return false;
        }

        // auto SelectedSpellItem = Combat.GetSelectedSpellItem();
        // if (SelectedSpellItem == nullptr)
        //     return false;

        // if (!Combat.Self.CanUseSpell(SelectedSpellItem))
        //     return false;

        return true;
    }

    void CastSpell() override
    {
        StartCastingSustainedSpell(MinSeconds, MaxSeconds);
    }

    bool WouldAttackCollideWithWall() const override
    {
        if(Combat.CharacterState.HasGameplayTag(GameplayTag::State_TraceTarget_TargetDetected))
            return false;
        return true;
    }

    
}

/** Do a Firewall spell */
UCLASS()
class UCM_OrcShamanSpell_Firewall : UCM_CastSpell_Orc_Shaman
{
    default _SpellTag = GameplayTag::Spell_Firewall;

    void CastSpell() override
    {
        CastSpellOnce();        
    }

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (Combat.Self.IsDoingMagic())
        {
            Reason = "Already doing magic";
            return false;
        }

        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(Combat.Self);
        if (!DemonAreaRegisterComponent.CanSpawnArea(EDemonAreaTypes::Ring))
        {
            Reason = "Hashor can't spawn area";
            return false;
        }

        return true;
    }
}

/** Stop casting any spell currently being cast */
UCLASS()
class UCBT_Tree_VarragStopCasting : UCBT_Tree
{
    default BaseSortLayer = 0.5f;

    UPROPERTY()
    float MaxRange = 3000.0f;

    UPROPERTY()
    float MinRange = 100.0f;

            
    default PrioritySelector() // OR
                .AddRequirement(UCS_IsCastingSpellConcurrently()) // Only cancel spell if it's concurrent (can be cast while moving and indefinitely)
                .AsPrioritySelector()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    // Not inside distance range for spell
                    .AddRequirement(UCS_React_CurrentMoveHasTag_NotInsideDistanceRange(GameplayTag::Action_CastSpell, MinRange, MaxRange)) 
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    // Target already dead
                    .AddRequirement(UCS_EnemyDeadOrDefeated())
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Area)) // Spell is Area spell
                    .AddRequirement(UCS_Not(UCS_EnemyInsideSelectedSpellArea())); // AND Target outside spellcasting area

    default MakeBehavior();
}