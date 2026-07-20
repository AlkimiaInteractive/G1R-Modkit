UCLASS(Blueprintable)
class AArrowVisual_AS_Base : AArrowVisual
{

    default m_SurfaceHardnessMakesBounce = 0.8f;
    default m_Bounciness = 0.1f;
    default m_Friction = 0.8f;
    //default m_BounceVelocityStopSimulatingThreshold;
    //default m_MinFrictionFraction;

    UFUNCTION(BlueprintOverride)
    bool CanAttachArrowOnHitActor_Scriptable(AActor HitActor, float surfaceHardness)
    {
        //@DE - On Soul Harvest projectile, when the soul is hit by the arrow, the target is destroyed and the arrow should fall
        auto isSoulHarvestActor = Cast<ASoulHarvestCharacter_Visual>(HitActor) != nullptr;
        if(isSoulHarvestActor)
            return false;

        //@DE - On this barrier, the arrows cant be attached.
        auto isStageBarriertActor = Cast<AStageBarrierVisual>(HitActor) != nullptr;
        if(isStageBarriertActor)
            return false;
        //@DE - On Sleeper dream, some targets have an invulnerableShield and the arrow should fall
        auto isInvulnerableVisual = Cast<AInvulnerableVisual>(HitActor) != nullptr;
        if(isInvulnerableVisual)
            return false;

        auto isStoneGolem = Cast<AGolemStone>(HitActor) != nullptr;
        if(isStoneGolem)
            return Math::RandBool();
    
        if(surfaceHardness > 0.8f)
            return Math::RandRange(0, 10) < surfaceHardness * 10;
        
        return true;
    }
     
    UFUNCTION(BlueprintOverride)
    bool HasBouncingWhenHit_Scriptable(AActor HitActor, float surfaceHardness)
    {
        const auto isGolemActor = Cast<AGolemStone>(HitActor) != nullptr;
        return isGolemActor || surfaceHardness >= m_SurfaceHardnessMakesBounce;
    }

    UFUNCTION(BlueprintOverride)
    void DoInteractableArrowFallBehaviour_Scriptable(AItemVisualWorld InteractableArrow, float kineticEnergyCoef, bool hasBouncingWhenHit)
    {
        InteractableArrow.SetDrop(0, true, FVector(Math::RandRange(-360, 360),Math::RandRange(-360, 360),Math::RandRange(-360, 360)));
        auto collisionComp = Cast<UBoxComponent>(InteractableArrow.GetComponentByClass(UBoxComponent::StaticClass()));
        if(collisionComp ==nullptr)
            return;
        
        auto strength = Math::RandRange(100, 200);
        float bouncingStrength = strength;
        
        auto randomVector = FVector(Math::RandRange(-1, 1), Math::RandRange(-1, 1), Math::RandRange(-1, 1));
        randomVector.Normalize();

        if(hasBouncingWhenHit)
        {    
            const auto isInTheHemisphereOf = InteractableArrow.ActorForwardVector.DotProduct(randomVector) < 0;
            if(!isInTheHemisphereOf)
            {
                randomVector = -randomVector;
            }
            strength = Math::RandRange(300, 400);
            bouncingStrength = kineticEnergyCoef * strength;
        }
       
        collisionComp.AddImpulse(randomVector * bouncingStrength);
    }
}