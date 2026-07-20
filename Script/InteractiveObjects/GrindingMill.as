UCLASS()
class UIoGrindingMill: UDefaultInteractive
{
	default m_Name = "GrindingMill";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_GrindOre;
    default m_UsableByPlayer = false;
};