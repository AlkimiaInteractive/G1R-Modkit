class UGA_AttackThrow_Base : UGameplayAbilityAttackThrow
{
    default ActivationOwnedTags.AddTag(GameplayTag::State_AllowRotateNotMoving);

    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();

    UFUNCTION(BlueprintOverride)
    void OnProjectileSpawned_Scriptable(AProjectileVisual ProjectileVisual)
    {
        ProjectileVisual.SetOwner(GetAvatarActorFromActorInfo());
        
        auto skeletalMeshComp = Cast<USkeletalMeshComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(USkeletalMeshComponent::StaticClass()));
        ProjectileVisual.m_CollisionComp.IgnoreComponentWhenMoving(skeletalMeshComp, true);
        skeletalMeshComp.IgnoreComponentWhenMoving(ProjectileVisual.m_CollisionComp, true);

        ProjectileVisual.m_CollisionComp.IgnoreActorWhenMoving(GetAvatarActorFromActorInfo(), true);
    }
}

//Ability for grounded characters
class UGA_AttackThrow : UGA_AttackThrow_Base
{
    default ActivationRequiredTags.AddTag(GameplayTag::State_Grounded);

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(GameplayAbilityActorInfo.AvatarActor);

        UGothicMovementComponent movComp = Character.GetGothicMovementComponent();
		{
		   return movComp.IsWalking();
		}
    }
}

class UGA_AttackThrow_NoTurns : UGA_AttackThrow
{
    default ActivationOwnedTags.RemoveTag(GameplayTag::State_AllowRotateNotMoving);
}

class UGA_AttackThrow_Flying : UGA_AttackThrow_Base
{

}

