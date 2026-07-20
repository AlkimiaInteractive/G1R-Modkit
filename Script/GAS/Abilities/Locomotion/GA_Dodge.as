class UGA_Dodge_Base : UGameplayAbilityDodge
{
    default m_SuperArmorEffect = UGE_IncreaseSuperArmor::StaticClass();
}

class UGA_Dodge : UGA_Dodge_Base
{
	default ActivationRequiredTags.AddTag(GameplayTag::State_Grounded);

    default ActivationBlockedTags.AddTag(GameplayTag::State_Flying);

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

class UGA_Dodge_Flying : UGA_Dodge_Base
{
}