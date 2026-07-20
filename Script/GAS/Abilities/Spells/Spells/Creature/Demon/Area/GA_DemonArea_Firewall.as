class UGA_DemonArea_Firewall : UGA_Demon_Area_Base
{
    default ActivationRequiredTags.RemoveTag(GameplayTag::State_Grounded);
    default ActivationRequiredTags.AddTag(GameplayTag::State_Flying);
  
    UFUNCTION(BlueprintOverride)
    void OnActorSpawned_Scriptable(AActor SpawnedActor)
    {
        Super::OnActorSpawned_Scriptable(SpawnedActor);
        auto firewallArea = Cast<ADemonAreaFirewallVisual>(SpawnedActor);
        firewallArea.m_OwnerAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        firewallArea.InitializeArea(m_Target);
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldCheckMovementMode_Scriptable() const
    {
        return false;
    }

     
}

