
UCLASS()
class UIoChairDefault: UDefaultInteractive
{
	default m_Name = "Chair";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Interact_Sit_Chair;
};

UCLASS()
class UIoBenchDefault: UIoChairDefault
{
	default m_Name = "Bench";
};

UCLASS()
class UIoBoxDefault: UIoChairDefault
{
	default m_Name = "Box";
};

UCLASS()
class UIoNyrasBenchDemoDefault: UIoChairDefault
{
	default m_Name = "Bench";
	default m_DefaultInteraction = GameplayTag::Action_Interact_Sit_Chair_Demo;
};

UCLASS()
class UIoGomezThroneDefault: UIoChairDefault
{
	default m_Name = "GomezThrone";
	default m_DefaultInteraction = GameplayTag::Action_Interact_Sit_Throne;
	default m_UsableByPlayer = false;
};