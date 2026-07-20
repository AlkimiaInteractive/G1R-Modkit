UCLASS()
class UIoGrindingMachine: UDefaultInteractive
{
	default m_Name = "GrindingMachine";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_TurnWheel;
    default m_UsableByPlayer = false;
};