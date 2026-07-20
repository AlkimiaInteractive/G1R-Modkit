
class UGA_SwapCombatModes_Harpy : UGameplayAbilityManageTagUpdate
{
    default m_LookForTags.Add(GameplayTag::State_Flying);

    UAbilityTask_SwapWeaponFromInventoryToAnother SwapCombatWeapon;

    UPROPERTY()
    AGothicCharacter m_Character;
    
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(const FGameplayAbilityActorInfo& GAActorInfo, const FGameplayEventData& TriggerEventData)
    {
        m_Character = Cast<AGothicCharacter>(GAActorInfo.AvatarActor);
    }

    UFUNCTION(BlueprintOverride)
    void OnTagUpdate_Scriptable(const FGameplayTag InTag, int32 NewCount)
    {
        if(InTag == GameplayTag::State_Flying)
        {
            if(SwapCombatWeapon != nullptr)
            {
                SwapCombatWeapon.EndTask();
                SwapCombatWeapon = nullptr;
            }

            if(NewCount == 0)
            {
                SwapCombatWeapon = UAbilityTask_SwapWeaponFromInventoryToAnother::TaskEquipItem(this, FGameplayTag::RequestGameplayTag(FName("Item.Weapon.Claw.Grounded")));
                SwapCombatWeapon.ReadyForActivation();
            }
            else if (NewCount > 0)
            {
                SwapCombatWeapon = UAbilityTask_SwapWeaponFromInventoryToAnother::TaskEquipItem(this, FGameplayTag::RequestGameplayTag(FName("Item.Weapon.Claw.Flying")));
                SwapCombatWeapon.ReadyForActivation(); 
            }
        }
    }
}