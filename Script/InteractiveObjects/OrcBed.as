UCLASS()
class UIO_OrcBed: UDefaultInteractive
{
	default m_Name = "OrcBed";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_Sleep;
    default m_UsableByPlayer = false;
};