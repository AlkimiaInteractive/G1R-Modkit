class UGA_TraceTarget_Character : UGA_TraceTarget_Base
{
    default m_DrawDebugType = EDrawDebugTrace::None;
    default m_CollisionChannel = ECollisionChannel::ECC_Visibility;

    default m_TraceDetectedTag = GameplayTag::State_TraceTarget_TargetDetected;
}