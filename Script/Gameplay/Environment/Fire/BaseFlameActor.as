

enum EFlameSize
{
    Small,
    Medium,
    Large
}

UCLASS()
class ABaseFlameActor : AInteractiveGasObjectActor
{
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    EFlameSize m_FlameSize = EFlameSize::Small;
}