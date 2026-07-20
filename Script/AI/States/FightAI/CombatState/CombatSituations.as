class UCS_InBlockStance : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_InBlockStance::IsInSituation"));
        
        return Combat.Self.HasBlockStanceTag();
    }
}

class UCS_InAimingStance : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_InAimingStance::IsInSituation"));
        
        return Combat.Self.IsAiming();
    }
}

class UCS_React_CanDoRiposte : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_CanDoRiposte::IsInSituation"));
        
        if (!Combat.HasNoticedHitOnSelf())
            return false;

        if (!Combat.IsFacingEnemy())
            return false;

        if (!Combat.Self.IsInBlockingStance())
            return false;

        return true;
    }
}

class UCS_TargetHealthHigherThan : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;

    UCS_TargetHealthHigherThan(float32 InHealthThreshhold)
    {
        HealthThreshhold = InHealthThreshhold;
    }

    float32 HealthThreshhold = 0.0f;
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetHealthHigherThan::IsInSituation"));
        
        return Combat.CharacterOfInterest.GetHealthAttribute() > HealthThreshhold;
    }

    FString GetDisplayName() const override
    {
        return f"IsTargetHealthHigherThan {HealthThreshhold:.2f}"; 
    }
}

class UCS_TimeSinceToggledBlockStanceHigherThan : UFightAI_CombatSituation
{
    float32 TimeSecondsThreshhold = 0.0f;
    
    UCS_TimeSinceToggledBlockStanceHigherThan(float32 InTimeSecondsThreshhold)
    {
        TimeSecondsThreshhold = InTimeSecondsThreshhold;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TimeSinceToggledBlockStanceHigherThan::IsInSituation"));
        
        return Combat.World.TimeSeconds - Combat.TimeSecondsToggledBlockStance > TimeSecondsThreshhold;
    }

    FString GetDisplayName() const override
    {
        return f"IsTargetHealthHigherThan {TimeSecondsThreshhold:.2f} seconds"; 
    }
}

class UCS_BlockedForLongEnough : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_BlockedForLongEnough::IsInSituation"));
        
        return Combat.World.TimeSeconds - Combat.TimeSecondsToggledBlockStance > Combat.Config.BlockingTime;
    }
}

class UCS_React_TooFarFromCombatStartLocation : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_TooFarFromCombatStartLocation::IsInSituation"));
        
        return false;
    }
}

class UCS_React_HasIncomingAttackFromFront : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_HasIncomingAttackFromFront::IsInSituation"));
        
        bool Result = Combat.HasIncomingAttackFromFront();

        return Result;
    }
}

class UCS_React_EnemyIsAboutToHitMe : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_EnemyIsAboutToHitMe::IsInSituation"));
        
        bool Result = Combat.HasIncomingAttack(0.33f);

        return Result;
    }
}

class UCS_IncomingAttackRight : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IncomingAttackRight::IsInSituation"));
        
        return Combat.HasIncomingAttackRightFromFront();  
    }
}

class UCS_IncomingAttackLeft : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IncomingAttackLeft::IsInSituation"));
        
        return Combat.HasIncomingAttackLeftFromFront();  
    }
}

class UCS_IncomingAttackBottom : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IncomingAttackBottom::IsInSituation"));
        
        return Combat.HasIncomingAttackBottomFromFront();  
    }
}

class UCS_IncomingAttackTop : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IncomingAttackTop::IsInSituation"));
        
        return Combat.HasIncomingAttackTopFromFront();  
    }
}

class UCS_IncomingProjectile : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IncomingProjectile::IsInSituation"));
        
        return Combat.HasNoticedCharacterLaunchingProjectileAtSelf();  
    }
}

class UCS_React_EnemyIsAboutToHitMyBack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_EnemyIsAboutToHitMyBack::IsInSituation"));
        
        if (!Combat.HasIncomingAttackFromBack())
            return false;

        return true;
    }
}

class UCS_React_FacingEnemyAndTurningTowardsMe : UFightAI_CombatSituation
{    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_FacingEnemyAndTurningTowardsMe::IsInSituation"));
        
        return !Combat.HasNoticedAnyIncomingAttack()
            && Combat.IsFacingEnemy()
            && !Combat.IsEnemyFacingMe()
            && Combat.IsEnemyTurningTowardsMe()
            && Combat.IsEnemyWithinDangerousDistance();
    }
}

class UCS_EnemyIsOnMyBack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyIsOnMyBack::IsInSituation"));
        
        return Combat.IsEnemyIsOnMyBack();
    }
}

class UCS_EnemyMovingAway : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyMovingAway::IsInSituation"));
        
        return Combat.IsEnemyMoving() &&
                Combat.GetDistanceToCharacterOfInterest() > Combat.GetDistanceToTargetOnLastAssess();
    }
}

class UCS_EnemyTooClose : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyTooClose::IsInSituation"));
        
        return Combat.IsEnemyTooClose();
    }
}

class UCS_EnemyClose : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose::IsInSituation"));
        
        return Combat.IsEnemyClose();
    }
}

class UCS_EnemyAtLungeDistance : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyAtLungeDistance::IsInSituation"));
        
        return Combat.IsEnemyAtLungeDistance();
    }
}

class UCS_EnemyInsideDistanceRange : UFightAI_CombatSituation
{
    float DistanceMinimum = 350.0f;
    float DistanceMaximum = 400.0f;

    UCS_EnemyInsideDistanceRange(float InDistanceMinimum, float InDistanceMaximum)
    {
        DistanceMinimum = InDistanceMinimum;
        DistanceMaximum = InDistanceMaximum;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyInsideDistanceRange::IsInSituation"));
        
        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return (DistanceMinimum <= DistanceToEnemy + 30.0f) && (DistanceToEnemy - 30.0f <= DistanceMaximum);
    }

    FString GetDisplayName() const override
    {
        if (DistanceMinimum > 0.0f && DistanceMaximum > 100000.0f)
            return f"IsEnemyFartherThan {DistanceMinimum:.2f}";

        if (DistanceMinimum < 1.0f && DistanceMaximum < 100000.0f)
            return f"IsEnemyCloserThan {DistanceMaximum:.2f}";

        return f"IsEnemyInsideDistanceRange {DistanceMinimum:.2f} to {DistanceMaximum:.2f}"; 
    }
}

class UCS_EnemyCloserThan : UCS_EnemyInsideDistanceRange
{
    UCS_EnemyCloserThan(float InDistanceMaximum)
    {
        DistanceMinimum = 0.0f;
        DistanceMaximum = InDistanceMaximum;
    }
}

class UCS_EnemyFartherThan : UCS_EnemyInsideDistanceRange
{
    UCS_EnemyFartherThan(float InDistanceMinimum)
    {
        DistanceMinimum = InDistanceMinimum;
        DistanceMaximum = MAX_flt;
    }
}

class UCS_EnemyInsideSelectedSpellRange : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyInsideSelectedSpellRange::IsInSituation"));

        if (!Combat.IsSpellSelected())
            return false;

        if (!IsFacingCorrectDirectionForSpell())
            return false;
        
        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area) &&
            DistanceToEnemy >= 200.0f && DistanceToEnemy <= 3000.0f)
            return true;

        if (DistanceToEnemy > Combat.SelectedSpellAction.SpellConfigFromContainer.SpellConfig.SpellAreaRange)
            return false;

        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnTarget))
            return true;

        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
            return true;

        return true;
    }

    bool IsFacingCorrectDirectionForSpell() const
    {
        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnTarget))
            return true;

        if (Combat.IsFacingEnemy())
            return true;

        return false;
    }
}

