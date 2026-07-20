UCLASS()
class UArenaFloorSinkingDefinition_FireGolem : UGothicBaseConfig
{    
    UPROPERTY()
    float m_SearchRadius = 3000.f;

    UPROPERTY()
    float m_MaxPlayerNotMoveTime = 5.f; //5.f;

    UPROPERTY()
    float m_Duration = 5.f;
}