class UGA_Xardas_Sleeper_FightManager : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Effect_Debuff_Electrified);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Effect_Debuff_Electrified);

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	TSubclassOf<UGameplayEffect> m_InvulnerableGE = UGE_State_Invulnerable_XardasSleeper::StaticClass();
    UPROPERTY()
    FActiveGameplayEffectHandle m_InvulnerableGEHandle;

    //default TriggerBeginOn(GameplayTag::Event_XardasSleeper_StartFight);

    UPROPERTY()
    UXardasSleeperTeleportComponent m_TeleportComponent;

    UPROPERTY()
    UDelegateHandleContainer m_OnMinionSpotCompletedHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnCentralSpotCompletedHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnHealThresholdReachedHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnDoTeleportToMinionSpotHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnDoTeleportToCenterSpotHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnDoTeleportToVisibilityMinionSpotHandle;
    UPROPERTY()
    UDelegateHandleContainer m_OnStartFightHandleHandle;
        UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Falling);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Falling);

    UPROPERTY()
    int m_DialogTagIndex = 0;
    UPROPERTY()
    FGameplayTag m_CurrentDialogTag = FGameplayTag::Empty;
    UPROPERTY()
    bool m_CanApplyKnockback = false;

    UPROPERTY()
    TArray<FGameplayTag> m_DialogTags;

    default m_DialogTags.Add(GameplayTag::Debuff_Stunned_Xardas_1);
    default m_DialogTags.Add(GameplayTag::Debuff_Stunned_Xardas_2);
    default m_DialogTags.Add(GameplayTag::Debuff_Stunned_Xardas_3);

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_OnMinionSpotCompletedHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_OnMinionSpotCompleted, this, n"OnMinionSpotCompleted");
        m_OnCentralSpotCompletedHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_OnCentralSpotCompleted, this, n"OnCentralSpotCompleted");
        m_OnHealThresholdReachedHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_OnHealThresholdReached, this, n"OnHealThresholdReached");

        m_OnDoTeleportToMinionSpotHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_DoTeleportTo_MinionSpot, this, n"OnDoTeleportToMinionSpot");
        m_OnDoTeleportToCenterSpotHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_DoTeleportTo_CenterSpot, this, n"OnDoTeleportToCenterSpot");
        m_OnDoTeleportToVisibilityMinionSpotHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_DoTeleportTo_VisibilityMinionSpot, this, n"OnDoTeleportToVisibilityMinionSpot");

        //m_OnStartFightHandleHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_XardasSleeper_StartFight, this, n"OnStartFightHandle");

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
        //StartFly();

        abComp.AddTag(GameplayTag::State_XardasSleeper_InitialTeleport);

        abComp.AddTag(GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot);

        m_DialogTagIndex = 0;

        //auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        //auto playerState = Cast<AGothicCharacterState>(PlayerCharacter.PlayerState);
        //.HasListenedTo(LocText("TEXT_WIP_UPLRCKI_20250107_160503"))

        // HasListened(playerState, FString("TEXT_WIP_LKQRRTG_20250220_092059_3436"));
        // HasListened(playerState, FString("TEXT_WIP_LKQRRTG_20250220_104720"));
        // HasListened(playerState, FString("TEXT_WIP_LKQRRTG_20250220_104724"));
        // HasListened(playerState, FString("TEXT_WIP_JJFVYDC_20250317_132859"));
    }

    // void HasListened(AGothicCharacterState PlayerState, FString Text)
    // {
    //     if(PlayerState.HasListenedTo(LocText(Text)))
    //     {
    //         FString textToPrint = "HAS LISTENED";
    //         textToPrint.Append(Text);
    //         Print(textToPrint, 50.f, FLinearColor::Green);
    //     }
    //     else
    //     {
    //         FString textToPrint = "HAS NOT LISTENED";
    //         textToPrint.Append(Text);
    //         Print(textToPrint, 50.f, FLinearColor::Red);
    //     }
    // }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnMinionSpotCompletedHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnCentralSpotCompletedHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnHealThresholdReachedHandle);

        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDoTeleportToMinionSpotHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDoTeleportToCenterSpotHandle);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDoTeleportToVisibilityMinionSpotHandle);
        EndAbility();
    }

    // UFUNCTION()
    // void OnStartFightHandle(FGameplayEventData GameplayEventData)
    // {
    //     //MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnStartFightHandleHandle);
    //     auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
    //     abComp.AddTag(GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot);
    // }

    UFUNCTION()
    void OnDoTeleportToMinionSpot(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.RemoveTag(GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot);
        if(HasAnyTeleportTag(FString("OnDoTeleportToMinionSpot")))
            return;


        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::End_Action_XardasSleeper_Stunned, FGameplayEventData());
        DoTeleportToMinionSpot();
        SetFlyingState();
    }

    UFUNCTION()
    void OnDoTeleportToCenterSpot(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.RemoveTag(GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot);        
        if(HasAnyTeleportTag(FString("OnDoTeleportToCenterSpot")))
            return;
        DoTeleportToCenter();
    }

    UFUNCTION()
    void OnDoTeleportToVisibilityMinionSpot(FGameplayEventData GameplayEventData)
    {
        //Print(FString("OnDoTeleportToVisibilityMinionSpot"));
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.RemoveTag(GameplayTag::State_XardasSleeper_CanTeleportTo_VisibilityMinionSpot);
        if(HasAnyTeleportTag(FString("OnDoTeleportToVisibilityMinionSpot")))
            return;
        DoTeleportToVisibilityMinionSpot();
    }

    bool HasAnyTeleportTag(FString Text)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot))
        {
            FString error = FString("Calling ").Append(Text).Append(FString(" While doing")).Append(GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot.ToString());
            //Print(error, 20.f, FLinearColor::Red);
            return true;
        }

        if(abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot))
        {
            FString error = FString("Calling ").Append(Text).Append(FString(" While doing")).Append(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot.ToString());
            //Print(error, 20.f, FLinearColor::Red);
            return true;
        }

        if(abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility))
        {
            FString error = FString("Calling ").Append(Text).Append(FString(" While doing")).Append(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility.ToString());
            //Print(error, 20.f, FLinearColor::Red);
            return true;
        }
        return false;
    }

    void DoTeleportToVisibilityMinionSpot()
    {    
        auto selectedSpot = SelectVisilitiyMinionTeleportSpot();
        if(selectedSpot != nullptr)
        {
            auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
            abComp.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility);
            DoTeleport(selectedSpot);
        }    
    }

    void StartStunned()
    {
        RemoveInvulnerableGE();
        SetStunnedState();
        GiveStunnedAbility();
    }

    void GiveStunnedAbility()
    {
        FGameplayEventData gameplay_event;

        FGameplayAbilitySpec ability_spec = FGameplayAbilitySpec(UGA_Stunned_XardasSleeper::StaticClass());
        MagicScript::GivePlayRemove(GetAbilitySystemComponentFromActorInfo(), ability_spec, gameplay_event);
    }

    void SetStunnedState()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.RemoveTag(GameplayTag::State_Flying);
        abComp.RemoveTag(GameplayTag::State_XardasSleeper_OnMinionSpot);

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        UGothicMovementComponent movementComp = gothicChar.GetGothicMovementComponent();
        movementComp.SetMovementMode(MagicScript::GetGroundMovementMode(gothicChar));

        abComp.AddTag(GameplayTag::State_Stunned);

        //@DE - Debuff stunned for dialogs
        m_CurrentDialogTag = m_DialogTags[m_DialogTagIndex];
        abComp.AddTag(m_CurrentDialogTag);
        if(m_DialogTagIndex < m_DialogTags.Num() - 1)
            m_DialogTagIndex++;

        abComp.AddTag(GameplayTag::State_XardasSleeper_OnCentralSpot);
        //abComp.AddTag(GameplayTag::State_BlockState);  
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_Deactivate);

        m_CanApplyKnockback = true;
    }

    void SetFlyingState()
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.RemoveTag(GameplayTag::State_Stunned);

        if(m_CurrentDialogTag != FGameplayTag::Empty)
            abComp.RemoveTag(m_CurrentDialogTag);

        abComp.RemoveTag(GameplayTag::State_XardasSleeper_OnCentralSpot);
        UGothicMovementComponent movementComp = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetGothicMovementComponent();
        movementComp.SetMovementMode(EMovementMode::MOVE_Flying);

        abComp.AddTag(GameplayTag::State_Flying);
        abComp.AddTag(GameplayTag::State_XardasSleeper_OnMinionSpot);
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_Activate);

        if(m_CanApplyKnockback)
            DoKnockbackHitOnArea();
    }

    void DoTeleportToMinionSpot()
    {
        auto selectedSpot = SelectTeleportSpot(GameplayTag::Teleport_XardasSleeper_ToMinionSpot);
        if(selectedSpot != nullptr)
        {
            auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
            abComp.RemoveTag(GameplayTag::State_XardasSleeper_CantDoTarget); 
            DoTeleport(selectedSpot);
        }
        else
            NoMinionSpotAvailable();
    }

    void NoMinionSpotAvailable()
    {
        //Print("No minion spot available");
        RemoveInvulnerableGE();
    }

    void DoTeleportToCenter()
    {
        auto selectedSpot = SelectTeleportSpot(GameplayTag::Teleport_XardasSleeper_ToCentralSpot);
        if(selectedSpot != nullptr)
        {
            auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
            abComp.AddTag(GameplayTag::State_XardasSleeper_CantDoTarget);
            DoTeleport(selectedSpot);
        }            
        else
            NoCenterTeleportAvailable();
        //Do something to allow killme
    }

    void NoCenterTeleportAvailable()
    {
        //Print("No center spot available");
        RemoveInvulnerableGE();
    }

    void DoTeleport(AXardasSleeperTeleportSpotVisual TeleportSpot)
    {
        FGameplayEventData Payload;
        Payload.Target = TeleportSpot;
        Payload.OptionalObject = m_TeleportComponent;
        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Ability_Action_Teleport_XardasSleeper, Payload);
    }

    void ApplyInvulnerableGE()
    {
        FGameplayEventData Payload;
        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Event_XardasSleeper_OnBecomeInvulnerable, Payload);
    }

    void RemoveInvulnerableGE()
    {
        FGameplayEventData Payload;
        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Event_XardasSleeper_OnBecomeVulnerable, Payload);
    }

    AXardasSleeperTeleportSpotVisual SelectTeleportSpot(FGameplayTag SpotTag)
    {
        auto teleportSpot = GetTeleportComponent().GetTeleportSpot(SpotTag);
        return Cast<AXardasSleeperTeleportSpotVisual>(teleportSpot);
    }

    AXardasSleeperTeleportSpotVisual SelectVisilitiyMinionTeleportSpot()
    {
        auto teleportSpot = GetTeleportComponent().GetMinionVisibilityTeleportSpot();
        return Cast<AXardasSleeperTeleportSpotVisual>(teleportSpot);
    }

    UXardasSleeperTeleportComponent GetTeleportComponent()
    {
        if(m_TeleportComponent == nullptr)
            m_TeleportComponent = Cast<UXardasSleeperTeleportComponent>(UXardasSleeperTeleportComponent::GetOrCreate(GetAvatarActorFromActorInfo()));
        return m_TeleportComponent;
    } 


    UFUNCTION()
    void OnMinionSpotCompleted(FGameplayEventData GameplayEventData)
    {
        //Move to the center an wait become vulnerable
        //DoTeleportToCenter();
        //Set stateTo teleport to center spot. and wait event
        //Send interrupt 
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Action_Interrupt_Attack);
        //Add interrupt anim? Use code below
        //auto payLoad = FGameplayEventData();
        //payLoad.EventTag = GameplayTag::Action_Interrupt_Attack;
        //Combat.Self.AbilitySystemComponent.SendGameplayEvent(GameplayTag::Action_Interrupt_Attack, payLoad);
        abComp.AddTag(GameplayTag::State_XardasSleeper_CanTeleportTo_CentralSpot);
    }

    UFUNCTION()
    void OnCentralSpotCompleted(FGameplayEventData GameplayEventData)
    {
        //remove invulnerable GE and wait for BecomeInvulnerable
        //Apply stunned GE?
        StartStunned();
    }

    UFUNCTION()
    void OnHealThresholdReached(FGameplayEventData GameplayEventData)
    {
        //StartFly();
        //Set stateTo teleport to minion spot. and wait event

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        //@DE - Due stunned ability add block state to avoid AI turns, here I remove State_BlockState to allow AI do teleport and finish Stunned ability
        abComp.RemoveTag(GameplayTag::State_BlockState);
        
        ApplyInvulnerableGE();
        abComp.AddTag(GameplayTag::State_XardasSleeper_CanTeleportTo_MinionSpot);
    }

    void DoKnockbackHitOnArea()
    {
        auto characters = GetCharactersInsideExpandedSafeZone();
        for(auto character : characters)
        {
            ApplyKnockback(character);
        }
    }

    void ApplyKnockback(AGothicCharacter character)
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        auto targetAbComp = Cast<UGothicAbilitySystemComponent>(character.GetAbilitySystemComponent());

        if(sourceAbComp == nullptr || targetAbComp == nullptr)
        {
            return;
        }

        //@DE - First: set a GE to allow get a knockback (ignore superarmor value)
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(UGE_XardasSleeperCombat_ForceKnockback::StaticClass(), 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);

        FGameplayEventData payload;

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Knockback;
        hit_data.CustomKnockbackData = UKnockbackDataXardasSleeper::StaticClass();
        
        // hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
        // targetAbComp.GetAvatar().GetActorForwardVector(), 
        // targetAbComp.GetAvatar().GetActorRightVector(), 
        //     -sourceAbComp.GetAvatar().GetActorForwardVector());

        hit_data.SourceDirection = GameplayTag::Combat_Direction_Front;
        
        GothicGAS::InitializeHitData(payload, hit_data);
        //@DE - Second: force knockback.
        GothicGAS::SendGameplayEvent(character, GameplayTag::Event_Hit_BreakArmorHit, payload);
    }

    TArray<AGothicCharacter> GetCharactersInsideExpandedSafeZone()
    {
        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), GetAvatarActorFromActorInfo().GetActorLocation(), 200);
        TArray<AGothicCharacter> GothicCharacters;

        for (auto Actor : Actors)
        {
            auto GothicCharacter = Cast<AGothicCharacter>(Actor);
            if (GothicCharacter == nullptr)
                continue;
            if (GothicCharacter == GetAvatarActorFromActorInfo())
                continue;

            GothicCharacters.Add(GothicCharacter);
        }

        return GothicCharacters;
    }
    

}

class UKnockbackDataXardasSleeper : UKnockbackDataGeneric
{
    default m_KnockbackFloorRange = 0.5f;
    default m_KnockbackTopRange = 1.f;
    default m_RootMotionMultiplierKnockback = 2.5f;
}

class UGE_XardasSleeperCombat_ForceKnockback : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 3; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
}