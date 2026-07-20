UCLASS()
class UHellArmsFeedback : UFeedbackData
{
    // Camera shakes when causing damage
	default AddCameraShake(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default AddCameraShake(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_Combat_HellArms::StaticClass());

    // Camera shakes when receiving damage
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Additive, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Standard, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Knockback, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Parried, UMatineeCameraShake_Combat_HellArms::StaticClass());
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Deflected, UMatineeCameraShake_Combat_HellArms::StaticClass()); //Set to none to avoid it when deflecting against walls
	default m_HitCameraShakeParams.Add(GameplayTag::Combat_HitType_Dot, UMatineeCameraShake_Combat_HellArms::StaticClass()); 

    // Frame freeze when causing damage
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Additive, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Standard, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Knockback, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Parried, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Deflected, 1.0, 0.0 /*0.033*/, 0.066); 
	default AddAttackFreezeFrame(GameplayTag::Combat_HitType_Dot, 1.0, 0.0 /*0.033*/, 0.066); 
    // Frame freeze when when receiving damage

	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Additive, 0.0, 0.01, 0.01);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Standard, 0.0, 0.01, 0.01);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Knockback, 0.0, 0.01, 0.01);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Parried, 0.0, 0.01, 0.01);
	default AddHitFreezeFrame(GameplayTag::Combat_HitType_Deflected, 0.0, 0.01, 0.01);

	// Rumble when receiving damage
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Additive) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Standard) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Knockback) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Parried) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Deflected) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
	default m_HitRumbleParams.FindOrAdd(GameplayTag::Combat_HitType_Dot) = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Rumble/BP_FFEA_S1H_Light.BP_FFEA_S1H_Light'";
}