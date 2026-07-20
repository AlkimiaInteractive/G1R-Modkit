
UCLASS()
class UGenericMeleeFeedback : UFeedbackData
{
    // Camera shakes when causing damage
	default AddCameraShake(GameplayTag::Action_Smash_MeatBug, UMatineeCameraShake_SmashMeatBug::StaticClass()); //Used directly on UGA_Human_SmashMeatBug.
	default AddCameraShake(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_Combat_Additive::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_Combat_Standard::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_Combat_Standard::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_Combat_Parried::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_Combat_Deflected::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_None::StaticClass());

	// Camera shakes when receiving damage
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_Combat_Additive::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_Combat_Standard::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_Combat_Standard::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_Combat_Parried::StaticClass());
	// default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_Combat_Deflected::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_None::StaticClass()); //Set to none to avoid it when deflecting against walls
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_None::StaticClass());

	// Frame freeze when causing damage
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Additive, 0.0, 0.033, 0.033); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Standard, 0.0, 0.05, 0.05); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Knockback, 0.0, 0.05, 0.033);
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Parried, 0.0, 0.05, 0.05);
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Deflected, 0.5, 0.033, 0.033);
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Dot, 1.0, 0.033, 0.033);

	// Frame freeze when when receiving damage
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Additive, 0.0, 0.033, 0.033);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Standard, 0.0, 0.05, 0.05);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Knockback, 0.0, 0.05, 0.05);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Parried, 0.0, 0.05, 0.05);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Deflected, 0.5, 0.033, 0.033);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Dot, 1.0, 0.033, 0.033);

	// Rumble when causing damage
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Action_Smash_MeatBug) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Rumble/BP_FFEA_SmashMeatBug.BP_FFEA_SmashMeatBug'"; //Used directly on UGA_Human_SmashMeatBug.
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Additive) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Additive.BP_FFEA_S1H_Additive'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Standard) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Standard.BP_FFEA_S1H_Standard'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Knockback) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Knockback.BP_FFEA_S1H_Knockback'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Parried) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Parried.BP_FFEA_S1H_Parried'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Deflected) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Dot) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";

	// Rumble when receiving damage
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Additive) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Hit_Additive.BP_FFEA_S1H_Hit_Additive'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Standard) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Hit_Standard.BP_FFEA_S1H_Hit_Standard'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Knockback) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Hit_Knockback.BP_FFEA_S1H_Hit_Knockback'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Parried) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Hit_Parried.BP_FFEA_S1H_Hit_Parried'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Deflected) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Dot) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
}

UCLASS()
class UGenericRangedFeedback : UFeedbackData
{
    // Camera shakes when causing damage
	default AddCameraShake(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_None::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_None::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_None::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_None::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_None::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_None::StaticClass());

	// Camera shakes when receiving damage
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_None::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_Combat_Standard::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_Combat_Standard::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_None::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_None::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_None::StaticClass());

	// Frame freeze when causing damage
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Additive, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Standard, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Knockback, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Parried, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Deflected, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Dot, 1.0, 0.0 /*0.033*/, 0.066); 

	// Frame freeze when when receiving damage
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Additive, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Standard, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Knockback,1.0, 0.0 /*0.033*/, 0.066); 
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Parried, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Deflected, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Dot,1.0, 0.0 /*0.033*/, 0.066); 

	// Rumble when causing damage
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Additive) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Standard) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Knockback) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Parried) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Deflected) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_AttackRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Dot) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";

	// Rumble when receiving damage
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Additive) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Standard) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Knockback) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Parried) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Deflected) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Dot) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_NoRumble.BP_FFEA_S1H_NoRumble'";
}