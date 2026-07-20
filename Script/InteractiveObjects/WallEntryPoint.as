UCLASS()
class UWallClimb: UDefaultInteractive
{
    default m_Name = "WallClimb";
    default m_Icon = "Apfel2DIcon";
    default m_Description = "ApfelDesc";
    default m_DefaultInteraction = GameplayTag::Action_InteractWallClimb;
    default m_PlayerInteractDistance = 75.0f;
};