class UGA_TraceTarget_Base : UGameplayAbilityTraceTarget
{
    // ItemWorldVisual trace (ECC_GameTraceChannel18) -> 	//ECollisionChannel::ECC_GameTraceChannel18 is ItemWorldVisualTrace

    //default m_DrawDebugType = EDrawDebugTrace::ForOneFrame;
    // default m_CollisionChannel = ECollisionChannel::ECC_GameTraceChannel18;
    // default m_SpellConfig = UTelekinesisSpellConfig::StaticClass();
    // default m_ItemClassFilter = AItemVisualWorld::StaticClass();

    default m_TraceRate = 0.25;

    UPROPERTY()
    AActor m_LastTracedItem;
    UPROPERTY()
    FHitResult m_LastHitResult;

    UPROPERTY()
    FGameplayTag m_TraceDetectedTag;// = GameplayTag::State_TraceTarget_ItemDetected;

    UPROPERTY()
    TSubclassOf<UGA_CastSpell_Targetable> m_CastSpellClass = UGA_CastSpell_Targetable::StaticClass();

    UPROPERTY()
    UGA_CastSpell_Targetable m_CastSpellDefault;

    UPROPERTY()
    USpellExecutionValidatorDataTargetable m_ExecutionValidatorData;

    USpellTraceConfigBase GetConfig()
    {
        return Cast<USpellTraceConfigBase>(m_SpellConfig.Get().GetDefaultObject());
    }

    float GetRangeFromConfig()
    {
        return GetConfig().m_AreaRange;
    }

    float GetTraceRadiusFromConfig()
    {
        return GetConfig().m_TraceRadius;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
       m_TraceRange = GetRangeFromConfig();
       m_TraceRadius = GetTraceRadiusFromConfig();
       m_CastSpellDefault = m_CastSpellClass.GetDefaultObject();
       m_ExecutionValidatorData = Cast<USpellExecutionValidatorDataTargetable>(m_CastSpellDefault.CreateSpellValidatorExecutionData());
    }

    UOutlineSubsystem GetOutlinerController()
    {
        return UOutlineSubsystem::Get();
    }

