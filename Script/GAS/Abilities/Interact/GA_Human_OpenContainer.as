class UGA_Human_OpenContainer : UGameplayAbilityOpenContainer
{
    default ActivationBlockedTags.AddTag(GameplayTag::State_Swimming);

    // Default montages.
    default m_InteractCharacterOpenAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_NH_Interact_OpenLockedChest_Montage.PT_NH_Interact_OpenLockedChest_Montage'";
    default m_InteractiveObjectOpenAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_LockedChest_AnimMontage.PT_LockedChest_AnimMontage'";
}

class UGA_Human_OpenContainer_Swimming : UGameplayAbilityOpenContainer
{
    default m_UnEquipBefore = false; // don't unequip fist as it might get stuck forever

    default ActivationRequiredTags.AddTag(GameplayTag::State_Swimming);

    // Default montages.
    default m_InteractCharacterOpenAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ChestWater/NH_Interact_OpenLockedChestWater_Montage.NH_Interact_OpenLockedChestWater_Montage'";
    default m_InteractiveObjectOpenAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/ChestWater/LockedChestWater_Montage.LockedChestWater_Montage'";
}