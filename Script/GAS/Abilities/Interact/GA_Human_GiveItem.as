class UGA_Human_GiveItem : UGameplayAbilityGiveItemToCharacter
{
    default ActivationBlockedTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_GiveItem);
    default GiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/GiveItem/A_Man_Give_Montage.A_Man_Give_Montage'";
}

class UGA_Human_GiveItemLookAt : UGameplayAbilityGiveItemToCharacter
{
    default ActivationBlockedTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_GiveItemLookAt);
    default ReceiveActionTag = GameplayTag::Action_ReceiveItemLookAt;
    default GiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/GiveItem/A_Man_Give_Montage.A_Man_Give_Montage'";
}

class UGA_Human_ReceiveItem : UGameplayAbilityReceiveItemFromCharacter
{
    default ActivationBlockedTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_ReceiveItem);
    default ReceiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/GiveItem/A_Man_Take_Montage.A_Man_Take_Montage'";
}

class UGA_Human_ReceiveAndLookAtItem : UGameplayAbilityReceiveItemFromCharacter
{
    default ActivationBlockedTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_ReceiveItemLookAt);
    default ReceiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/GiveItem/A_Man_TakeItem_LookAt_Montage.A_Man_TakeItem_LookAt_Montage'";

    default ReceiveItemMontagePerItemLookAtType.FindOrAdd(GameplayTag::Item_Property_LookAt_QuestItem) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Inspect_FocusStone_02_Montage.Man_Dialog_Inspect_FocusStone_02_Montage'";
}

class UGA_Human_GiveItem_Seated : UGameplayAbilityGiveItemToCharacter
{
    default ActivationRequiredTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_GiveItem);
    default GiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Sit_Give_Montage.Man_Dialog_Sit_Give_Montage'";
}

class UGA_Human_ReceiveItem_Seated : UGameplayAbilityReceiveItemFromCharacter
{
    default ActivationRequiredTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_ReceiveItem);
    default ReceiveItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Sit_Take_Montage1.Man_Dialog_Sit_Take_Montage1'";
}

class UGA_Human_ReceiveAndLookAtItem_Seated : UGameplayAbilityReceiveItemFromCharacter
{
    default ActivationRequiredTags.AddTag(GameplayTag::Action_Interact_Sit); 
    default TriggerBeginOn(GameplayTag::Action_ReceiveItemLookAt);
    default ReceiveItemMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Dialog/IdlePose/Actions/Take/Man_Conversation_Sit_Take_LookAt_Save_Montage.Man_Conversation_Sit_Take_LookAt_Save_Montage'";
}
