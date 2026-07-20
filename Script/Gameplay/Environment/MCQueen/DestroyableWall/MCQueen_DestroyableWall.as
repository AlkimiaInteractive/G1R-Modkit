UCLASS()
class AMCQueen_DestroyableWall : AActor
{
    default bReplicates = true;

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_Wall;
    UPROPERTY(DefaultComponent, Attach=m_Wall)
    UBoxComponent m_InvisibleWall;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UStaticMeshComponent m_FloorVeins;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"MCQueen_DestroyableWall_Destroyed";

    
    UPROPERTY(Replicated)
    bool m_Active = false;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(GetLocalRole() != ENetRole::ROLE_Authority)
        {
            if(m_Active)
                DeactivateEnvironment();
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                m_Active = true;
                DeactivateEnvironment();
            }
        }
        
    }


    UFUNCTION(BlueprintCallable)
    void DoDestroyWall()
    {
        if(GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        m_Active = true;
        DeactivateEnvironment();
        DoDestroyVisuals();
    }

    UFUNCTION(NetMulticast)
    void DeactivateEnvironment()
    {
        m_Wall.SetHiddenInGame(true);
        m_FloorVeins.SetHiddenInGame(true);
        m_InvisibleWall.SetCollisionEnabled(ECollisionEnabled::NoCollision);
        DeactivateEnvironmentEvent();
    }

    UFUNCTION(BlueprintEvent)
    void DeactivateEnvironmentEvent()
    {
    }

    UFUNCTION(BlueprintEvent)
    void DoDestroyVisuals()
    {

    }
}