UCLASS()
class UIO_Bath: UDefaultInteractive
{
	default m_Name = "Bath";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_Bath;
    default m_UsableByPlayer = false;
};