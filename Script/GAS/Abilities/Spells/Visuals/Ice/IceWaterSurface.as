UCLASS()
class UIceWaterSurfaceItemDefinition : UItemDefinition
{
    default m_ItemGeneric = n"Blueprint'/Game/Items/Magic/Environment/BP_IceWaterSurface_Actor.BP_IceWaterSurface_Actor_C'";
};

UCLASS(Blueprintable)
class AIceWaterSurface : ASpellVisualSaveable
{
    default bReplicates = true;
    
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY()
    bool m_EnableSurfaceMovement = true;

    UPROPERTY()
    float m_MovementOffset = 1.f;

    UPROPERTY()
    float m_MinMovementOffset = 6.f;

    UPROPERTY()
    float m_MaxMovementOffset = 10.f;

    UPROPERTY()
    float m_MinLifeTime = 6.f;

    UPROPERTY()
    float m_MaxLifeTime = 8.f;

    UPROPERTY()
    float m_CurrentLifeTime = -1.f;

    default m_ItemDefinition = UIceWaterSurfaceItemDefinition::StaticClass();

    const FName ICE_WATER_SURFACE_LIFETIME_DATA = n"ICE_WATER_SURFACE_LIFETIME_DATA";
    const FName ICE_WATER_SURFACE_OWNER_DATA = n"ICE_WATER_SURFACE_OWNER_DATA";

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_MovementOffset = Math::RandRange(m_MinMovementOffset, m_MaxMovementOffset);   
    }

    UFUNCTION(BlueprintOverride)
    void OnFillSaveData_Scriptable(FReplicatedStringMap& data)
    {
        FVector life(BP_GetRemainingTime(), 0.0f, 0.0f);
        AddDataInto(data, ICE_WATER_SURFACE_LIFETIME_DATA, life.ToString());     
    }

    UFUNCTION(BlueprintOverride)
    void OnRecoveredSavedData_Scriptable(const FReplicatedStringMap& data)
    {
        if(ContainsData(data, ICE_WATER_SURFACE_LIFETIME_DATA))
        {
            const auto lifeString = GetDataFrom(data, ICE_WATER_SURFACE_LIFETIME_DATA);
            FVector newLifeVector;
            newLifeVector.InitFromString(lifeString);
            m_CurrentLifeTime = newLifeVector.X;
        }
    }

    //To be filled by the blueprint.
    UFUNCTION(BlueprintEvent)
    float BP_GetRemainingTime() const
    {
        return m_CurrentLifeTime;
    }
}