class UCS_EnemyInsideSelectedSpellArea : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyInsideSelectedSpellArea::IsInSituation"));
        
        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area))
            return true;

        if (Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Circle_OnTarget))
            return true;

        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        if (DistanceToEnemy > Combat.SelectedSpellAction.SpellConfigFromContainer.SpellConfig.SpellAreaRange)
            return false;

        if (!Combat.SelectedSpellAction.Keywords.HasTag(GameplayTag::AISpellKeywords_Area_Cone))
            return true;

        if (!Combat.IsFacingEnemy())
            return false;

        return true;
    }
}

class UCS_TargetFartherThanPreferredDistance : UFightAI_CombatSituation
{
    UPROPERTY()
    float DistanceThreshold = 0.0f;

    UCS_TargetFartherThanPreferredDistance(float InDistanceThreshold)
    {
        DistanceThreshold = InDistanceThreshold;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetFartherThanPreferredDistance::IsInSituation"));
        
        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return DistanceToEnemy >= Combat.Config.PreferredDistance + DistanceThreshold;
    }
}

class UCS_TargetCloserThanPreferredDistance : UFightAI_CombatSituation
{
    UPROPERTY()
    float DistanceThreshold = 0.0f;

    UCS_TargetCloserThanPreferredDistance(float InDistanceThreshold)
    {
        DistanceThreshold = InDistanceThreshold;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetCloserThanPreferredDistance::IsInSituation"));
        
        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return DistanceToEnemy <= Combat.Config.PreferredDistance - DistanceThreshold;
    }
}

class UCS_TargetFartherThanSelectedAttackMaxRange : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetFartherThanSelectedAttackMaxRange::IsInSituation"));
        
        if (!IsValid(SelectedAttack))
            return false;

        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return SelectedAttack.Range <= DistanceToEnemy + 30.0f;
    }
}

class UCS_TargetOutsideRequiredRelativeHeightRange : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetOutsideRequiredRelativeHeightRange::IsInSituation"));
        
        if (!IsValid(SelectedAttack))
            return false;

        if (!SelectedAttack.bRequiresSpecificRelativeHeight)
            return false;

        return SelectedAttack.MaxRelativeHeight < Combat.HeightRelativeToCharacterOfInterest || SelectedAttack.MinRelativeHeight > Combat.HeightRelativeToCharacterOfInterest;
    }
}

class UCS_TargetWithinDodgeForwardRangeOfSelectedAttack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetWithinDodgeForwardRangeOfSelectedAttack::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return (Combat.SelectedAttack.Range <= DistanceToEnemy + 30.0f) && (DistanceToEnemy - 30.0f <= Combat.SelectedAttack.Range + 60.0f);
    }
}

class UCS_TargetCloserThanSelectedAttackMinRange : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetCloserThanSelectedAttackMinRange::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return DistanceToEnemy - 30.0f <= Combat.SelectedAttack.MinRange;
    }
}

class UCS_TargetWithinDodgeBackwardsRangeOfSelectedAttack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetWithinDodgeBackwardsRangeOfSelectedAttack::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        float DistanceToEnemy = Combat.DistanceToCharacterOfInterest;
        return (Combat.SelectedAttack.MinRange >= DistanceToEnemy + 30.0f) && (DistanceToEnemy - 30.0f >= Combat.SelectedAttack.MinRange + 60.0f);
    }
}

class UCS_SelectedAttackRequiresPathToCharacterOfInterest : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedAttackRequiresPathToCharacterOfInterest::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        if (!Combat.SelectedAttack.bRequiresPathToCharacterOfInterest)
            return false;

        return true;
    }
}

class UCS_EnemyNotFacingMe : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyNotFacingMe::IsInSituation"));
        
        return !Combat.IsEnemyFacingMe();
    }
}

class UCS_EnemyFacingMe : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyFacingMe::IsInSituation"));
        
        return Combat.IsEnemyFacingMe();
    }
}

class UCS_HasNoticedDamageOnSelf : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasNoticedDamageOnSelf::IsInSituation"));
        
        return Combat.HasNoticedDamageOnSelf();
    }
}

class UCS_React_EnemyJustDamagedMe : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_EnemyJustDamagedMe::IsInSituation"));
        
        return Combat.HasNoticedDamageOnSelf();
    }
}

class UCS_React_HasNoticedDamageOnSelf_NotStateImmunitySuperArmor : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_HasNoticedDamageOnSelf_NotStateImmunitySuperArmor::IsInSituation"));
        
        if (!Combat.HasNoticedDamageOnSelf())
            return false;

        if (Combat.Self.HasImmunitySuperArmorTag())
            return false;

        return true;
    }
}

class UCS_EnemyClose_InWeaponCombo : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_InWeaponCombo::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsEnemyDoingCombo();
    }
}

class UCS_EnemyClose_RunningTowardsThem : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_RunningTowardsThem::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsRunningTowardsEnemy();
    }
}

class UCS_EnemyClose_RunningTowardsMe : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_RunningTowardsMe::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsEnemyRunningTowardsMe();
    }
}

class UCS_EnemyClose_StrafingAroundThem : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_StrafingAroundThem::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsStrafing();
    }
}

class UCS_EnemyClose_IdleAndFacingEnemy : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_IdleAndFacingEnemy::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsFacingEnemy()
            && !Combat.IsMoving();
    }
}

class UCS_IdleButNotFacingEnemy : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IdleButNotFacingEnemy::IsInSituation"));
        
        return !Combat.IsFacingEnemy() 
            && !Combat.IsMoving();
    }
}

class UCS_NotFacingEnemy : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_NotFacingEnemy::IsInSituation"));
        
        return !Combat.IsFacingEnemy();
    }
}

class UCS_IdleAndFacingEnemy : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IdleAndFacingEnemy::IsInSituation"));
        
        return Combat.IsFacingEnemy() 
            && !Combat.IsMoving();
    }
}

class UCS_IsFacingDirectionRequirement : UFightAI_CombatSituation
{
    UCS_IsFacingDirectionRequirement(EAttackDirectionRequirement _AttackDirectionRequirement)
    {
        AttackDirectionRequirement = _AttackDirectionRequirement;
    }

    default bRequireCharacterOfInterest = true;
    
    UPROPERTY()
    EAttackDirectionRequirement AttackDirectionRequirement = EAttackDirectionRequirement::Any;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsFacingDirectionRequirement::IsInSituation"));
        
