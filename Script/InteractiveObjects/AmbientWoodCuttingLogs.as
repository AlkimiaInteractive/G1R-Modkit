
UCLASS()
class UIoAmbientWoodCuttingLogs: UDefaultInteractive
{
	default m_Name = "WoodCuttingLogs";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_CutWood_OnTrunk;
    default m_UsableByPlayer = false;
};