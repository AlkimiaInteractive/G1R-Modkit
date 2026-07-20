UCLASS()
class UCastSpellExecutionValidatorTelekinesis : UCastSpellExecutionValidatorTargeableBase
{
    default m_ExecutionValidatorData = UTelekinesisSpellExecutionValidatorData::StaticClass();
    
    UPROPERTY()
    FGameplayTag m_ItemDetectedTag = GameplayTag::State_TraceTarget_ItemDetected;

    UFUNCTION(BlueprintOverride)
    bool IsValid_Scriptable(USpellExecutionValidatorData ExecutionValidatorData) const
    {
        if(!Super::IsValid_Scriptable(ExecutionValidatorData))
            return false;

        auto castExecData = Cast<UTelekinesisSpellExecutionValidatorData>(ExecutionValidatorData);
        if(castExecData == nullptr)
            return false;

        // if(castExecData.TargetActor == nullptr)
        //     return false;

        // if(castExecData.TargetActor != castExecData.SourceActor)
        // {
        //     //if(!IsVisibleTarget(targetActor))
        //     if(!MagicScript::IsTargetReachable(castExecData.SourceActor, castExecData.TargetActor, ECollisionChannel::ECC_Visibility))
        //         return false;
        // }

        // const auto gothicCharacter = Cast<AGothicCharacter>(castExecData.TargetActor);
        // if(gothicCharacter.IsDead() || gothicCharacter.IsDefeated())
        //     return false;   

        // return gothicCharacter.GetHealthAttribute() < gothicCharacter.GetMaxHealthAttribute();

        //@DE - ACarriableWorldItem are AI items like world boxes
        auto carriableWorlditem = Cast<ACarriableWorldItem>(castExecData.TargetActor);
        if(carriableWorlditem != nullptr)
            return false;

        auto itemVisualWorld = Cast<AItemVisualWorld>(castExecData.TargetActor);
        if(itemVisualWorld == nullptr)
            return false;
        auto itemDef = itemVisualWorld.GetItemDefinition();
        if(itemDef == nullptr)
            return false;
        //@DE - Focus stones cant be get by telekinesis.
        if(itemVisualWorld.GetItemDefinition().IsA(UOG_FocusStone::StaticClass()))
            return false;

        if(!CanInteract(castExecData.SourceActor, castExecData.TargetActor))
            return false;

        if(!CanInteractUsingControlSpell(castExecData.SourceActor, castExecData.TargetActor))
            return false;

        // if(!IsVisibleTarget(Actor))
        //     return false;

        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);
        if(!MagicScript::IsTargetReachable(castExecData.SourceActor, castExecData.TargetActor, castExecData.ReachableCollisionChannel, responses))
        {
            if(!IsVisibleOnCameraForward(castExecData.SourceActor, castExecData.TargetActor))
                return false;
        }
            

        if(!IsTargetAtValidDistance(castExecData.SourceActor, castExecData.TargetActor, castExecData.MinOffsetToValidItemTarget))
            return false;

        // if(castExecData.TargetValidated)
        // {
        //     if(!IsTargetAssociatedToCaster(castExecData.SourceActor, castExecData.TargetActor))
        //         return false;
        // }
        
        //@DE - No need to check the trace tag due it is added by trace ability
        if(castExecData.CheckForTrace)
            return true;

        if(!HasInteractionTag(castExecData.SourceActor))
            return false;
            
