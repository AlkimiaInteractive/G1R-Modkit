class UGA_Human_Ride_Scavenger : UGameplayAbilityRide
{
    default ActivationOwnedTags.AddTag(GameplayTag::Debuff_Blocked_Sleep);
    
    default m_MountClass = USpawnAIAgentDefinition_ScavengerAdult_Rideable::StaticClass();
    
    //~~~~MOUNTING~~~~
    //Without torch
    default m_MountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Right_Montage.A_Man_Mount_ScavengerAdult_Right_Montage'";
    default m_MountMontages.FindOrAdd(ERiderLocation::LEFT)   = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Left_Montage.A_Man_Mount_ScavengerAdult_Left_Montage'";
    default m_MountMontages.FindOrAdd(ERiderLocation::BACK)   = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Back_Montage.A_Man_Mount_ScavengerAdult_Back_Montage'";

    //With torch
    default m_TorchMountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Right_Torch_Montage.A_Man_Mount_ScavengerAdult_Right_Torch_Montage'";
    default m_TorchMountMontages.FindOrAdd(ERiderLocation::LEFT)   = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Left_Torch_Montage.A_Man_Mount_ScavengerAdult_Left_Torch_Montage'";
    default m_TorchMountMontages.FindOrAdd(ERiderLocation::BACK)   = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Back_Torch_Montage.A_Man_Mount_ScavengerAdult_Back_Torch_Montage'";

    //With torch
    default m_SwimmingMountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Right_Swim_Montage.A_Man_Mount_ScavengerAdult_Right_Swim_Montage'";
    default m_SwimmingMountMontages.FindOrAdd(ERiderLocation::LEFT)   = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Mount_ScavengerAdult_Left_Swim_Montage.A_Man_Mount_ScavengerAdult_Left_Swim_Montage'";


    //~~~~DISMOUNTING~~~~
    //Without torch
    default m_DisMountMontages.FindOrAdd(ERiderLocation::LEFT) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_Left_Montage.A_Man_Dismount_ScavengerAdult_Left_Montage'";
    default m_DisMountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_Right_Montage.A_Man_Dismount_ScavengerAdult_Right_Montage'";

    //With torch
    default m_TorchDisMountMontages.FindOrAdd(ERiderLocation::LEFT) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_Left_Torch_Montage.A_Man_Dismount_ScavengerAdult_Left_Torch_Montage'";
    default m_TorchDisMountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_Right_Torch_Montage.A_Man_Dismount_ScavengerAdult_Right_Torch_Montage'";

    //Swimming
    default m_SwimmingDisMountMontages.FindOrAdd(ERiderLocation::LEFT) = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_SwimLeft_Montage.A_Man_Dismount_ScavengerAdult_SwimLeft_Montage'";
    default m_SwimmingDisMountMontages.FindOrAdd(ERiderLocation::RIGHT)  = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Mount/A_Man_Dismount_ScavengerAdult_SwimRight_Montage.A_Man_Dismount_ScavengerAdult_SwimRight_Montage'";
}

class UGE_CallMount_Cooldown : UGameplayEffectBase
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Action_CallMount);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 3.0f;
}

class UGA_Human_CallMount_Scavenger : UGameplayAbilityCallMount
{
    default CooldownGameplayEffectClass = UGE_CallMount_Cooldown;

    //default m_WhistleFXDefinition = UMountWhistleFX::StaticClass();
    default m_FollowDailyRoutine = UDailyRoutine_Scavenger_Rideable_Follow::StaticClass();
    default m_MountClass = USpawnAIAgentDefinition_ScavengerAdult_Rideable::StaticClass();
    default m_MountNavigationAreaFilter = UNavigationAreaFilter_Scavenger::StaticClass();

    default m_WhistleAnimMontage_LeftHand = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CallMount/A_Man_N_CallMount_L_Montage.A_Man_N_CallMount_L_Montage'";
    default m_WhistleAnimMontage_RightHand = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CallMount/A_Man_N_CallMount_R_Montage.A_Man_N_CallMount_R_Montage'";
    default m_WhistleAnimMontage_CrouchLeftHand = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CallMount/A_Man_N_CallMount_L_Crouch_Montage.A_Man_N_CallMount_L_Crouch_Montage'";
    default m_WhistleAnimMontage_CrouchRightHand = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CallMount/A_Man_N_CallMount_R_Crouch_Montage.A_Man_N_CallMount_R_Crouch_Montage'";
}