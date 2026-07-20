UCLASS()
class UGA_GameplayAbilityThrow : UGameplayAbilityThrow
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Blueprints/Environment/BP_ThrowItemDamageVisual.BP_ThrowItemDamageVisual_C'";

    UFUNCTION()
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    void OnItemThrowed_Scriptable(AItemVisualWorld Item)
    {
        auto damageActor = Cast<AThrowItemDamageVisual>(SpawnObject(GetSpawnActorClassServer_Scriptable(), Item.GetActorLocation(), Item.GetActorRotation()));
        if(damageActor == nullptr)
            return;
        damageActor.AttachToActor(Item);
        damageActor.AssociatedItem = Item;

        FVector extent = Item.GetCollisionComponent().GetUnscaledBoxExtent() + FVector(5, 5, 5);
        damageActor.m_CollisionComp.SetBoxExtent(extent, true);
        damageActor.m_CollisionComp.IgnoreActorWhenMoving(Item, true);
        damageActor.m_CollisionComp.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), true);
        Item.GetCollisionComponent().IgnoreActorWhenMoving(Item, true);
        damageActor.m_ItemDefinition = Item.m_WorldItemDefinition;
        
        Item.OnProjectileStopDelegate.AddUFunction(damageActor, n"OnProjectileStop");
        damageActor.Initialize();
    }
}