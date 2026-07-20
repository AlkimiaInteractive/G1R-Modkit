UCLASS()
class AWindVisual : ACollisionShapeVisual
{
    default m_ProjectileDebuffTag = GameplayTag::Debuff_Wind;
    default bReplicates = true;
    
    UFUNCTION(BlueprintOverride)
    void Initialize() 
    {
      Super::Initialize();
      UWindProjectile_Base def = Cast<UWindProjectile_Base>(GetWeaponDefinitionSubclass().Get().GetDefaultObject());
        if(def != nullptr)
        {
            SetLifeSpan(def.m_LifeTime);
        }
    }
    
   FGameplayTag GetAttackType() override
   {  
        return GameplayTag::Combat_HitType_Knockback;        
   }

    UFUNCTION(BlueprintCallable)
    void DeactivateCollision()
    {
    }

    UFUNCTION(BlueprintOverride)
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        effects.Add(UGE_Wind::StaticClass());
        return effects;        
    }

     bool CanKillOnDefeatedState() override
    {
        return true;
    }

    bool ShouldOpenInteractableDoor() override
    {
        return true;
    }
    
};