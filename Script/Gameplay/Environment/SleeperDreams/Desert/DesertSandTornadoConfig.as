UCLASS()
class UDesertSandTornadoConfig : UGothicBaseConfig
{
    UPROPERTY()
    float m_TornadoIntroTime = 2.f;

    UPROPERTY()
    float m_TornadoRadiusStart = 2600.f;
    UPROPERTY()
    float m_TornadoRadiusFinal = 3000.f;
    UPROPERTY()
    float m_TornadoRadiusTime = 30.f;
    UPROPERTY()
    float m_TornadoRadiusTimeDelay = 0.f;

    UPROPERTY()
    float m_CollisionHeight = 3000.f;
    

}