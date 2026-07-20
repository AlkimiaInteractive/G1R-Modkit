UCLASS()
class UGA_XardasSleeperInvulnerableVisualManager : UGA_InvulnerableVisualManager
{
    UInvulnerableVisualComponent GetInvulnerableVisualComponent() override
    {
        return UXardasSleeperInvulnerableVisualComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }
}