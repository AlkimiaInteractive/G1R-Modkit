// UCLASS()
// class AEnvironmentLavaAreaBase : ABoxCollisionShapeVisual
// {
//     UPROPERTY(NotVisible)
//     UEnvironment_LavaDefinitionBase m_def;

//     default m_CollisionComp.m_WeaponData = UEnvironment_LavaDefinitionBase::StaticClass();

//     UPROPERTY(BlueprintReadWrite, EditAnywhere)
//     float m_BoxXExtent = 100.f;
//     UPROPERTY(BlueprintReadWrite, EditAnywhere)
//     float m_BoxYExtent = 100.f;
//     UPROPERTY(BlueprintReadWrite, EditAnywhere)
//     float m_BoxZExtent = 100.f;

//     UPROPERTY(DefaultComponent, Attach=m_RootComp)
//     UArrowComponent m_ArrowComponent;
//     UPROPERTY(DefaultComponent, Attach=m_RootComp)
//     UTextRenderComponent m_TextRender;

//     UFUNCTION(BlueprintOverride)
//     void ConstructionScript()
//     {
//         m_CollisionComp.SetBoxExtent(FVector(m_BoxXExtent, m_BoxYExtent, m_BoxZExtent), true);

//         if(m_TextRender != nullptr)
//         {
//             m_TextRender.SetRelativeLocation(FVector(0,0,100));       
//             m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
//             m_TextRender.SetTextRenderColor(FColor::Blue);
//             m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
//             m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
//         }
//         if(m_ArrowComponent != nullptr)
//         {
//             m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
//             m_ArrowComponent.SetHiddenInGame(true);
//         }      

//     }

  
//     bool SetUpCollisionShape() override
//     {
//         m_def = Cast<UEnvironment_LavaDefinitionBase>(GetWeaponDefinition());
//         if(m_def != nullptr)
//         {
//             SetColliderState(EHitColliderState::Damage);
//             return true;
//         }
//         return false;
//     }

//     UFUNCTION(BlueprintEvent)
//     void DoDestroy()
//     {
        
//     }

//     FGameplayTag GetAttackType() override
//     {
//         return GameplayTag::Combat_HitType_Dot;
//     }

//     bool NeedCheckVisibility() override
//     {
//         return false;
//     }

//     UGothicAbilitySystemComponent GetSourceAbComp() override
//     {
//         return GothicGAS::GetAbilitySystemComponent(this);
//     }

// }