UCLASS()
class UCBT_Tree_TrollAdult_GoToSelectedGoblin : UCBT_Tree
{
    default BaseSortLayer = 0.0f;
    
    default Sequence()
                .DoMove(UCM_Movement_TrollAdult_GoToSelectedGoblin());
    
    default MakeBehavior();
}

UCLASS()
class UCM_Movement_TrollAdult_GoToSelectedGoblin : UCM_Movement
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);

    bool IsMoveAllowed(FString&out Reason) const override
    {
        auto Troll = Cast<ATroll>(Combat.AI.Character);
        if (!IsValid(Troll))
            return false;

        if (!IsValid(Troll.m_SelectedProjectileCharacter))
        {
            Reason = "Troll has no goblin selected.";
            return false;
        }

        if (!Combat.IsDoingMoveOfClass(UCM_Attack_TrollAdult_GrabAndThrowGoblin))
        {
            Reason = "Not trying to throw goblin.";
            return false;
        }

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        auto Troll = Cast<ATroll>(Combat.AI.Character);
        if (!IsValid(Troll))
        {
            EndTaskAsFailure();
            return;
        }
        
        if (!IsValid(Troll.m_SelectedProjectileCharacter))
        {
            EndTaskAsFailure();
            return;
        }
        
        bool bTargetCharacterOfInterest = Combat.Config.bTargetCharacterOfInterest;
        Combat.SetWalkSpeed(EWalkSpeed::Running);
        while(ShouldKeepMovingToSelectedGoblin())
        {
            if (!IsValid(Troll.m_SelectedProjectileCharacter))
            {
                WaitSeconds(0.5f);
                continue;
            }

            Combat.Config.bTargetCharacterOfInterest = false;
            AI.SetTargetEnemy(Troll.m_SelectedProjectileCharacter,EGothicFocusPriority::CombatMove, this);
            //AI.TargetCharacter(Troll.m_SelectedProjectileCharacter, EGothicFocusPriority::CombatMove, this);
            
            if (!AI.IsFollowingActor(Troll.m_SelectedProjectileCharacter))
            {
                AI.Follow(Troll.m_SelectedProjectileCharacter);
            }
            

            WaitSeconds(0.5f);
        }

        Combat.Config.bTargetCharacterOfInterest = bTargetCharacterOfInterest;
        AI.StopTargetingEnemy(EGothicFocusPriority::CombatMove);
        AI.StopFollowingActor();
    }

    UFUNCTION()
    bool ShouldKeepMovingToSelectedGoblin() const
    {
        auto Troll = Cast<ATroll>(Combat.AI.Character);
        if (!IsValid(Troll))
            return false;

        if (!IsValid(Troll.m_SelectedProjectileCharacter))
            return false;
        
        if (Troll.m_SelectedProjectileCharacter.HasGameplayTag(GameplayTag::State_Dead))
            return false;

        if (!Combat.IsDoingMoveOfClass(UCM_Attack_TrollAdult_GrabAndThrowGoblin))
            return false;

        return true;
    }
}

