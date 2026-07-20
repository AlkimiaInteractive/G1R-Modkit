UCLASS()
class ANotifySpellCategoryActor : AGothicGASActor
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitBoxCollisionComponent m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(NotVisible)
    TArray<AActor> m_Targets;

    UPROPERTY()
    ASunkenDoor_01_As m_SunkenDoor;

    UPROPERTY()
    AElementalPlatform_As m_ElementalPlatform;

    UPROPERTY()
    TMap<AActor, UDelegateHandleContainer> m_handleSpellDelegate;

    default bNeverApplyTickOptimizations = true;
    UPROPERTY(NotEditable, NotVisible)
    FGameplayTag m_NotifySpellCategoryTag = GameplayTag::State_NotifySpellCategory;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FVector m_CollisionBoxExtent = FVector(100,100,100);


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Red);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }
        if(m_CollisionComp != nullptr)
        {
            m_CollisionComp.SetBoxExtent(m_CollisionBoxExtent);
        }   
    }


    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(!IsValidCollision(OtherActor, OtherComp))
            return;
        
        if(m_Targets.Contains(OtherActor))
            return;
        Cast<AGothicCharacter>(OtherActor).GetGothicAbilitySystemComponent().AddTag(m_NotifySpellCategoryTag);
        m_Targets.Add(OtherActor);
        m_handleSpellDelegate.Add(OtherActor, MagicScript::AttachToEventTag(OtherActor, GameplayTag::Event_NotifySpellCategory, this, n"OnSpellCategoryEvent"));
        
    }

    bool IsValidCollision(AActor OtherActor, UPrimitiveComponent OtherComp)
    {
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_Targets.Contains(OtherActor))
        {
            return false;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return false;
        }
        auto otherCharacter = Cast<AGothicCharacter>(OtherActor);
        if(otherCharacter == nullptr)
            return false;
        return otherCharacter.IsPlayerControlled();
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor != nullptr)
        {
            if(m_Targets.Contains(OtherActor))
            {
                Cast<AGothicCharacter>(OtherActor).GetGothicAbilitySystemComponent().RemoveTag(m_NotifySpellCategoryTag);
                m_Targets.Remove(OtherActor);
            }
            if(m_handleSpellDelegate.Contains(OtherActor))
            {
                MagicScript::DetachFromEvent(OtherActor, m_handleSpellDelegate[OtherActor]);
                m_handleSpellDelegate.Remove(OtherActor);
            }
            
        }
    }

    UFUNCTION()
    void OnSpellCategoryEvent(FGameplayEventData GameplayEventData)
    {
        auto eventReceived = GameplayEventData.EventTag;
        if(eventReceived == GameplayTag::Event_Spell_Fire)
        {
            m_SunkenDoor.FireReceived();
            m_ElementalPlatform.FireReceived();
        }
        else if(eventReceived == GameplayTag::Event_Spell_Ice)
        {
            m_SunkenDoor.IceReceived();
            m_ElementalPlatform.IceReceived();
        }
        else if(eventReceived == GameplayTag::Event_Spell_Wind)
        {
            m_SunkenDoor.WindReceived();
            m_ElementalPlatform.WindReceived();
        }
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        for(auto target : m_Targets)
        {
            Cast<AGothicCharacter>(target).GetGothicAbilitySystemComponent().RemoveTag(m_NotifySpellCategoryTag);
        }
        for(auto target : m_handleSpellDelegate)
        {
            MagicScript::DetachFromEvent(target.Key, target.Value);
        }
        m_Targets.Empty();
        m_handleSpellDelegate.Empty();
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_CollisionComp.SetState(EHitColliderState::Damage);
    }

}

UCLASS()
class ASunkenDoor_01_As : AInteractiveObjectActor
{
    UFUNCTION(BlueprintEvent)
    void FireReceived()
    {
        Print("FireReceived This will only print if not overridden from a child BP.");
    }

    UFUNCTION(BlueprintEvent)
    void IceReceived()
    {
        Print("IceReceived This will only print if not overridden from a child BP.");
    }

    UFUNCTION(BlueprintEvent)
    void WindReceived()
    {
        Print("WindReceived This will only print if not overridden from a child BP.");
    }
    UFUNCTION(BlueprintCallable)
    void DoorOpened() const
    {
        //Print("DoorOpened This will only print if not overridden from a child BP.");
        #ifdef WITH_STORY_G1R
        G1R::UStoryG1R::Get().SunkenTowerElementsDoorOpen = 1;
        #endif 
        
    }
}

UCLASS()
class AElementalPlatform_As : AActor
{
    UFUNCTION(BlueprintEvent)
    void FireReceived()
    {
        Print("FireReceived This will only print if not overridden from a child BP.");
    }

    UFUNCTION(BlueprintEvent)
    void IceReceived()
    {
        Print("FireReceived This will only print if not overridden from a child BP.");
    }

    UFUNCTION(BlueprintEvent)
    void WindReceived()
    {
        Print("FireReceived This will only print if not overridden from a child BP.");
    }
}