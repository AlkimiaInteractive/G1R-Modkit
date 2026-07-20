class UGA_ChangeArmorBath : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;
    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;

    UPROPERTY()
    TSubclassOf<UArmorDefinition> m_Armor = UArmor_SK_OC_WOC_Velaya_108_02::StaticClass();

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DelegateHandleContainer = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::Action_Ambient_Bath, EGameplayTagEventType::NewOrRemoved, this, n"OnBath");
        if(!Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).HasTagExact(GameplayTag::Action_Ambient_Bath))
        {
            auto inventory = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetInventory();
            if(inventory.HasEquippedItemOfClass(m_Armor))
                inventory.UnequipArmor();
        }
    }

    UFUNCTION()
    void OnBath(const FGameplayTag CallbackTag, int32 NewCount)
    {
        auto inventory = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetInventory();
        if(NewCount > 0)
        {
            inventory.EquipArmorOfClass(m_Armor);
            return;
        }
        inventory.UnequipArmor();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_DelegateHandleContainer);
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetInventory().UnequipArmor();
    }

}