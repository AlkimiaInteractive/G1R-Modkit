UCLASS()
class AThrowItemDamageVisual : ABoxCollisionShapeVisual
{
    default bNeverApplyTickOptimizations = true;

    default m_CollisionComp.m_WeaponData = UThrowItemDefBase::StaticClass();

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_Def_SmallItem = UThrowItemWeaponDef_SmallItem::StaticClass();
    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_Def_MidItem = UThrowItemWeaponDef_MidItem::StaticClass();
    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_Def_BigItem = UThrowItemWeaponDef_BigItem::StaticClass();

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    AItemVisualWorld AssociatedItem;

    UFUNCTION(BlueprintOverride, meta = (NoSuperCall))
    void BeginPlay()
    {
        
    }

    bool SetUpCollisionShape() override
    {
        auto m_def = Cast<UWeaponDefinition>(GetWeaponDefinition());
        if(m_def != nullptr)
        {

            SetColliderState(EHitColliderState::Damage);

            return true;
        }
        return false;
    }

    bool ShouldOpenInteractableDoor() override
    {
        return true;
    }

    UFUNCTION()
    void OnProjectileStop(AItemVisualWorld Item)
    {
        Item.OnProjectileStopDelegate.Unbind(this, n"OnProjectileStop");
        SetColliderState(EHitColliderState::None);
        DestroyActor();
    }

    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass() override
    {
        if(AssociatedItem == nullptr)
            return m_Def_SmallItem;          
        if(AssociatedItem.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Size_Big))
            return m_Def_BigItem;
        if(AssociatedItem.ItemDefinition.HasItemSpec(GameplayTag::Item_Property_Size_Mid))
            return m_Def_MidItem;
        return m_Def_SmallItem;

    }

    //@DE - Do nothing on end overlap, avoid damage multiples time to the same target.
    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int32 OtherBodyIndex) override
    {
        //Super::DoOnEndOverlap(OverlappedComp, OtherActor, OtherComp, OtherBodyIndex);
        
    }
}

UCLASS()
class UThrowItemDefBase : UProjectileDefinition
{
    default m_Name = "ThrowItemDef";
    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);

    default m_HitEffect = UGE_Damage::StaticClass();

}

UCLASS()
class UThrowItemWeaponDef_SmallItem: UThrowItemDefBase
{
    default m_Name = "ThrowItemDef_SmallItem";
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 1);
    default m_SuperArmorDamageBase = 1.0f;
}

UCLASS()
class UThrowItemWeaponDef_MidItem: UThrowItemDefBase
{
    default m_Name = "ThrowItemDef_MidItem";
    default AddItemSpec(GameplayTag::Item_Property_Size_Mid);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 5);
    default m_SuperArmorDamageBase = 5.0f;
}


UCLASS()
class UThrowItemWeaponDef_BigItem: UThrowItemDefBase
{
    default m_Name = "ThrowItemDef_BigItem";
    default AddItemSpec(GameplayTag::Item_Property_Size_Big);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 10);
    default m_SuperArmorDamageBase = 10.0f;
}
