
class UGA_CastSpell_Telekinesis : UGA_CastSpell_Targetable_Mandatory
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Telekinesis::StaticClass();
    default m_TriggerBeginOnSpellTag = FGameplayTag();//GameplayTag::Ability_Action_Spell_Throw_Telekinesis;

    default m_SpellConfigClass = UTelekinesisSpellConfig::StaticClass();
    default m_CollisionChannel = ECollisionChannel::ECC_GameTraceChannel18; //Channel for target(item) detection. Used for get the target
    default m_WeaponContainer = UItAr_Rune_Telekinesis_Base::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorTelekinesis::StaticClass();

    UPROPERTY()
    bool m_TargetValidated = false;


    float GetMinOffsetToValidItemTarget() const
    {
        return Cast<UTelekinesisSpellConfig>(GetConfig()).m_MinOffsetToValidItemTarget;
    }

    void InitializeValidatorData(USpellExecutionValidatorDataDefault Data, AActor SourceActor,
                                 AActor TargetActor) const override
    {
        Super::InitializeValidatorData(Data, SourceActor, TargetActor);
        UTelekinesisSpellExecutionValidatorData data = Cast<UTelekinesisSpellExecutionValidatorData>(Data);
        data.MinOffsetToValidItemTarget = GetMinOffsetToValidItemTarget();
        data.TargetValidated = m_TargetValidated;
    }


    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        bool isValid = IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
        //FREE THE ITEM!
        return isValid;
    }

    UFUNCTION()
    FCollisionResponseContainer GetCollisionResponses_Scriptable() const override
    {
        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_GameTraceChannel11, ECollisionResponse::ECR_Block);
        return responses;
    }

    UFUNCTION(BlueprintOverride)
    FGameplayEventData GetTargetEventData_Scriptable(AActor Actor)
    {
        if(Actor == nullptr)
            EndAbility();
        return MagicScript::GetTargetEventDataForTelekinesis(Actor);
    }

    UFUNCTION(BlueprintOverride)
    void OnTargetValidated_Scriptable(AActor Actor)
    {
        Super::OnTargetValidated_Scriptable(Actor);
        
        UInteractiveComponent interactiveComp = GetInteractiveComponentFromTarget();
        if(interactiveComp == nullptr)
        {
            EndAbility();
            return;
        }
   
        if(!interactiveComp.IsAssociatedToAnActor() && !interactiveComp.GetIsBeingUsed())
        {            
            if(IsOwnerActorAuthoritative())
            {
               AssociateItemInteractionToCaster(GetAvatarActorFromActorInfo());
            }
            StopItemMovement(Actor);
            ActivateTarget(Actor);
            m_TargetValidated = true;
        }
        else
        {
            EndAbility();
            return;
        }
    }

    void StopItemMovement(AActor Actor)
    {
        if(!GetAvatarActorFromActorInfo().HasAuthority())
            return;
        auto itemVisualWorld = Cast<AItemVisualWorld>(Actor);
        if(itemVisualWorld != nullptr)
            itemVisualWorld.PutToSleep();
    }

    UInteractiveComponent GetInteractiveComponentFromTarget()
    {
        if(GetTarget() == nullptr)
            return nullptr;
        return Cast<UInteractiveComponent>(GetTarget().GetComponentByClass(UInteractiveComponent::StaticClass()));
    }

    void ClearSelectedToInteractItem()
    {
        UInteractiveComponent interactiveComponent = GetInteractiveComponentFromTarget();
        if(interactiveComponent != nullptr)
	    {
            interactiveComponent.ClearAssociatedActorToInteract();
	    }
    }


    void AssociateItemInteractionToCaster(AActor ActorToInteract)
    {
        if(GetTarget() == nullptr)
            return;
        UInteractiveComponent interactiveComp = GetInteractiveComponentFromTarget();
        if(interactiveComp == nullptr)
            return;

        interactiveComp.AssociateActorToInteract(ActorToInteract);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        Super::OnEndCastSpellServer_Scriptable(WasCancelled);
        m_TargetValidated = false;
        if(WasCancelled)
            ClearSelectedToInteractItem();
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                                        FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbilityBeforeAssetPreload_Scriptable(GAActorInfo, TriggerEventData);
        m_TargetValidated = false;
    }

    UFUNCTION(BlueprintOverride)
    void LaunchSpellAbilityServer_Scriptable()
    {
        //@DE - For focus stone bridge we need to use telekinesis spell variant
        auto targetActor = Cast<AFocusStoneBridgeItem>(GetTarget());
        if(targetActor == nullptr)
            return;
        IncrementCurrentSpellLevel();
    }
}