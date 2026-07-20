UCLASS()
class UGA_MiltenSleeperInvulnerableVisualManager : UGA_InvulnerableVisualManager
{
    UInvulnerableVisualComponent GetInvulnerableVisualComponent() override
    {
        return UMiltenSleeperInvulnerableVisualComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }
}