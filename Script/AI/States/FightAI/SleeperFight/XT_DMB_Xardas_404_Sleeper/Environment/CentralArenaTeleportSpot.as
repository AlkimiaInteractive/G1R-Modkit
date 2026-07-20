
class ACentralArenaTeleportSpot : AXardasSleeperTeleportSpotVisual
{
    default m_SpotConfigClass = UXardasSleeperTeleportCentralSpotConfig::StaticClass();
    default m_DoingTeleportTag = GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot;

    void OnTeleportCompleted() override
    {
        Super::OnTeleportCompleted();
        ActivateSpot();
        //Cast<UGothicAbilitySystemComponent>(m_XardasChar.GetAbilitySystemComponent()).AddTag(GameplayTag::State_LockMovement);
        FGameplayEventData Payload;
        m_XardasChar.GetAbilitySystemComponent().SendGameplayEvent(GameplayTag::Event_XardasSleeper_OnCentralSpotCompleted, Payload);
        
    }

    void OnMovementCompleted() override
    {
        Super::OnMovementCompleted();
        UGothicMovementComponent movementComp = m_XardasChar.GetGothicMovementComponent();
        movementComp.SetMovementMode(EMovementMode::MOVE_Falling);
    }

}