        switch(AttackDirectionRequirement)
        {
            case EAttackDirectionRequirement::Front:
                return Combat.Self.IsFacingOtherCharacter(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::Back:
                return Combat.Self.IsBackFacingOtherCharacterDirectly(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::NotFront:
                return !Combat.Self.IsFacingOtherCharacter(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::NotBack:
                return !Combat.Self.IsBackFacingOtherCharacterDirectly(Combat.CharacterOfInterest);
            case EAttackDirectionRequirement::Any:
            case EAttackDirectionRequirement::None:
            default:
                return true;
        }
    }
}

class UCS_HasDrawnWeapon : UFightAI_CombatSituation
{
    UCS_HasDrawnWeapon(TSubclassOf<UWeaponDefinition> InRequiredWeaponClass)
    {
        RequiredWeaponClass = InRequiredWeaponClass;
    }

    TSubclassOf<UWeaponDefinition> RequiredWeaponClass = nullptr;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnWeapon::IsInSituation"));
        
        if (RequiredWeaponClass == nullptr)
            return Combat.Self.HasDrawnWeapon();

        return Combat.Self.HasDrawnWeaponOfClass(RequiredWeaponClass);
    }
}

class UCS_HasDrawnMeleeWeapon : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnMeleeWeapon::IsInSituation"));
        
        return Combat.Self.HasDrawnWeaponOfClass(UWeaponMeleeDefinition::StaticClass());
    }
}

class UCS_HasDrawnRangedWeapon : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnRangedWeapon::IsInSituation"));
        
        return Combat.Self.HasDrawnWeaponOfClass(UWeaponArcheryDefinition::StaticClass());
    }
}

class UCS_HasDrawnMagicSpell : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnMagicSpell::IsInSituation"));
        
        return Combat.Self.HasDrawnRune();
    }
}

class UCS_HasDrawnMagicSpellWithTag : UFightAI_CombatSituation
{
    UCS_HasDrawnMagicSpellWithTag(FGameplayTag InTag)
    {
        Tag = InTag;
    }

    FGameplayTag Tag = FGameplayTag();

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnMagicSpellWithTag::IsInSituation"));
        
        check(Tag.IsValid());

        if (!Tag.IsValid())
            return false;

        return Combat.Self.HasDrawnMagicSpellWithTag(Tag);
    }
}

class UCS_HasDrawnSelectedMagicSpell : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasDrawnSelectedMagicSpell::IsInSituation"));
        
        if (!Combat.IsSpellSelected())
            return false;

        return Combat.Self.HasDrawnMagicSpellWithTag(Combat.SelectedItem.ItemType);
    }
}

class UCS_HasMagicSpellInInventory : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasMagicSpellInInventory::IsInSituation"));
        
        return Combat.Self.Inventory.HasAnyMagicRuneInInventory() || Combat.Self.Inventory.HasAnyMagicScrollInInventory();
    }
}

class UCS_HasMagicSpellInInventoryWithSpec : UFightAI_CombatSituation
{
    UCS_HasMagicSpellInInventoryWithSpec(FGameplayTag InSpec)
    {
        Spec = InSpec;
    }

    FGameplayTag Spec;
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasMagicSpellInInventoryWithSpec::IsInSituation"));
        
        if (!Spec.IsValid())
            return false;
        
        return Combat.Self.Inventory.HasAnySpellWithKeyword(Spec);
    }
}

class UCS_Moving : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Moving::IsInSituation"));
        
        return Combat.IsMoving();
    }
}

class UCS_NotMoving : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_NotMoving::IsInSituation"));
        
        return !Combat.IsMoving();
    }
}

class UCS_RunningOrSprinting : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Moving::IsInSituation"));

        if (!Combat.IsMoving())
            return false;

        if (Combat.AI.Character.GetWalkSpeed() == EWalkSpeed::Walking)
            return false;
        
        return true;
    }
}

class UCS_FacingEnemy : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_FacingEnemy::IsInSituation"));
        
        return Combat.IsFacingEnemy();
    }
}

class UCS_EnemyClose_IdleButNotFacingEnemy : UCS_EnemyClose
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyClose_IdleButNotFacingEnemy::IsInSituation"));
        
        return Super::IsInSituation()
            && !Combat.IsFacingEnemy()
            && !Combat.IsMoving();
    }
}

class UCS_EnemyOutOfReach : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach::IsInSituation"));
        
        return Combat.IsEnemyBarelyOutOfReach();
    }
}

class UCS_EnemyOutOfReachOrTooFar : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReachOrTooFar::IsInSituation"));
        
        return Combat.IsEnemyBarelyOutOfReach() || !Combat.IsEnemyWithinDangerousDistance();
    }
}

class UCS_EnemyOutOfReach_InWeaponCombo : UCS_EnemyOutOfReach
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach_InWeaponCombo::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.Self.IsInAttackCombo();
    }
}

class UCS_EnemyOutOfReach_RunningTowardsThem : UCS_EnemyOutOfReach
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach_RunningTowardsThem::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsRunningTowardsEnemy();
    }
}

class UCS_EnemyOutOfReach_StrafingAroundThem : UCS_EnemyOutOfReach
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach_StrafingAroundThem::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsStrafing();
    }
}

class UCS_EnemyOutOfReach_IdleAndFacingEnemy : UCS_EnemyOutOfReach
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach_IdleAndFacingEnemy::IsInSituation"));
        
        return Super::IsInSituation()
            && Combat.IsFacingEnemy();
    }
}

class UCS_EnemyOutOfReach_IdleButNotFacingEnemy : UCS_EnemyOutOfReach
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyOutOfReach_IdleButNotFacingEnemy::IsInSituation"));
        
        return Super::IsInSituation()
            && !Combat.IsFacingEnemy();
    }
}

class UCS_EnemyTooFar : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyTooFar::IsInSituation"));
        
        return Combat.GetDistanceToCharacterOfInterest() > Combat.EnemyCombatDistance - 200.0f;
    }
}

class UCS_TooFarFromPreferredDistanceOrAlreadyMoving : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TooFarFromPreferredDistanceOrAlreadyMoving::IsInSituation"));
        
        if (Combat.Self.IsMoving())
            return true;
        
        float DistanceToTarget = Combat.GetDistanceToCharacterOfInterest();
        if (DistanceToTarget > Combat.Config.PreferredDistance + 400.0f)
            return true;

        if (Combat.CurrentCombatBehaviorSet == nullptr)
            return false;

        return false;
    }
}

class UCS_IsSubstate : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsSubstate::IsInSituation"));
        
        return Combat.IsCombatSubstate();
    }
}

class UCS_LastMoveWasMoveToTarget : UCS_LastMoveWas
{
    default MoveType = UCM_MoveTowardsEnemy::StaticClass();
}

class UCS_FollowingTarget : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_FollowingTarget::IsInSituation"));
        
        return Combat.AI.IsFollowingActor(Combat.CharacterOfInterest);
    }
}

class UCS_NotFollowingTarget : UCS_FollowingTarget
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_NotFollowingTarget::IsInSituation"));
        
        return !Super::IsInSituation();
    }
}

class UCS_IsCurrentSpeed : UFightAI_CombatSituation
{
    UPROPERTY()
    EWalkSpeed Speed = EWalkSpeed::Walking;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCurrentSpeed::IsInSituation"));
        
        return Combat.Self.GetWalkSpeed() == Speed;
    }
}

class UCS_WalkingSpeed : UCS_IsCurrentSpeed
{
    default Speed = EWalkSpeed::Walking;
}

class UCS_RunningSpeed : UCS_IsCurrentSpeed
{
    default Speed = EWalkSpeed::Running;
}
 
