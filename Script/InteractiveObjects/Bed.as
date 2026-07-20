
UCLASS()
class UIoBedDefault: UDefaultInteractive
{
	default m_Name = "Bed";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";

	default m_DefaultInteraction = GameplayTag::Action_Bed;
};

class UIoBedLow : UIoBedDefault
{
	default m_DefaultInteraction = GameplayTag::Action_Bed_Low;
};
    
class UIoBedHigh : UIoBedDefault
{
	default m_DefaultInteraction = GameplayTag::Action_Bed_High;
};

class UIoBedGround : UIoBedDefault
{
	default m_DefaultInteraction = GameplayTag::Action_Bed_Ground;
};