UCLASS()
class UHitData_Scavenger_Adult_Rideable : UHitData_Scavenger_Adult
{
    FGameplayTagContainer metadata_additive_mounted_R;
    default metadata_additive_mounted_R.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_mounted_R.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_additive_mounted_R.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_mounted_R.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_additive_mounted_R, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Scavenger_Adult_Ride_AdditiveHit_R_Montage.A_Scavenger_Adult_Ride_AdditiveHit_R_Montage'");

FGameplayTagContainer metadata_additive_mounted_L;
    default metadata_additive_mounted_L.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_mounted_L.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_additive_mounted_L.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_mounted_L.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_additive_mounted_L, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Scavenger_Adult_Ride_AdditiveHit_L_Montage.A_Scavenger_Adult_Ride_AdditiveHit_L_Montage'");

FGameplayTagContainer metadata_additive_mounted_F;
    default metadata_additive_mounted_F.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_mounted_F.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_additive_mounted_F.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_mounted_F.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_additive_mounted_F, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Scavenger_Adult_Ride_AdditiveHit_F_Montage.A_Scavenger_Adult_Ride_AdditiveHit_F_Montage'");

FGameplayTagContainer metadata_additive_mounted_B;
    default metadata_additive_mounted_B.AddTag(GameplayTag::Combat_HitType_Additive);
    default metadata_additive_mounted_B.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_additive_mounted_B.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_additive_mounted_B.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_additive_mounted_B, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/AdditiveHits/A_Scavenger_Adult_Ride_AdditiveHit_B_Montage.A_Scavenger_Adult_Ride_AdditiveHit_B_Montage'");


////// STANDARD - Break armor
    FGameplayTagContainer metadata_hit_standard_idle_front_mounted;
    default metadata_hit_standard_idle_front_mounted.AddTag(GameplayTag::Combat_Direction_Front);
    default metadata_hit_standard_idle_front_mounted.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_front_mounted.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_front_mounted.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_hit_standard_idle_front_mounted.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_hit_standard_idle_front_mounted, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Scavenger_Adult_Ride_Hit_Knockback_F_Montage.A_Scavenger_Adult_Ride_Hit_Knockback_F_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_left_mounted;
    default metadata_hit_standard_idle_left_mounted.AddTag(GameplayTag::Combat_Direction_Left);
    default metadata_hit_standard_idle_left_mounted.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_left_mounted.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_left_mounted.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_hit_standard_idle_left_mounted.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_hit_standard_idle_left_mounted, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Scavenger_Adult_Ride_Hit_Knockback_L_Montage.A_Scavenger_Adult_Ride_Hit_Knockback_L_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_back_mounted;
    default metadata_hit_standard_idle_back_mounted.AddTag(GameplayTag::Combat_Direction_Back);
    default metadata_hit_standard_idle_back_mounted.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_back_mounted.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_back_mounted.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_hit_standard_idle_back_mounted.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_hit_standard_idle_back_mounted, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Scavenger_Adult_Ride_Hit_Knockback_B_Montage.A_Scavenger_Adult_Ride_Hit_Knockback_B_Montage'");

    FGameplayTagContainer metadata_hit_standard_idle_right_mounted;
    default metadata_hit_standard_idle_right_mounted.AddTag(GameplayTag::Combat_Direction_Right);
    default metadata_hit_standard_idle_right_mounted.AddTag(GameplayTag::Combat_Pose_Idle);
    default metadata_hit_standard_idle_right_mounted.AddTag(GameplayTag::Combat_HitType_Standard);
    default metadata_hit_standard_idle_right_mounted.AddTag(GameplayTag::Combat_BlockState_Idle);
    default metadata_hit_standard_idle_right_mounted.AddTag(GameplayTag::State_Mounted);
    default AddHit( metadata_hit_standard_idle_right_mounted, n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ride/Scavenger_Adult/Hits/Knockbacks/A_Scavenger_Adult_Ride_Hit_Knockback_R_Montage.A_Scavenger_Adult_Ride_Hit_Knockback_R_Montage'");
    //////

}