class UCS_StateTimeGreaterThan : UFightAI_CombatSituation
{
    UCS_StateTimeGreaterThan(float InSeconds)
    {
        Seconds = InSeconds;
    }

    /** Duration the combat state needs to be active for this situation to apply. */
    UPROPERTY()
    float Seconds = 0.0f;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_StateTimeGreaterThan::IsInSituation"));
        
        return Combat.HasBeenInStateForSeconds(Seconds);
    }
}

class UCS_StateTimeLessThan : UFightAI_CombatSituation
{
    UCS_StateTimeLessThan(float InSeconds)
    {
        Seconds = InSeconds;
    }

    /** Duration the combat state needs to be active for this situation to apply. */
    UPROPERTY()
    float Seconds = 0.0f;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_StateTimeLessThan::IsInSituation"));
        
        return !Combat.HasBeenInStateForSeconds(Seconds);
    }
}

class UCS_LastMoveLandedHits : UFightAI_CombatSituation
{
    /** How many hits the last move needs to have hit for this situation to apply. */
    UPROPERTY()
    int NumHits = 1;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LastMoveLandedHits::IsInSituation"));
        
        return Combat.NumHitsInCycle >= NumHits;
    }
}

/** Has it been less than 10 seconds since the last time I was hit */
class UCS_LessThanTenSecondsSinceHit : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LessThanTenSecondsSinceHit::IsInSituation"));
        float TimeSinceLastHit = Combat.GetSecondsSinceLastHitOnMe();
        if (TimeSinceLastHit < 0.0f)
            return false;
        
        return TimeSinceLastHit < 10;
    }
}

UCLASS()
/** Has it been less than 10 seconds since the last time I was hit */
class UCS_LastHitWasLessThanNSecondsAgo : UFightAI_CombatSituation
{
    UPROPERTY()
    float Seconds = 10.0f;

    UCS_LastHitWasLessThanNSecondsAgo(float InSeconds)
    {
        Seconds = InSeconds;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LastHitWasLessThanNSecondsAgo::IsInSituation"));
        
        float SecondsSinceLastHitOnMe = Combat.GetSecondsSinceLastHitOnMe();
        if (SecondsSinceLastHitOnMe < 0.0f)
            return false;

        return SecondsSinceLastHitOnMe < Seconds;
    }
}

class UCS_DamagedEnemy : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_DamagedEnemy::IsInSituation"));
        
        return Combat.HasNoticedDamageOnTarget();
    }
}

class UCS_Any : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Any::IsInSituation"));
        
        return true;
    }
}

/** Situation that applies when the current move has the given tag */
class UCS_React_CurrentMoveHasTag : UFightAI_CombatSituation
{
    UCS_React_CurrentMoveHasTag (FGameplayTag InTag)
    {
        Tag = InTag;
    }

    FGameplayTag Tag = GameplayTag::Action;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_CurrentMoveHasTag::IsInSituation"));
        
        if (Tag == GameplayTag::Action)
        {
            Print ("No tag was passed in the CurrentMoveHasTag situation");
            return false;
        }

        return Combat.IsDoingMoveWithTag(Tag);
    }
}

class UCS_React_CurrentMoveHasTag_NotInsideDistanceRange : UCS_React_CurrentMoveHasTag
{
    UCS_React_CurrentMoveHasTag_NotInsideDistanceRange (FGameplayTag InTag, float InMinDistance, float InMaxDistance)
    {
        Tag = InTag;
        MinDistance = InMinDistance;
        MaxDistance = InMaxDistance;
    }

    default bRequireCharacterOfInterest = true;

    float MinDistance = 0.0f;
    float MaxDistance = 100.0f;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_CurrentMoveHasTag_NotInsideDistanceRange::IsInSituation"));
        
        if (!Super::IsInSituation())
            return false;

        float DistanceToEnemy = Combat.Self.GetDistanceTo(Combat.CharacterOfInterest);
        if (DistanceToEnemy < MinDistance)
            return true;
        if (DistanceToEnemy > MaxDistance) 
            return true;

        return false;
    }
}

class UCS_React_CurrentMoveHasTag_NotFacingEnemy : UCS_React_CurrentMoveHasTag
{
    UCS_React_CurrentMoveHasTag_NotFacingEnemy (FGameplayTag InTag)
    {
        Tag = InTag;
    }

    float MinDistance = 0.0f;
    float MaxDistance = 100.0f;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_CurrentMoveHasTag_NotFacingEnemy::IsInSituation"));
        
        if (Combat.IsFacingEnemy()) return false;

        return Super::IsInSituation();
    }
}

class UCS_CurrentActionIsAttack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (!IsValid(Combat))
            return false;

        if (!IsValid(Combat.CurrentActionCombatMove))
            return false;

        if (!Combat.CurrentActionCombatMove.IsA(UCM_Attack))
            return false;

        return true;
    }
}

class UCS_CurrentAttackActionIsType : UFightAI_CombatSituation
{
    UCS_CurrentAttackActionIsType(FGameplayTag RequestedTypeTag)
    {
        _RequestedTypeTag = RequestedTypeTag;
    }

    UPROPERTY()
    FGameplayTag _RequestedTypeTag;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (!_RequestedTypeTag.IsValid())
            false;

        if (!IsValid(Combat))
            false;

        if (!IsValid(Combat.CurrentActionCombatMove))
            return false;

        if (!Combat.CurrentActionCombatMove.MoveTypes.HasTag(_RequestedTypeTag))
            return false;

        return true;
    }
}

class UCS_TagIsValid : UFightAI_CombatSituation
{
    UCS_TagIsValid(FGameplayTag Tag)
    {
        _Tag = Tag;
    }

    UPROPERTY()
    FGameplayTag _Tag;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (_Tag.IsValid())
            return true;

        return false;
    }
}

class UCS_CurrentActionDistanceAndFacingRequirementsFulfilled : UFightAI_CombatSituation
{
    
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;

        if (!IsValid(Combat.CurrentActionCombatMove))
            return true;

        // Not within required distance from target
        if (Combat.DistanceToCharacterOfInterest < Combat.CurrentActionCombatMove.MinRange ||
            Combat.DistanceToCharacterOfInterest > Combat.CurrentActionCombatMove.MaxRange)
            return false;

        // Not within required relative height from target
        if (Combat.CurrentActionCombatMove.bRequiresSpecificRelativeHeight &&
            (Combat.HeightRelativeToCharacterOfInterest < Combat.CurrentActionCombatMove.MinRelativeHeight ||
            Combat.DistanceToCharacterOfInterest > Combat.CurrentActionCombatMove.MaxRelativeHeight))
            return false;
        
        // Not facing the correct direction for attack
        if (Combat.CurrentActionCombatMove.IsA(UCM_Attack) && !Cast<UCM_Attack>(Combat.CurrentActionCombatMove).IsFacingTheCorrectDirection())
            return false;

        return true;
    }
}

class UCS_DoingAnAttack : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_DoingAnAttack::IsInSituation"));
        
        return Combat.Self.IsDoingAttack();
    }
}

class UCS_LastMoveWas : UFightAI_CombatSituation
{
    UCS_LastMoveWas(TSubclassOf<UAITask_CombatMove> InMoveType)
    {
        MoveType = InMoveType;
    }

