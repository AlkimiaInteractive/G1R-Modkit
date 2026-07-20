UCLASS()
class UAIState_Combat_HumanOrc : UAIState_Combat_G1R
{
    default CooldownsOnMoveEnded.FindOrAdd(UCM_CastSpell_Base)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);

    default AssessmentModuleClass = UAIARM_State_Combat_HumanOrc;
    default bCanDoTauntsWhileMoving = true;

    void InitializeCombatPositioning() override
    {
        Positioning = UAICombatPositioning_StaticCircleAroundTarget(this);
    }

    FString GetDisplayName() const override
    {
        return "Human / Orc Combat";
    }

    bool CanSprint() override
    {
        return true;
    }

    bool ShouldStrafe() override
    {
        // Don't strafe when no target or target not visible
        if (!IsValid(CharacterOfInterest) || !Self.Perception.CanSee(CharacterOfInterest))
            return false;

        if (!CharacterState.Character.IsWalkSpeedWalking())
            return false;

        return true;
    }

    float CalculateCurrentChanceToDodgeAnAttack(USensedIncommingAttack Attack) const override
    {
        if (Self.HasGameplayTag(GameplayTag::Debuff_Drugs_High))
            return 0.0f;
        
        float DodgeChance = 0.0f;

        if (Attack == nullptr)
            return DodgeChance;

        if (Attack.bReactionDone)
            return DodgeChance;

        if (Attack.Reaction != EIncomingAttackReaction::Count)
            return DodgeChance;

        if (Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
            return DodgeChance;

        if (Attack.Instigator == nullptr)
            return DodgeChance;

        if (!Attack.Instigator.IsDoingAttack())
            return DodgeChance;

        if (!Self.IsBackFacingOtherCharacterDirectly(Attack.Instigator))
        {
            if (Self.IsCurrentlyDrawnWeaponSkillMaster())
            {
                DodgeChance = Config.ReactToAttackFrontDodgeChance_Master;
            }
            if (Self.IsCurrentlyDrawnWeaponSkillTrained())
            {
                DodgeChance = Config.ReactToAttackFrontDodgeChance_Trained;
            }
            if (Self.IsCurrentlyDrawnWeaponSkillUntrained())
            {
                DodgeChance = Config.ReactToAttackFrontDodgeChance_Untrained;
            }
        }
        else
        {
            if (Self.IsCurrentlyDrawnWeaponSkillMaster())
            {
                DodgeChance = Config.ReactToAttackBackDodgeChance_Master;
            }
            if (Self.IsCurrentlyDrawnWeaponSkillTrained())
            {
                DodgeChance = Config.ReactToAttackBackDodgeChance_Trained;
            }
            if (Self.IsCurrentlyDrawnWeaponSkillUntrained())
            {
                DodgeChance = Config.ReactToAttackBackDodgeChance_Untrained;
            }
        }

        float Result = DodgeChance * (1 + 0.2f * GetSelfDrawnWeaponSkillDifferenceWithOtherCharacter(Attack.Instigator));

        return Result;
    }

    float CalculateCurrentChanceToBlockAnAttack(USensedIncommingAttack Attack) const override
    {
        float BlockChance = 0.0f;

        if (Attack == nullptr)
            return BlockChance;

        if (Attack.bReactionDone)
            return BlockChance;

        if (Attack.Reaction != EIncomingAttackReaction::Count)
            return BlockChance;

        if (Attack.EstimatedTimeLeftUntilImpact <= 0.0f)
            return BlockChance;

        if (Attack.Instigator == nullptr)
            return BlockChance;

        if (!Attack.Instigator.IsDoingAttack())
            return BlockChance;

        if (!Self.IsBackFacingOtherCharacterDirectly(Attack.Instigator))
        {
            if (Self.IsCurrentlyDrawnWeaponSkillMaster())
            {
                BlockChance = Config.ReactiveBlockingChance_Master;
            }
            else if (Self.IsCurrentlyDrawnWeaponSkillTrained())
            {
                BlockChance = Config.ReactiveBlockingChance_Trained;
            }
        }
        else
        {
            return 0.0f;
        }

        float Result = BlockChance * (1 + 0.4f * GetSelfDrawnWeaponSkillDifferenceWithOtherCharacter(Attack.Instigator));
        return Result;
    }

    void DefaultConfigValues() override
    {
        Super::DefaultConfigValues();

        // GROUNDED STRAFER BASE CONFIG VALUES
        EnemyTooCloseDistance = Config.PositioningValuesSizeMultiplier * 60.0f;
        EnemyCloseDistance = Config.PositioningValuesSizeMultiplier * 170.0f;
        EnemyLungeDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        EnemyCombatDistance = Config.PositioningValuesSizeMultiplier * 700.0f;
        
        Positioning.MinimumPositionDistance = 200.0f;
        
        if (IsCurrentRole(ECombatRole::ActiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 250.0f;
        }
        else if (IsCurrentRole(ECombatRole::PassiveAttacker))
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 350.0f;
        }
        else
        {
            Config.PreferredDistance = Config.PositioningValuesSizeMultiplier * 500.0f;
        }
    }

    default CommonBehavior_LowPriority
            .DoNode(UCBT_Tree_Taunts_Voiced());
        
    default CommonBehavior_MediumPriority
            .DoNode(UCBT_Tree_DodgeToUnStuck());
}

class UAIState_Combat_Human : UAIState_Combat_HumanOrc
{
    default Config.PositioningValuesSizeMultiplier = 1.0f;

    default CooldownsOnMoveEnded.FindOrAdd(UCM_AimedShots)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);

    default CooldownsOnMoveEnded.FindOrAdd(UCM_CrossbowShot)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);

    default CooldownsOnMoveEnded.FindOrAdd(UCM_Attack)
                                    .SetCooldown(1.0f)
                                    .AddMoveToPutOnCooldown(UCM_Taunt);
}