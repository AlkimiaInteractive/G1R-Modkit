class UGA_ArcheryCrossbow : UGameplayAbilityArchery
{
    UFUNCTION(BlueprintOverride)
    UClass GetComponentClass_Scriptable() const
    {
        return UCrossbowComponent::StaticClass();
    }

    UFUNCTION(BlueprintOverride)
    bool IsUntrained_Scriptable() const
    {
       auto tagsContainer = GetOwnedGameplayTags();
       FGameplayTagContainer rangedCrossbow;
       rangedCrossbow.AddTag(GameplayTag::Skill_Ranged_Crossbow);
       const auto filteredContainer = tagsContainer.Filter(rangedCrossbow);
       //by default is untrained, so check if has trained or master tags.
       return !(filteredContainer.HasTag(GameplayTag::Skill_Ranged_Crossbow_Trained) || filteredContainer.HasTag(GameplayTag::Skill_Ranged_Crossbow_Master));
    }

    UFUNCTION(BlueprintOverride)
    void DoQuickBowStringReleased_Scriptable()
    {
        const auto crossbow = m_ArcheryComponent.GetBowOrCrossbowWeapon();
        if(m_ArcheryComponent.IsNotchingArrowOntoBow())
        {
            //We allow to quick release in order to know 
            //there is a pending release
            m_ArcheryComponent.OnQuickReleaseBowString();
            return;
        }
        
        if(crossbow.HasArrowNotched())
        {
            if(!m_ArcheryComponent.IsAiming())
            {
                //Print("QuickReleaseBowString", 10, FLinearColor::DPink);
		        m_ArcheryComponent.OnQuickReleaseBowString();
            }
        }
        else if(m_ArcheryComponent.IsWaitingToFinishRelease())
	    {
            //Print("NotchArrowOntoBowFromQuickRelease", 10, FLinearColor::DPink);
            auto crossbowComponent = Cast<UCrossbowComponent>(m_ArcheryComponent);
            crossbowComponent.WantToShoot();
        }
        else
        {
            //Print("NotchArrowOntoBowFromRelax", 10, FLinearColor::DPink);
            //TODO we must notify this notch to server.
            m_ArcheryComponent.ChangeState(EArcheryState::NotchArrowOntoBowFromRelax);
        }
    }

    UFUNCTION(BlueprintOverride)
    void DoBowStringReleased_Scriptable()
    {
        if(m_ArcheryComponent.IsNotchingArrowOntoBow())
        {
            return;
        }
        const auto crossbow = m_ArcheryComponent.GetBowOrCrossbowWeapon();
        if(crossbow.HasArrowNotched())
        {
            if(m_ArcheryComponent.IsAiming())
            {
                //Print("OnReleaseBowStringOrCrossbow", 10, FLinearColor::LucBlue);
		        m_ArcheryComponent.OnReleaseBowStringOrCrossbow();
            }
        }
        else if(!m_ArcheryComponent.IsWaitingToFinishRelease())
	    {
            //Print("NotchArrowOntoBowFromRelax", 10, FLinearColor::LucBlue);
            /*m_ArcheryComponent.IsAiming() ? m_ArcheryComponent.ChangeState(EArcheryState::NotchArrowOntoBowFromAiming) :*/ m_ArcheryComponent.ChangeState(EArcheryState::NotchArrowOntoBowFromRelax);
        }
    }
}