    /** Situation applies, if the move of the last cycle is a subclass of this. */
    TSubclassOf<UAITask_CombatMove> MoveType;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LastMoveWas::IsInSituation"));
        
        return Combat.WasLastCombatMove(MoveType);
    }
}

class UCS_LastMoveWasNot : UCS_LastMoveWas
{
    UCS_LastMoveWasNot(TSubclassOf<UAITask_CombatMove> InMoveType)
    {
        MoveType = InMoveType;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LastMoveWasNot::IsInSituation"));
        
        return !Super::IsInSituation();
    }
}

class UCS_LastMoveWasDodge : UCS_LastMoveWas
{
    default MoveType = UCM_Dodge::StaticClass();
}

class UCS_LastMoveWasNotDodge : UCS_LastMoveWasNot
{
    default MoveType = UCM_Dodge::StaticClass();
}

class UCS_React_EnemyJumped : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_EnemyJumped::IsInSituation"));
        
        return Combat.CharacterOfInterest.bWasJumping;
    }
}

class UCS_LastMoveWasAttack : UCS_LastMoveWas
{
    default MoveType = UCM_Attack::StaticClass();
}

class UCS_LastMoveWasChargeAttack : UCS_LastMoveWasAttack
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_LastMoveWasChargeAttack::IsInSituation"));
        
        if (!Super::IsInSituation())
            return false;

        if (Combat.LastAttackUsageType != EAttackUsageType::Charge)
            return false;

        return true;
    }
}

class UCS_LastMoveWasNotAttack : UCS_LastMoveWasNot
{
    default MoveType = UCM_Attack::StaticClass();
}

class UCS_IsMoveOnCooldown : UFightAI_CombatSituation
{
    UCS_IsMoveOnCooldown(TSubclassOf<UAITask_CombatMove> InMoveClass)
    {
        MoveClass = InMoveClass;
    }

    UPROPERTY()
    TSubclassOf<UAITask_CombatMove> MoveClass;

    FString GetDisplayName() const override
    {
        FString Str;
        
        UAITask_CombatMove MoveDefaultObject = Cast<UAITask_CombatMove>(MoveClass.Get().DefaultObject);

        check (MoveDefaultObject != nullptr);

        Str.Append(MoveDefaultObject.GetDisplayName());
        Str.Append(FString(" OnCooldown"));
        return Str;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsMoveOnCooldown::IsInSituation"));
        
        UAITask_CombatMove MoveDefaultObject = Cast<UAITask_CombatMove>(MoveClass.Get().DefaultObject);
        return Combat.IsMoveInCooldown(MoveDefaultObject);
    }
}

class UCS_IsMoveNotOnCooldown : UCS_IsMoveOnCooldown
{
    UCS_IsMoveNotOnCooldown(TSubclassOf<UAITask_CombatMove> InMoveClass)
    {
        MoveClass = InMoveClass;
    }

    FString GetDisplayName() const override
    {
        FString Str;

        UAITask_CombatMove MoveDefaultObject = Cast<UAITask_CombatMove>(MoveClass.Get().DefaultObject);

        Str.Append(MoveDefaultObject.GetDisplayName());
        Str.Append(FString(" NotOnCooldown"));
        return Str;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsMoveNotOnCooldown::IsInSituation"));
        
        return !Super::IsInSituation();
    }
}

class UCS_React_MissedAnyAttack : UCS_LastMoveWasAttack
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_MissedAnyAttack::IsInSituation"));
        
        return  Combat.HasNoticedMissOnTarget() && Super::IsInSituation();;
    }
}

class UCS_React_MissedSpecificAttack : UCS_React_MissedAnyAttack
{
    UCS_React_MissedSpecificAttack(TSubclassOf<UCM_Attack> InAttackMoveType)
    {
        MoveType = InAttackMoveType;
    }
}

class UCS_IsCombatLeader : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCombatLeader::IsInSituation"));
        
        return Combat.CombatGroup.GetFightLeader() == Combat.Self;
    }
}

class UCS_IsCombatFollower : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCombatFollower::IsInSituation"));
        
        return Combat.CombatGroup.GetFightLeader() != Combat.Self;
    }
}

/** Has our current group order changed to...? */
class UCS_React_GroupOrderChangedTo : UFightAI_CombatSituation
{
    UCS_React_GroupOrderChangedTo(ECombatRole InExpectedOrder)
    {
        ExpectedOrder = InExpectedOrder;
    }

    UPROPERTY()
    ECombatRole ExpectedOrder;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_React_GroupOrderChangedTo::IsInSituation"));
        
        if (Combat.CombatGroup == nullptr)
            return false;

        // Order is assigned to last known order after assesment is done.
        ECombatRole CurrentOrder = Combat.CombatGroup.RoleSystem.GetCharactersRoleType(Combat.Self);

        return Combat.MyLastKnownOrder != CurrentOrder && CurrentOrder == ExpectedOrder;
    }
}

/** Is our current group order equal to...? */
class UCS_IsGroupOrder : UFightAI_CombatSituation
{
    UCS_IsGroupOrder(ECombatRole InExpectedOrder)
    {
        ExpectedOrder = InExpectedOrder;
    }

    UPROPERTY()
    ECombatRole ExpectedOrder;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsGroupOrder::IsInSituation"));
        
        if (Combat.CombatGroup == nullptr)
            return false;

        return Combat.CombatGroup.RoleSystem.GetCharactersRoleType(Combat.Self) == ExpectedOrder;
    }
}

/** Is our current order different from...? */
class UCS_IsNotGroupOrder : UCS_IsGroupOrder
{
    UCS_IsNotGroupOrder(ECombatRole InExpectedOrder)
    {
        ExpectedOrder = InExpectedOrder;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsNotGroupOrder::IsInSituation"));
        
        return !Super::IsInSituation();
    }
}

/** Are we doing combat in a group or are we alone? */
class UCS_IsInCombatGroup : UFightAI_CombatSituation
{
    UCS_IsInCombatGroup(int InNumMembersMin)
    {
        NumMembersMin = InNumMembersMin;
    }

    UPROPERTY()
    int NumMembersMin = 1;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsInCombatGroup::IsInSituation"));
        
        if (Combat.CombatGroup == nullptr)
            return false;

        return Combat.CombatGroup.JoinedCharacters.Num() >= NumMembersMin;
    }
}

/** Are we the weakest member of the combat group? */
class UCS_IsWeakestOfGroup : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsWeakestOfGroup::IsInSituation"));
        
        if (Combat.CombatGroup == nullptr)
            return false;

        return Combat.CombatGroup.WeakestMember == Combat.Self;
    }
}

/** Are we NOT the weakest membet of the combat group? */
class UCS_IsNotWeakestOfGroup : UCS_IsWeakestOfGroup
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsNotWeakestOfGroup::IsInSituation"));
        
        return !Super::IsInSituation();
    }
}

class UCS_IsCurrentRole : UFightAI_CombatSituation
{
    UCS_IsCurrentRole(ECombatRole InRole)
    {
        Role = InRole;
    }

    ECombatRole Role = ECombatRole::None;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCurrentRole::IsInSituation"));
        
        return Combat.IsCurrentRole(Role);
    }

    FString GetDisplayName() const override
    {
        return Super::GetDisplayName() + " " + FCombatGroupRole::GetRoleName(Role);
    }
}

