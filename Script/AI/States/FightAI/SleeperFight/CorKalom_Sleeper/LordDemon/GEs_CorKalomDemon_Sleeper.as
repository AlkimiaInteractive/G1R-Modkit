UCLASS()
class UGE_CorKalomDemon_Sleeper_AI : UGE_Demon_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Heal_OnlyWasteMana);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Lava_Invulnerable);
    
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default RemoveAbility(UGA_Falling::StaticClass());
    default AddAbility(UGA_Summon_CorKalomDemon::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    default RemoveAbility(UGA_Death_NoDeathEffect::StaticClass());
    default AddAbility(UGA_Death_NoDeathEffect_RotateToCenter::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
}

UCLASS()
class UGE_CorKalomDemon_Sleeper_Player : UGE_Demon_Player
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Heal_OnlyWasteMana);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);
    default RemoveAbility(UGA_Falling::StaticClass());
}


class UGA_Death_NoDeathEffect_RotateToCenter : UGA_Death
{
    UPROPERTY()
    FRotator m_InitialRotation;
    UPROPERTY()
    FRotator m_FinalRotation;
    UPROPERTY()
    FName m_TeleportWayPointActorName = n"FP_SC_CORKALOMDEMON_SPAWN_FAIL";

    UPROPERTY()
    float m_TurnDuration = 0.5f;

    float m_ElapsedTime = 0.0f;
    float m_InitialTime = 0.0f;

    //float m_MaxAngle = 30.0f;
    float m_MaxDistance = 450.0f;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        AActor avatarActor = GetAvatarActorFromActorInfo();
        if (avatarActor == nullptr)
        {
            return;
        }

        m_InitialRotation = avatarActor.GetActorRotation();
        FInteractionSpotHandle spot(m_TeleportWayPointActorName);

        if (!spot.IsValid())
        {
            return;
        }

        FVector avatarLocation = avatarActor.GetActorLocation();
        FVector spotLocation = spot.GetLocation();

        FRotator rawLookAtRotation = MagicScript::FindLookAtRotation(avatarLocation, spotLocation);
        rawLookAtRotation.Pitch = 0.0f;
        rawLookAtRotation.Roll = 0.0f;

        float initialDistance = avatarLocation.Distance(spotLocation);

        FRotator deltaRotator = rawLookAtRotation - m_InitialRotation;
        float yawDelta = deltaRotator.GetNormalized().Yaw;

        if (initialDistance > m_MaxDistance) // && Math::Abs(yawDelta) > m_MaxAngle)
        {
            float rotationSign = Math::Sign(yawDelta);
            m_FinalRotation = rawLookAtRotation;
            //m_FinalRotation.Yaw -= (m_MaxAngle * rotationSign);

            m_ElapsedTime = 0.0f;
            m_InitialTime = World.TimeSeconds;
            
            System::SetTimerForNextTickDelegate(FTimerDynamicDelegate(this, n"DoTurn"));
        }
        else
        {
            m_FinalRotation = m_InitialRotation;
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoDeathEffect_Scriptable()
    {
        AActor avatarActor = GetAvatarActorFromActorInfo();
        if (avatarActor != nullptr)
        {
            avatarActor.SetActorRotation(m_FinalRotation);
        }
        EndAbility();
    }

    UFUNCTION()
    void DoTurn()
    {
        AActor avatarActor = GetAvatarActorFromActorInfo();
        if (avatarActor == nullptr)
        {
            EndAbility();
            return;
        }

        float deltaSeconds = World.TimeSeconds - m_InitialTime;
        m_InitialTime = World.TimeSeconds;
        m_ElapsedTime += deltaSeconds;

        float alpha = Math::Clamp(m_ElapsedTime / m_TurnDuration, 0.0f, 1.0f);

        // Lerp to the offset rotation
        FRotator newRotation = Math::LerpShortestPath(m_InitialRotation, m_FinalRotation, alpha);
        avatarActor.SetActorRotation(newRotation);

        if (alpha >= 1.0f)
        {

        }
        else
        {
            System::SetTimerForNextTickDelegate(FTimerDynamicDelegate(this, n"DoTurn"));
        }
    }
}
