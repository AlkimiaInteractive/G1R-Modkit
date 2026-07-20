UCLASS()
class UIO_NPCLectern: UDefaultInteractive
{
	default m_Name = "NPC_Interactive_Lectern";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_ReadBook_Lectern;
    default m_UsableByPlayer = false;
};