class UCS_IsCurrentRole_ActiveAttacker : UCS_IsCurrentRole
{
    default Role = ECombatRole::ActiveAttacker;
}

class UCS_IsCurrentRole_PassiveAttacker : UCS_IsCurrentRole
{
    default Role = ECombatRole::PassiveAttacker;
}

class UCS_IsCurrentRole_Observer : UCS_IsCurrentRole
{
    default Role = ECombatRole::Observer;
}

class UCS_HasAttackToken : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_HasAttackToken::IsInSituation"));
        
        if (Combat == nullptr || Combat.CombatGroup == nullptr || Combat.Self == nullptr)
            return false;
        
        return Combat.CombatGroup.DoesCharacterHaveAttackToken(Combat.Self);
    }
}

class UCS_True : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_True::IsInSituation"));
        
        return true;
    }
}

class UCS_Not : UFightAI_CombatSituation
{
    UCS_Not(UFightAI_CombatSituation InSituation)
    {
        Situation = InSituation;
    }

    UFightAI_CombatSituation Situation;

    FString GetDisplayName() const override
    {
        FString Str = FString("Not ");
        FString SituationName = Situation.GetDisplayName();
        Str.Append(SituationName);
        return Str;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Not::IsInSituation"));

        if (!IsValid(Situation))
            return false;
        
        return !Situation.IsInSituation();
    }
}

class UCS_Or : UFightAI_CombatSituation
{
    UCS_Or(UFightAI_CombatSituation InSituationA, UFightAI_CombatSituation InSituationB)
    {
        SituationA = InSituationA;
        SituationB = InSituationB;
    }

    UFightAI_CombatSituation SituationA;
    UFightAI_CombatSituation SituationB;

    FString GetDisplayName() const override
    {
        FString Str;
        Str.Append(SituationA.GetDisplayName() + FString(" OR ") + SituationB.GetDisplayName());
        return Str;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Or::IsInSituation"));
        
        return SituationA.IsInSituation() || SituationB.IsInSituation();
    }
}

class UCS_And : UFightAI_CombatSituation
{
    UCS_And(UFightAI_CombatSituation InSituationA, UFightAI_CombatSituation InSituationB)
    {
        SituationA = InSituationA;
        SituationB = InSituationB;
    }

    UFightAI_CombatSituation SituationA;
    UFightAI_CombatSituation SituationB;

    FString GetDisplayName() const override
    {
        FString Str;
        Str.Append(SituationA.GetDisplayName() + FString(" AND ") + SituationB.GetDisplayName());
        return Str;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_And::IsInSituation"));
        
        return SituationA.IsInSituation() && SituationB.IsInSituation();
    }
}

class UCS_OtherCharactersInsideExpandedSafeZone : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (Combat.Positioning.GetCharactersInsideExpandedSafeZone().Num() > 1)
            return true;

        return false;
    }
}

class UCS_IsPositionValid : UFightAI_CombatSituation
{
    UCS_IsPositionValid(FVector InPosition)
    {
        Position = InPosition;
    }

    FVector Position = FVector::ZeroVector;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsPositionValid::IsInSituation"));
        
        return Combat.Positioning.IsPositionValid(Position);
    }
}

class UCS_IsCurrentAgentLocationValid : UCS_IsPositionValid
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCurrentAgentLocationValid::IsInSituation"));
        
        return Combat.Positioning.IsPositionInPositioningDistanceRangeFromTarget(Combat.Self.GetFeetLocation());
    }
}

class UCS_IsPreferredPositionValid : UCS_IsPositionValid
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsPreferredPositionValid::IsInSituation"));
        
        if (!Combat.Positioning.IsPositionInPositioningDistanceRangeFromTarget(Combat.Self.GetFeetLocation()))
            return false;

        if (Combat.AI.PreferredLocation.GetCenterPoint().Distance(Combat.Self.GetFeetLocation()) < Combat.Positioning.MinimumPositionDistance)
            return true;

        return !Combat.Positioning.IsPositionOccupied(Combat.AI.PreferredLocation.GetCenterPoint());
    }
}

class UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan : UFightAI_CombatSituation
{
    int HitAmount = 6;
    float32 TimeFrame = 10.0f;

    UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan(int InHitAmount, float32 InTimeFrameSeconds)
    {
        HitAmount = InHitAmount;
        TimeFrame = InTimeFrameSeconds;
    } 

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsAmountOfHitsReceivedInLastSecondsHigherThan::IsInSituation"));
        
        if (Combat.HitsReceivedInTheLastSeconds(TimeFrame) > HitAmount)
        {
            return true;
        }

        return false;
    }
}

class UCS_IsDamageReceivedInLastSecondsHigherThan : UFightAI_CombatSituation
{
    float32 DamageThreshhold = 0.0f;
    float32 TimeFrame = 5.0f;

    UCS_IsDamageReceivedInLastSecondsHigherThan(float32 InDamageThreshhold, float32 InTimeFrameSeconds)
    {
        DamageThreshhold = InDamageThreshhold;
        TimeFrame = InTimeFrameSeconds;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsDamageReceivedInLastSecondsHigherThan::IsInSituation"));
        
        float DamageReceived = Combat.DamageReceivedInTheLastSeconds(TimeFrame);
        if (DamageReceived > DamageThreshhold)
        {
            return true;
        }

        return false; 
    }
}

class UCS_IsDamageReceivedInLastSecondsHigherThanPercent : UFightAI_CombatSituation
{
    float32 DamageThreshhold = 0.0f;
    float32 TimeFrame = 5.0f;

    UCS_IsDamageReceivedInLastSecondsHigherThanPercent(float32 InDamageThreshholdPercentage, float32 InTimeFrameSeconds)
    {
        DamageThreshhold = InDamageThreshholdPercentage;
        TimeFrame = InTimeFrameSeconds;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsDamageReceivedInLastSecondsHigherThanPercent::IsInSituation"));
        
        float DamageReceived = Combat.DamageReceivedInTheLastSeconds(TimeFrame);
        if (DamageReceived > DamageThreshhold * Combat.Self.GetMaxHealthAttribute())
        {
            return true;
        }

        return false; 
    }

    FString GetDisplayName() const override
    {
        return f"IsDamageReceivedHigherThan {DamageThreshhold * 100.0f:.0f}% last {TimeFrame:.2f} seconds"; 
    }
}

class UCS_JustRecoveredFromSuperarmorBreak : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_JustRecoveredFromSuperarmorBreak::IsInSituation"));
        
        if (!Combat.Self.HasGameplayTag(GameplayTag::State_Hit_BreakSuperArmor))
            return false;

        if (!Combat.Self.HasGameplayTag(GameplayTag::State_ResetStates))
            return false;

        return true;
    }
}

class UCS_Test_SkeletonMage_CanSpawnNewSkeletons : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Test_SkeletonMage_CanSpawnNewSkeletons::IsInSituation"));

        auto SkeletonMageSummonComponent = USkeletonMageSummonManagerComponent::Get(Combat.Self);

        if (!IsValid(SkeletonMageSummonComponent))
            return false;
        
        return SkeletonMageSummonComponent.CanSummonSkeletons();
    }
}