        return true;
        
    }

    bool IsVisibleOnCameraForward(AActor SourceActor, AActor TargetActor) const
    {
        auto abComp = Cast<AGothicCharacter>(SourceActor).GetGothicAbilitySystemComponent();
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_TraceItem_Telekinesis::StaticClass(), outSpec);
        auto instances = outSpec.GetAbilityInstances();
        if(instances.IsEmpty())
            return false;
        auto traceAbility = Cast<UGA_TraceItem_Telekinesis>(instances[0]);
        if(traceAbility == nullptr)
            return false;
        
        FHitResult outResult;
        bool hit = traceAbility.DoTraceToTarget(outResult, TargetActor);
        if(hit)
        {
            return outResult.GetActor() == TargetActor;
        }
        return false;
    }

    bool HasInteractionTag(AActor Actor) const
    {
        if(Actor == nullptr)
            return false;
        auto abComp = Cast<AGothicCharacter>(Actor).GetGothicAbilitySystemComponent();
        if(abComp == nullptr)
            return false;
        
        return abComp.HasGameplayTag(m_ItemDetectedTag);
    }

    
    bool CanInteract(const AActor SourceActor, const AActor TargetActor) const
    {
        auto interactiveComp = Cast<UInteractiveComponent>(TargetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
        if(interactiveComp == nullptr)
            return false;

        bool isAssociatedToCaster = interactiveComp.IsSelectedToInteract() && interactiveComp.GetActorToInteract() == SourceActor;
        bool canInteract = !interactiveComp.IsSelectedToInteract();
        //Print(canInteract ? "CAN INTERACT" : "No Interact", 5.f, canInteract ? FLinearColor::Green : FLinearColor::Red); 
        return canInteract || isAssociatedToCaster;
    }

    bool CanInteractUsingControlSpell(AActor SourceActor, AActor TargetActor) const
    {
        auto Character = Cast<AGothicCharacter>(SourceActor);
        if(Character != nullptr && Character.IsPlayerCharacterOrPlayerControlled())
	    {
            if(IsCharacterControlledByControlSpell(Character))
            {
                if(!CanInteractControlledCharacterByControlSpell(Cast<AItemVisualWorld>(TargetActor)))
                {
                    return false;
                }
            }
	    }
        return true;
    }

    bool CanInteractControlledCharacterByControlSpell(AItemVisualWorld ItemWorld) const
    {
        if(ItemWorld == nullptr)
            return false;

        auto def = ItemWorld.GetItemDefinition();
        if(def.MatchesItemTypeExactly(GameplayTag::Item_Quest))
            return false;
        FGameplayTagContainer tags = FGameplayTagContainer();
        tags.AddTag(GameplayTag::Item_Property_Quest);
        tags.AddTag(GameplayTag::Item_Property_NonDroppable);
        tags.AddTag(GameplayTag::Item_Property_NonTrade);
        tags.AddTag(GameplayTag::Item_Property_Unique);
        if(def.HasAnyItemSpecs(tags))
            return false;
        return true;
    }

    bool IsCharacterControlledByControlSpell(AGothicCharacter Character) const
    {
        return Character.GetGothicAbilitySystemComponent().HasTagExact(GameplayTag::State_Controlled);
    }

    

    bool IsTargetAtValidDistance(const AActor SourceActor, const AActor TargetActor, float MinOffsetToValidItemTarget) const
    {
        if(SourceActor == nullptr || TargetActor == nullptr)
            return false;

        auto interactiveComp = Cast<UInteractiveComponent>(TargetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
        if(interactiveComp == nullptr)
            return false;

        float distance = TargetActor.GetActorLocation().Distance(SourceActor.GetActorLocation());
        return distance > (interactiveComp.GetPlayerInteractDistance() + MinOffsetToValidItemTarget);

    }
    

    // bool IsTargetAssociatedToCaster(const AActor SourceActor, const AActor TargetActor) const
    // {
    //     auto interactiveComp = Cast<UInteractiveComponent>(TargetActor.GetComponentByClass(UInteractiveComponent::StaticClass()));
    //     if(interactiveComp == nullptr)
    //         return false;

    //     bool isAssociatedToCaster = interactiveComp.IsSelectedToInteract() && interactiveComp.GetActorToInteract() == SourceActor;

    //     PrintDebugOnScreen(isAssociatedToCaster ? FName("ASSOCIATED TO CASTER") : FName("No ASSOCIATED TO CASTER"), 5.f, isAssociatedToCaster ? FColor::Green : FColor  ::Red); 
    //     //Print(isAssociatedToCaster ? FName("ASSOCIATED TO CASTER") : FName("No ASSOCIATED TO CASTER"), 5.f, isAssociatedToCaster ? FLinearColor::Green : FLinearColor::Red); 
    //     return isAssociatedToCaster;
    // }

}