UCLASS()
class UIO_BookCase: UDefaultInteractive
{
	default m_Name = "BookCase";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_ReadBook_Shell;
    default m_UsableByPlayer = false;
};