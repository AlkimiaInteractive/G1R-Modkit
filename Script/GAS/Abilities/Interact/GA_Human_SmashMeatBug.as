UCLASS()
class UStompWeaponDefinition : UWeaponDefinition
{
    //default m_Name = "Stomp";
    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1000.0f);
}

class UGA_Human_SmashMeatBug : UGameplayAbilitySmashMeatBug
{
    UPROPERTY()
    TSoftObjectPtr<UForceFeedbackEffect> m_AttackRumbleParam = n"ForceFeedbackEffect'/Game/AnimLibrary/Humanoid/Man/Items/NoWeapon/Rumble/BP_FFEA_SmashMeatBug.BP_FFEA_SmashMeatBug'";
    UPROPERTY()
    TSubclassOf<UCameraShakeBase> m_CameraShake = UMatineeCameraShake_SmashMeatBug::StaticClass();

    default m_Distance = 50.0f;
    default m_DistanceToReposition = 70.0f;
    FHitResult Hit;
    FGameplayEffectContext_HitResponse HitData;
    AActor Instigator;

    UFUNCTION(BlueprintOverride)
    void SmashMeatBug_Scriptable()
    {
        HitData.Impact = GameplayTag::Combat_HitType_Standard;
        HitData.WeaponUsed = UStompWeaponDefinition::StaticClass();
        Hit.TraceStart = m_InteractiveActor.Get().GetActorLocation();
        UGothicAbilitySystemComponent Target = GothicGAS::GetAbilitySystemComponent(m_InteractiveActor.Get());
        Instigator = GetAvatarActorFromActorInfo();
        GothicGAS::ApplyDamageTo(
            GothicGAS::GetAbilitySystemComponent(Instigator), 
            Instigator, 
            nullptr, 
            Target, 
            HitData, 
            Hit);
        
        DoShake();
    }

    UFUNCTION()
    void DoShake()
    {
	    if (!ActorInfo.IsLocallyControlledPlayer())
		    return;

        APlayerController Controller = ActorInfo.PlayerController;
        if (!IsValid(Controller))
            return;

        Controller.ClientPlayForceFeedback(m_AttackRumbleParam.Get(), FName("MeatBug"), false, false, false);
        Controller.ClientStartCameraShake(m_CameraShake);
    }
}