UCLASS()
class UIO_OrcFoodSmasher: UDefaultInteractive
{
	default m_Name = "OrcFoodSmasher";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_SmashFood;
    default m_UsableByPlayer = false;
};