UCLASS()
class UCM_Attack_TrollAdult_GrabAndThrowGoblin : UCM_Attack_Extra01
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);

    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return true;

        auto FoundActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Combat.CharacterState.CharacterLocation, 4000.0f);

        bool bFoundLivingGoblin = false;
        for (auto OtherActor : FoundActors)
        {
            auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);

            if (!IsValid(OtherCharacter))
                continue;

            if (!OtherCharacter.CharacterState.Species.MatchesTag(GameplayTag::Species_Creature_Goblin))
                continue;

            if (OtherCharacter.HasGameplayTag(GameplayTag::State_Dead))
                continue;

            bFoundLivingGoblin = true;
            break;
        }

        if (!bFoundLivingGoblin)
        {
            Reason = "No nearby living goblins to throw";
            return false;
        }

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        auto Troll = Cast<ATroll>(Combat.AI.Character);
        if (!IsValid(Troll))
        {
            EndTaskAsFailure();
            return;
        }

        AGothicCharacter NearestLivingGoblin = GetNearestLivingGoblin();

        auto GoblinToThrow = Cast<AGoblin>(NearestLivingGoblin);
        if (!IsValid(GoblinToThrow))
        {
            EndTaskAsFailure();
            return;
        }

        Troll.BindGoblin(GoblinToThrow);
        bCanWalkDuringCombatMove = true; // Let troll walk until in range of selected goblin

        FInGameTime WaitStartTime = FInGameTime::Now();
        FInGameTime LastNearestGoblinUpdate = FInGameTime::Now();
        while (IsValid(Troll.m_SelectedProjectileCharacter) && !Troll.m_SelectedProjectileCharacter.HasGameplayTag(GameplayTag::State_Dead) && Combat.CharacterState.GetDistanceTo(Troll.m_SelectedProjectileCharacter) > 300.0f)
        {
            WaitOneTick();

            if (WaitStartTime.GetAgeInRealtimeSeconds() > 10.0f)
                break;

            if (LastNearestGoblinUpdate.GetAgeInRealtimeSeconds() < 0.5f)
                continue;
            
            NearestLivingGoblin = GetNearestLivingGoblin();
            GoblinToThrow = Cast<AGoblin>(NearestLivingGoblin);
            Troll.BindGoblin(GoblinToThrow);

            if (!IsValid(Troll.m_SelectedProjectileCharacter))
                break;
        }
        bCanWalkDuringCombatMove = false;

        if (!IsValid(Troll.m_SelectedProjectileCharacter))
        {
            EndTaskAsFailure();
            return;
        }
        
        if (Troll.m_SelectedProjectileCharacter.HasGameplayTag(GameplayTag::State_Dead))
        {
            EndTaskAsFailure();
            return;
        }
        
        if (Combat.CharacterState.GetDistanceTo(Troll.m_SelectedProjectileCharacter) > 300.0f)
        {
            EndTaskAsFailure();
            return;
        }

        Super::DoTask();
    }

    void OnMoveEnded() override
    {
        auto Troll = Cast<ATroll>(Combat.AI.Character);
        Troll.ReleaseBindedGoblin();
        Super::OnMoveEnded(); 
    }

    AGothicCharacter GetNearestLivingGoblin() const
    {
        auto FoundActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), Combat.CharacterState.CharacterLocation, 4000.0f);

        float SmallestDistance = MAX_flt;
        AGothicCharacter NearestLivingGoblin;
        for (auto OtherActor : FoundActors)
        {
            auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);

            if (!IsValid(OtherCharacter))
                continue;

            if (!OtherCharacter.CharacterState.Species.MatchesTag(GameplayTag::Species_Creature_Goblin))
                continue;

            if (OtherCharacter.HasGameplayTag(GameplayTag::State_Dead))
                continue;

            float Distance = Combat.CharacterState.GetDistanceTo(OtherCharacter);
            if (Distance > SmallestDistance)
                continue;

            SmallestDistance = Distance;
            NearestLivingGoblin = OtherCharacter;
        }

        return NearestLivingGoblin;
    }

    bool ShouldInvalidateAttack() override
    {
        // auto Troll = Cast<ATroll>(Combat.AI.Character);
        // if (!IsValid(Troll))
        //     return true;

        // if (Troll.m_SelectedProjectileCharacter == nullptr)
        //     return true;

        return Super::ShouldInvalidateAttack();
    }
}

UCLASS()
class UCM_Attack_TrollAdult_Right : UCM_Attack_Right
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);
}

UCLASS()
class UCM_Attack_TrollAdult_Left : UCM_Attack_Left
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);
}

UCLASS()
class UCM_Attack_TrollAdult_Bottom : UCM_Attack_Bottom
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);
}

UCLASS()
class UCM_Attack_TrollAdult_Top : UCM_Attack_Bottom
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);
}

UCLASS()
class UCM_Attack_TrollAdult_SCombo_RightLeft : UCM_AttackSCombo_RightLeft
{
    default CancelIfCharacterGainsAnyOf.AddTag(GameplayTag::Debuff_Shrink);
}