    bool IsTargetAtValidDistance(const AActor Actor)
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
       DeactivateHighlight(GetTarget());
    }

    UFUNCTION(BlueprintOverride)
    void OnHitServer_Scriptable(FHitResult OutHit)
    {
        auto targetActor = OutHit.GetActor();
        m_LastHitResult = OutHit;

        //if(HasAuthority() && IsLocallyControlled())
        //    Print(targetActor.GetName().ToString());
        
        if(!IsValidTarget(targetActor))
        {
            if(GetTarget() != nullptr) //#1. We have a target and is not valid no more
            {
                DeactivateHighlight(GetTarget());
                SetTarget(nullptr);
                return;
            }
            
            if(m_LastTracedItem != targetActor) //#2. We have a traced item but it not the same than the last update. (Overlapped items)
                DeactivateHighlight(m_LastTracedItem);
            
            if(IsVisible(targetActor)) //#3. Check visibility.
                UpdateOutliner(targetActor);
            m_LastTracedItem = targetActor;
            return;
               
        }        

        if(targetActor != GetTarget())
        {
            DeactivateHighlight(GetTarget());
            SetTarget(targetActor);
            ActivateHighlight(GetTarget());
            m_LastTracedItem = nullptr;
            return;
        }
        if(GetTarget() == nullptr)
        {
            SetTarget(targetActor);
            ActivateHighlight(GetTarget());
            m_LastTracedItem = nullptr;
            return;
        }   

        UpdateOutliner(targetActor);
        return; 
    }



    bool IsValidTarget(AActor TargetActor)
    {
        if(m_AbComp.HasGameplayTag(GameplayTag::State_LaunchingSpell))
            return true;
        m_CastSpellDefault = m_CastSpellClass.GetDefaultObject();
        m_ExecutionValidatorData.CheckForTrace = true;
        return m_CastSpellDefault.DoExecutionValidation(m_ExecutionValidatorData, GetAvatarActorFromActorInfo(), TargetActor);
    }

    bool IsVisible(AActor TargetActor)
    {
        if(TargetActor == nullptr)
            return false; 
        
        //First trace from actor location.
        FVector targetPoint = TargetActor.GetActorLocation();
        FHitResult hit_result;
        bool hit = DoTraceFromCamera(TargetActor, targetPoint, hit_result);

        if(!hit)
        {
            //DebugScript::DrawSphere(targetPoint, 10.0f, FColor::Green, 0.10f);
            //Print(FString::ApplyFormat(targetPoint, FString()));
            //Print("VISIBLE ", 5.f, FLinearColor::Green);
            
            //We have not hit with something in the world. The item is visible. (The itemWorld class doesnt hit with visibility channel)
            return true;
        }
        
        //If first trace fail, try to check from impact point location.
        targetPoint = m_LastHitResult.ImpactPoint;
        hit = DoTraceFromCamera(TargetActor, targetPoint, hit_result);

        if(hit)
        {
            //DebugScript::DrawSphere(targetPoint, 10.0f, FColor::Red, 0.10f);
            //Print(FString::ApplyFormat(targetPoint, FString()));
            //Print("NO VISIBLE", 5.f, FLinearColor::Red);
            //Print(hit_result.Actor.GetName().ToString());

            //We have hit with something in the world. The item is not visible. (The itemWorld class doesnt hit with visibility channel)
            return false;     
        }

        //DebugScript::DrawSphere(targetPoint, 10.0f, FColor::Green, 0.10f);
        //Print(FString::ApplyFormat(targetPoint, FString()));
        //Print("VISIBLE ", 5.f, FLinearColor::Green);
        
        //We have not hit with something in the world. The item is visible. (The itemWorld class doesnt hit with visibility channel)
        return true;
       
    }

    bool DoTraceFromCamera(AActor TargetActor, FVector TargetPoint, FHitResult& hit_result)
    {
        TArray<AActor> actors_ignore;
        actors_ignore.Add(GetAvatarActorFromActorInfo());
        actors_ignore.Add(TargetActor.GetOwner()); // To ignore the character holding a pouch. May also work for other item types.

        //float traceRange = GetAvatarActorFromActorInfo().GetActorLocation().Distance(TargetActor.GetActorLocation());

	    FVector cameraLocation = MagicScript::GetCameraProjectionOverCharacter(Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()));
        float traceRange = cameraLocation.Distance(TargetPoint);

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);

        return MagicScript::GetSingleActorTargetFromCameraByLine(
Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()),
            traceRange,
            trace_type, 
            false,
            responses,
            actors_ignore,
            EDrawDebugTrace::None,
            hit_result,
            true);
    }

    bool IsBeingUsedByOtherActor(const AActor TargetActor) const
    {
        if(TargetActor == nullptr)
            return false;

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnNotHitServer_Scriptable()
    {
        auto currentTarget = GetTarget();
        DeactivateHighlight(currentTarget);
        DeactivateHighlight(m_LastTracedItem);
        SetTarget(nullptr);
        m_LastTracedItem = nullptr;
    }

    void ActivateHighlight(AActor TargetActor)
    {
        AddTargetDetectedTag();

        if(TargetActor == nullptr)
            return;
        if(ActorInfo.AvatarActor == nullptr)
            return;
        if(IsLocallyControlled() && !IsAI())
        {
            UpdateOutliner(TargetActor);
        }
    }

    void UpdateOutliner(AActor TargetActor)
    {
        if(!IsLocallyControlled() || IsAI())
            return;           
        
    }


    bool IsAI()
    {
        const auto gothicChar = Cast<AGothicCharacter>(ActorInfo.AvatarActor);
	    const auto AIController = Cast<AGothicAIController>(gothicChar.Controller);
	    return AIController != nullptr;
    }

    void DeactivateHighlight(AActor TargetActor)
    {
        RemoveTargetDetectedTag();

        if(TargetActor == nullptr)
            return;
        if(ActorInfo.AvatarActor == nullptr)
            return;

        if(IsLocallyControlled() && !IsAI())
        {
            RemoveOutliner(TargetActor);
        }
    }

    void RemoveOutliner(AActor TargetActor)
    {

    }

    void AddTargetDetectedTag()
    {
        if(!m_AbComp.HasGameplayTag(m_TraceDetectedTag))
            AddTag(m_TraceDetectedTag);
    }

    void RemoveTargetDetectedTag()
    {
        if(m_AbComp.HasGameplayTag(m_TraceDetectedTag))
            RemoveTag(m_TraceDetectedTag);
    }
}