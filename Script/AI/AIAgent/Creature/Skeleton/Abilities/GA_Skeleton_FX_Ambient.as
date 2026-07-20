class UGA_Skeleton_FX_Ambient : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FX_Skeleton_Ambient_Loop);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_Skeleton_Ambient_Loop);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_Skeleton_Ambient_Loop);

    default m_FxTag = GameplayTag::FX_Creature_Skeleton_Ambient_Loop;

    void OnDieMeBefore(FGameplayEventData GameplayEventData) override
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent != nullptr)
            fxComponent.PlayEffect(GameplayTag::FX_Creature_Skeleton_Death, nullptr); 
        Super::OnDieMeBefore(GameplayEventData);
    }
}


class UGA_Skeleton_Mage_FX_Ambient : UGA_Creature_FX_Sound
{

    default AbilityTags.AddTag(GameplayTag::Ability_Creature_FX_SkeletonMage_Ambient_Loop);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_SkeletonMage_Ambient_Loop);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Creature_FX_SkeletonMage_Ambient_Loop);

    default m_FxTag = GameplayTag::FX_Creature_SkeletonMage_Ambient_Loop;

    void OnDieMeBefore(FGameplayEventData GameplayEventData) override
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = gothicChar.GetFXComponent();
        if(fxComponent != nullptr)
            fxComponent.PlayEffect(GameplayTag::FX_Creature_Skeleton_Death, nullptr); 
        Super::OnDieMeBefore(GameplayEventData);
    }
}