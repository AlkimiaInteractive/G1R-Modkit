class UGA_ArcheryBow : UGameplayAbilityArchery
{
    UFUNCTION(BlueprintOverride)
    UClass GetComponentClass_Scriptable() const
    {
        return UBowComponent::StaticClass();
    }

    UFUNCTION(BlueprintOverride)
    bool IsUntrained_Scriptable() const
    {
        auto tagsContainer = GetOwnedGameplayTags();
        FGameplayTagContainer rangedBow;
        rangedBow.AddTag(GameplayTag::Skill_Ranged_Bow);
        const auto filteredContainer = tagsContainer.Filter(rangedBow);
	    //by default is untrained, so check if has trained or master tags.
	    return !(filteredContainer.HasTag(GameplayTag::Skill_Ranged_Bow_Trained) || filteredContainer.HasTag(GameplayTag::Skill_Ranged_Bow_Master));
    }

    UFUNCTION(BlueprintOverride)
    void DoQuickBowStringReleased_Scriptable()
    {
        if(!m_ArcheryComponent.IsAiming())
		    m_ArcheryComponent.OnQuickReleaseBowString();
    }

    UFUNCTION(BlueprintOverride)
    void DoBowStringReleased_Scriptable()
    {
        if(m_ArcheryComponent.IsAiming())
        {
            if(m_ArcheryComponent.IsSecureToFire()){
                m_ArcheryComponent.OnReleaseBowStringOrCrossbow();
            }
        }
    }
}