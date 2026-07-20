
UCLASS()
class UIoDoorDefault: UDefaultInteractive
{
    default m_Name = "Door";
    default m_Icon = "Apfel2DIcon";
    default m_Description = "ApfelDesc";
    default m_DefaultInteraction = GameplayTag::Action_Open_Door;
};