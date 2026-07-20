class UGA_Mud_Sleeper_Teleport_ToSecondPlace : UGA_Scripted_Teleport
{
    default m_SaveGameKey = n"Mud_Sleeper_Teleport_ToSecondPlace_Completed";

    default m_TeleportWayPointActorName = n"FP_SD_WAIT_MUD_2ND_GUIDE";
    
    default TriggerBeginOn(GameplayTag::Event_Teleport_Scripted_MudSleeper_ToGuide);

    void OnActivatedSavegameCompleted() override
    {
        Super::OnActivatedSavegameCompleted();
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Mud_Sleeper_Teleport_ToSecondPlace::StaticClass(), outSpec);
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
    
    void OnAppearCompleted(FGameplayEventData GameplayEventData) override
    {
        Super::OnAppearCompleted(GameplayEventData);

        Cast<AGothicCharacter>(AvatarActorFromActorInfo).AI.ExchangeDailyRoutine(UDailyRoutine_ST_VLK_Mud_Sleeper_Guide02::StaticClass());

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Mud_Sleeper_Teleport_ToSecondPlace::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
    }
}