class UCS_Test_SkeletonMage_CanSpawnNewSouls : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_Test_SkeletonMage_CanSpawnNewSouls::IsInSituation"));

        auto SkeletonMageSummonComponent = USkeletonMageSummonManagerComponent::Get(Combat.Self);

        if (!IsValid(SkeletonMageSummonComponent))
            return false;
        
        return SkeletonMageSummonComponent.CanSummonSouls();
    }
}

class UCS_IsDamageDealtInLastSecondsHigherThan : UFightAI_CombatSituation
{
    float32 DamageThreshhold = 0.0f;
    float32 TimeFrame = 5.0f;

    UCS_IsDamageDealtInLastSecondsHigherThan(float32 InDamageThreshhold, float32 InTimeFrameSeconds)
    {
        DamageThreshhold = InDamageThreshhold;
        TimeFrame = InTimeFrameSeconds;
    }

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsDamageDealtInLastSecondsHigherThan::IsInSituation"));
        
        return Combat.DamageDealtInTheLastSeconds(TimeFrame) > DamageThreshhold;
    }
}

class UCS_EnemyFrozen : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyFrozen::IsInSituation"));
        
        return Combat.CharacterOfInterest.IsFrozen();
    }
}

class UCS_EnemyParalized : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyParalized::IsInSituation"));
        
        return Combat.CharacterOfInterest.IsParalized();
    }
}

class UCS_EnemyDeadOrDefeated : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyDead::IsInSituation"));
        
        if (!Combat.CharacterOfInterest.IsDead() && !Combat.CharacterOfInterest.IsDefeated())
            return false;

        return true;
    }
}

class UCS_EnemyDefeated : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyDefeated::IsInSituation"));
        
        if (!Combat.CharacterOfInterest.IsDefeated())
            return false;

        return true;
    }
}

class UCS_EnemyDead : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_EnemyDead::IsInSituation"));
        
        if (!Combat.CharacterOfInterest.IsDead())
            return false;

        return true;
    }
}

class UCS_EnemyVisible : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;

        if (!Combat.Self.Perception.CanSee(Combat.CharacterOfInterest))
            return false;

        return true;
    }
}

class UCS_IsCastingSpellConcurrently : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCastingSpellConcurrently::IsInSituation"));
        
        if (!Combat.Self.IsDoingMagic())
            return false;

        if (Combat.CurrentActionCombatMove == nullptr)
            return false;

        if (!Combat.CurrentActionCombatMove.CanWalkDuringCombatMove())
            return false;

        return true;
    }
}

class UCS_SelectedSpellHasSpec : UFightAI_CombatSituation
{
    UCS_SelectedSpellHasSpec(FGameplayTag InSpec)
    {
        Spec = InSpec;
    }

    FGameplayTag Spec = FGameplayTag();

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedSpellHasSpec::IsInSituation"));
        
        if (!Spec.IsValid())
            return false;

        if (!Combat.IsSpellSelected())
            return false;

        return Combat.SelectedSpellAction.Keywords.HasTag(Spec);
    }
}

class UCS_IsInComboWindow : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsInComboWindow::IsInSituation"));
        
        return Combat.Self.IsInAttackComboWindow();
    }
}

class UCS_CanDoCombosWithCurrentlyDrawnWeapon : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CanDoCombosWithCurrentlyDrawnWeapon::IsInSituation"));
        
        return Combat.Self.CanDoCombosWithCurrentlyDrawnWeapon();
    }
}

class UCS_CanDodgeToMoveTowardsTarget : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CanDodgeToMoveTowardsTarget::IsInSituation"));
        
        return Combat.Config.bDodgeToMoveTowardsTarget;
    }
}

class UCS_CanDodgeToMoveAwayFromTarget : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CanDodgeToMoveAwayFromTarget::IsInSituation"));
        
        return Combat.Config.bDodgeToMoveAwayFromTarget;
    }
}

class UCS_CanMoveAwayFromEnemy : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CanMoveAwayFromEnemy::IsInSituation"));

        FVector HitLocation;
        // Normalized, Agent to CharacterOfInterest
        FVector Direction = (Combat.Self.NavAgentLocation - Combat.CharacterOfInterest.NavAgentLocation).GetSafeNormal();
        return UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Combat.Self, Direction, 100.0f, HitLocation);
    }
}

class UCS_IsInsideCombatStartTerritory : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        return Combat.CharacterState.IsCharacterStateWithinTerritory(Combat.Territory);
    }
}

class UCS_IsInSameTerritoryAsCharacterOfInterest : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;

        if (!Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
            return false;

        return true;
    }
}

class UCS_IsReachableInMelee : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Combat.AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Combat.CharacterOfInterest))
            return false;

        if (!Combat.IsTargetReachableInMelee())
            return false;
        
        return true;
    }
}

class UCS_IsInUnreachableEnemyStage : UFightAI_CombatSituation
{
    UCS_IsInUnreachableEnemyStage(EUnreachableEnemyBehaviorStageType InStage)
    {
        Stage = InStage;
    }

    UPROPERTY()
    EUnreachableEnemyBehaviorStageType Stage = EUnreachableEnemyBehaviorStageType::None;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (Combat.CurrentCombatBehaviorSet == nullptr)
            return false;

        if (!Combat.CurrentCombatBehaviorSet.IsA(UCombatBehaviorSet_UnreachableEnemy::StaticClass()))
            return false;

        if (Cast<UCombatBehaviorSet_UnreachableEnemy>(Combat.CurrentCombatBehaviorSet).GetExpectedCurrentStage() != Stage)
            return false;

        return true;
    }
}

class UCS_IsCurrentComboChainOpen : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsCurrentComboChainOpen::IsInSituation"));
        
        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(Combat.CurrentActionCombatMove);
        if (CurrentComboMove == nullptr)
            return false;

        return !CurrentComboMove.IsComboClosed();
    }
}

UCLASS()
class UCS_CurrentComboAttacksDoneEquals : UFightAI_CombatSituation
{
    UCS_CurrentComboAttacksDoneEquals(int InAmount)
    {
        Amount = InAmount;
    }

    UPROPERTY()
    int Amount = 1;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CurrentComboAttacksDoneEquals::IsInSituation"));
        
        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(Combat.CurrentActionCombatMove);
        if (CurrentComboMove == nullptr)
            return false;

        return CurrentComboMove.AttacksDone == Amount;
    }
}

UCLASS()
class UCS_ShouldCloseCurrentDynamicCombo : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_ShouldCloseCurrentDynamicCombo::IsInSituation"));
        
        UCM_AttackDCombo CurrentComboMove = Cast<UCM_AttackDCombo>(Combat.CurrentActionCombatMove);
        if (CurrentComboMove == nullptr)
            return false;

        if (Combat.HasIncomingAttack(0.33f))
            return true;

        if (!Combat.Self.CanDoCombosWithCurrentlyDrawnWeapon())
            return true;

        return false;
    }
}

UCLASS()
class UCS_AnyNonTargetCharacterTooClose : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_AnyNonTargetCharacterTooClose::IsInSituation"));
        
        TArray<AGothicCharacter> Characters = Combat.Positioning.GetCharactersInRangeOfTarget(Combat.Self.SimpleCollisionRadius + 120.0f);

        if (Characters.Num() == 0)
            return false;

        if (Characters.Num() > 1)
            return true;

        if (Characters[0] != Combat.CharacterOfInterest)
            return true;

        return false;
    }
}

