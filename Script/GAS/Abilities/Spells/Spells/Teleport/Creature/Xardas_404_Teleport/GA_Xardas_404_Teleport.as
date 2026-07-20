class UGA_Xardas_404_Teleport : UGA_Scripted_Teleport
{
    default m_SaveGameKey = n"Xardas_404_Teleport_Completed";

    default m_TeleportWayPointActorName = n"WP_OW_TP_XARDASTOWER_BEDROOM";
    
    default TriggerBeginOn(GameplayTag::Event_Teleport_Scripted_Xardas_End);

    void OnActivatedSavegameCompleted() override
    {
        Super::OnActivatedSavegameCompleted();
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Xardas_404_Teleport::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
    }
    
    UCreatureTeleportComponent CreateTeleportComponent(AActor Avatar) override
    {
        return UXardas_404_TeleportComponent::GetOrCreate(Avatar);
    }

    FGameplayAbilitySpec GetTeleportAbilitySpec() override
    {
        return FGameplayAbilitySpec(UGA_Teleport_Xardas_404_PlayMontage::StaticClass());
    }
    
    void OnAppearCompleted(FGameplayEventData GameplayEventData) override
    {
        Super::OnAppearCompleted(GameplayEventData);

        Cast<AGothicCharacter>(AvatarActorFromActorInfo).AI.ExchangeDailyRoutine(UDailyRoutine_XT_DMB_Xardas_404_Bedroom::StaticClass());

        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_Xardas_404_Teleport::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
    }

}