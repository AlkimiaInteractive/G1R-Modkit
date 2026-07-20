class UGA_Mud_Sleeper_Teleport_ToEnd : UGA_Scripted_Teleport
{
    default m_SaveGameKey = n"Mud_Sleeper_Teleport_ToEnd_Completed";

    default m_TeleportWayPointActorName = n"FP_SD_MUD_SLEEPER_END";
    
    default TriggerBeginOn(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToEnd);
    
    void OnActivatedSavegameCompleted() override
    {
        Super::OnActivatedSavegameCompleted();
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Mud_Sleeper_Teleport_ToEnd::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
    }
    
    UCreatureTeleportComponent CreateTeleportComponent(AActor Avatar) override
    {
        return UMud_Sleeper_TeleportComponent::GetOrCreate(Avatar);
    }

    FGameplayAbilitySpec GetTeleportAbilitySpec() override
    {
        return FGameplayAbilitySpec(UGA_Mud_Sleeper_PlayMontage::StaticClass());
    }

    void OnDisappearCompleted(FGameplayEventData GameplayEventData) override
    {
        FInteractionSpotHandle Spot(m_TeleportWayPointActorName);
        if(Spot.IsValid())
        {
            GetAvatarActorFromActorInfo().SetActorRotation(Spot.GetTransform().Rotator());
        }
        Super::OnDisappearCompleted(GameplayEventData);
    }
    
    void OnAppearCompleted(FGameplayEventData GameplayEventData) override
    {
        Super::OnAppearCompleted(GameplayEventData);

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Mud_Sleeper_Teleport_ToEnd::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto players = MagicScript::GetAllPlayersNearCurrentLocation(gothicChar.GetWorld(), gothicChar, 50000);
        if(players.IsEmpty())
            return;
        players.Shuffle();
        gothicChar.AI.StartAttackingImmediately(players[0]);
    }
}