UCLASS()
class UCS_AnyNonTargetCharacterBetweenAgentAndTarget : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_AnyNonTargetCharacterBetweenAgentAndTarget::IsInSituation"));
        
        if (Combat.CombatGroup == nullptr)
            return false;

        return Combat.CombatGroup.IsAnotherCharacterBetweenCharacterAndTarget(Combat.Self);
    }
}

UCLASS()
class UCS_CharacterOfInterestIsUnreachable : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CharacterOfInterestIsUnreachable::IsInSituation"));
        
        return !Combat.IsTargetReachable();
    }
}

UCLASS()
class UCS_SelectedItemIsWeapon : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedItemIsWeapon::IsInSituation"));
        
        if (Combat.SelectedItem == nullptr)
            return false;

        return Combat.SelectedItem.IsA(UWeaponDefinition::StaticClass());
    }
}

UCLASS()
class UCS_SelectedItemIsSpell : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedItemIsSpell::IsInSituation"));
        
        if (Combat.SelectedItem == nullptr)
            return false;

        return Combat.SelectedItem.IsA(USpellContainer::StaticClass());
    }
}

UCLASS()
class UCS_TargetIsLowerAltitude : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetIsLowerAltitude::IsInSituation"));
        float diff = Combat.CharacterOfInterest.GetFeetLocation().Z - Combat.Self.GetFeetLocation().Z;
        if ( diff > 0.0)
            return false;

        return true;
    }
}

UCLASS()
class UCS_TargetIsHigherAltitude : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_TargetIsHigherAltitude::IsInSituation"));
        
        if (Combat.CharacterOfInterest.GetFeetLocation().Z <= Combat.Self.GetFeetLocation().Z)
            return false;

        return true;
    }
}

UCLASS()
class UCS_TargetIsMeatbug : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (!IsValid(Combat.CharacterOfInterest) || !Combat.CharacterOfInterest.IsSpecies(GameplayTag::Species_Creature_Meatbug))
            return false;

        return true;
    }
}

UCLASS()
class UCS_FacingTheCorrectDirectionToAttack : UFightAI_CombatSituation
{
    UCS_FacingTheCorrectDirectionToAttack(UCM_Attack InAttack)
    {
        Attack = InAttack;
    }

    UPROPERTY()
    UCM_Attack Attack;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_FacingTheCorrectDirectionToAttack::IsInSituation"));
        
        if (!IsValid(Attack))
            return false;

        return Attack.IsFacingTheCorrectDirection();
    }
}

UCLASS()
class UCS_AttackSelected : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_AttackSelected::IsInSituation"));
        
        if (Combat == nullptr)
            return false;
        
        return Combat.IsAttackSelected();
    }
}

UCLASS()
class UCS_SpellSelected : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SpellSelected::IsInSituation"));
        
        if (Combat == nullptr)
            return false;
        
        return Combat.IsSpellSelected();
    }
}

UCLASS()
class UCS_AttackSelectedByThisSelector : UFightAI_CombatSituation
{
    UCS_AttackSelectedByThisSelector(UCBT_Node AttackSelectorNode)
    {
        _AttackSelectorNode = AttackSelectorNode;
    }

    UPROPERTY()
    const UCBT_Node _AttackSelectorNode;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_AttackSelectedByThisSelector::IsInSituation"));

        if (!IsValid(SelectedAttackSelectorNode) || SelectedAttackSelectorNode != _AttackSelectorNode)
            return false;

        return true;
    }

    UCBT_Node GetSelectedAttackSelectorNode() const property
    {
        if (!IsValid(Combat))
            return nullptr;

        if (!Combat.IsAttackSelected())
            return nullptr;

        return Combat.SelectedAttackHandler.AttackSelectorNode;
    }
}

UCLASS()
class UCS_SelectedAttackWouldHitCollision : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedAttackWouldHitCollision::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        return Combat.SelectedAttack.WouldAttackCollideWithWall() || Combat.SelectedAttack.WouldAttackHitFriendly();
    }
}

UCLASS()
class UCS_SelectedAttackWouldHitFriendly : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_SelectedAttackWouldHitFriendly::IsInSituation"));
        
        if (Combat.SelectedAttack == nullptr)
            return false;

        return Combat.SelectedAttack.WouldAttackHitFriendly();
    }
}

UCLASS()
class UCS_IsStuckInOtherCharacter : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_IsStuckInOtherCharacter::IsInSituation"));

        TArray<AGothicCharacter> OtherCharacters;    
        if (!Combat.Self.HasAliveUndefeatedOverlappingNPCs(Combat.Self.ActorLocation, OtherCharacters, FVector(1.2f, 1.2f, 1.f)))
            return false;

        for (auto OtherCharacter : OtherCharacters)
        {
            if (Combat.Self.IsEnemyTowards(OtherCharacter))
                continue;

            return true;
        }

        return false;
    }
}

UCLASS()
class UCS_CanGetToSelectedAttackReachInAStraightLine : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CanGetToAttackReachInAStraightLine::IsInSituation"));

        if (!IsValid(Combat.SelectedAttack))
            return false;

        return Combat.CanMoveToTargetIntoAttackReachInStraightLine(Combat.SelectedAttack.Reach);
    }
}

/////////////////
// Testing
/////////////////

UCLASS()
class UCS_SelfHasTag : UFightAI_CombatSituation
{
    UCS_SelfHasTag(FGameplayTag _Tag)
    {
        Tag = _Tag;
    }

    UPROPERTY()
    FGameplayTag Tag;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (!Tag.IsValid())
            return false;

        if (Combat.Self == nullptr)
            return false;

        return Combat.Self.HasGameplayTag(Tag);
    }
}

UCLASS()
class UCS_CharacterOfInterestHasTag : UFightAI_CombatSituation
{
    UCS_CharacterOfInterestHasTag(FGameplayTag _Tag)
    {
        Tag = _Tag;
    }
    default bRequireCharacterOfInterest = true;
    

    UPROPERTY()
    FGameplayTag Tag;

    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        if (!Tag.IsValid())
            return false;

        return Combat.CharacterOfInterest.HasGameplayTag(Tag);
    }
}

class UCS_CharacterOfInterestHasDrawnMeleeWeapon : UFightAI_CombatSituation
{
    default bRequireCharacterOfInterest = true;
    
    bool IsInSituation() const override
    {
        if (!Super::IsInSituation())
            return false;
        
        FScopeCycleCounter ScopeCycleCounter(FStatID(n"UCS_CharacterOfInterestHasDrawnMeleeWeapon::IsInSituation"));
        
        return Combat.CharacterOfInterest.HasDrawnWeaponOfClass(UWeaponMeleeDefinition::StaticClass());
    }
}

class UCS_IsFemale : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        return Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_OldCamp_WomanSlave) || Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    }
}

class UCS_IsMage : UFightAI_CombatSituation
{
    bool IsInSituation() const override
    {
        return 
        Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_OldCamp_FireMage) ||
        Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_SwampCamp_Guru) ||
        Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru) ||
        Combat.Self.HasGameplayTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
    }
}