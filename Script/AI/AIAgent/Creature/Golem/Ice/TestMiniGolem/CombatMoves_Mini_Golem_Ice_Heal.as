UCLASS()
class UCM_Attack_MiniGolemIce_Heal : UCM_Attack_Right
{
    bool IsMoveAllowed(FString&out Reason) const override
    {
        if (!Super::IsMoveAllowed(Reason))
            return false;

        if (!Combat.CharacterOfInterest.IsA(AGolemIce))
            return false;

        return true;
    }
}