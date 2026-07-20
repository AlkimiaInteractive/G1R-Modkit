UCLASS()
class AGornSleeper_ElectrifiedArea : AGothicGASActor
{

    UPROPERTY()
    TSoftClassPtr<AActor> m_CellClass = n"Blueprint'/Game/Blueprints/SleeperBattles/Gorn/BP_GornSleeper_ElectrifiedCell.BP_GornSleeper_ElectrifiedCell_C'";

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    TArray<AGornSleeper_ElectrifiedCell> m_Cells;
    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    AGornSleeper_ElectrifiedCell m_SelectedCellToActivate;

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
    bool m_WaitingForCellActivation = false;


    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_ArrowComponent;
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UTextRenderComponent m_TextRender;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_CellsRoot;

    UPROPERTY(DefaultComponent, Attach=m_CellsRoot)
    UGornSleeper_ElectrifiedCellPlacement m_CellPlacement0;
    UPROPERTY(DefaultComponent, Attach=m_CellPlacement0)
    UBoxComponent m_BoxComponentCellPlacement0;

    UPROPERTY(DefaultComponent, Attach=m_CellsRoot)
    UGornSleeper_ElectrifiedCellPlacement m_CellPlacement1;
    UPROPERTY(DefaultComponent, Attach=m_CellPlacement1)
    UBoxComponent m_BoxComponentCellPlacement1;

    UPROPERTY(DefaultComponent, Attach=m_CellsRoot)
    UGornSleeper_ElectrifiedCellPlacement m_CellPlacement2;
    UPROPERTY(DefaultComponent, Attach=m_CellPlacement2)
    UBoxComponent m_BoxComponentCellPlacement2;


    UPROPERTY(DefaultComponent, Attach=m_CellsRoot)
    UGornSleeper_ElectrifiedCellPlacement m_CellPlacement3;
    UPROPERTY(DefaultComponent, Attach=m_CellPlacement3)
    UBoxComponent m_BoxComponentCellPlacement3;


    UPROPERTY()
    AGornSleeper_ElectrifiedAreaVisualManager m_ElectrifiedAreaVisualManager;

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsMap;

    TSubclassOf<UWeaponDefinition> weaponDef = UElectrifiedArena_GornSleeper::StaticClass();

    UPROPERTY()
    FName m_GornAxeSocket = n"RayStart";
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGornSleeper_OreMountain m_OreMountain0;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGornSleeper_OreMountain m_OreMountain1;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGornSleeper_OreMountain m_OreMountain2;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGornSleeper_OreMountain m_OreMountain3;

    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume0;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume1;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume2;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume3;


    UFUNCTION(BlueprintOverride)
    void ConstructionScript()
    {
        if(m_TextRender != nullptr)
        {
            m_TextRender.SetRelativeLocation(FVector(0,0,100));       
            m_TextRender.SetText(FText::AsCultureInvariant(FString(GetName())));
            m_TextRender.SetTextRenderColor(FColor::Green);
            m_TextRender.SetHorizontalAlignment(EHorizTextAligment::EHTA_Center);
            m_TextRender.SetVerticalAlignment(EVerticalTextAligment::EVRTA_TextCenter);
            m_TextRender.SetHiddenInGame(true);
        }
        if(m_ArrowComponent != nullptr)
        {
            m_ArrowComponent.SetWorldRotation(FRotator(90, 0, 0));
            m_ArrowComponent.SetHiddenInGame(true);
        }      

        InitializeBoxProxy(m_BoxComponentCellPlacement0);
        InitializeBoxProxy(m_BoxComponentCellPlacement1);
        InitializeBoxProxy(m_BoxComponentCellPlacement2);
        InitializeBoxProxy(m_BoxComponentCellPlacement3);

    }

    void InitializeBoxProxy(UBoxComponent BoxComponentCellPlacement)
    {
        BoxComponentCellPlacement.SetCollisionEnabled(ECollisionEnabled::NoCollision);
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!HasAuthority())
            return;
        if(!m_CellClass.IsValid())
            MagicScript::GetPreloaded(m_CellClass);
        ValidateOreMountains();
        SpawnCell(m_CellPlacement0, m_BoxComponentCellPlacement0, m_OreMountain0, m_DetectionRegionVolume0);
        SpawnCell(m_CellPlacement1, m_BoxComponentCellPlacement1, m_OreMountain1, m_DetectionRegionVolume1);
        SpawnCell(m_CellPlacement2, m_BoxComponentCellPlacement2, m_OreMountain2, m_DetectionRegionVolume2);
        SpawnCell(m_CellPlacement3, m_BoxComponentCellPlacement3, m_OreMountain3, m_DetectionRegionVolume3);
    }

    void ValidateOreMountains()
    {
        CheckOreMountain(m_OreMountain0);
        CheckOreMountain(m_OreMountain1);
        CheckOreMountain(m_OreMountain2);
        CheckOreMountain(m_OreMountain3);
    }

    void CheckOreMountain(AGornSleeper_OreMountain OreMountain)
    {
        if(OreMountain == nullptr)
        {
            FString text = FString("OreMountain is EMPTY on: ");
            text.Append(FString(GetName()));
            PrintError(text, 50.f);
        }
    }

    void SpawnCell(UGornSleeper_ElectrifiedCellPlacement CellPlacement, UBoxComponent BoxComponentCellPlacement, AGornSleeper_OreMountain OreMountain, ARegionVolume DetectionRegionVolume)
    {
        AGornSleeper_ElectrifiedCell cell = Cast<AGornSleeper_ElectrifiedCell>(SpawnActor(m_CellClass.Get(), 
        CellPlacement.GetWorldLocation(), CellPlacement.GetWorldRotation()));
        cell.SetExtent(BoxComponentCellPlacement.BoxExtent);
        cell.m_PlacementId = CellPlacement.m_PlacementId;
        cell.m_ElectrifiedAreaVisualManager = m_ElectrifiedAreaVisualManager;
        cell.m_ElectrifiedArea = this;
        cell.m_OreMountain = OreMountain;
        cell.m_DetectionRegionVolume = DetectionRegionVolume;
        m_Cells.Add(cell);
    }

    void InitializeOwner(AActor NewOwner)
    {
        SetOwner(NewOwner);
        for(auto cell : m_Cells)
        {
            cell.SetOwner(NewOwner);
            cell.m_OreMountain.SetOwner(NewOwner);
        }
    }

    bool IsWaitingForCellActivation()
    {
        return m_WaitingForCellActivation;
    }

    void SelectCellToActivate(AActor Target)
    {
        m_SelectedCellToActivate = FindCloserCellToTarget(Target);
    }

    void EnableVisualWarning()
    {
        if(m_SelectedCellToActivate != nullptr)
        {
            m_SelectedCellToActivate.EnableVisualWarning();
        }
    }

    bool ActivateCell()
    {
        bool result = false;
        if(m_SelectedCellToActivate != nullptr)
        {
            m_SelectedCellToActivate.Initialize();
            result = true;
        }
        m_SelectedCellToActivate == nullptr;
        m_WaitingForCellActivation = false;

        return result;
    }

    AGornSleeper_ElectrifiedCell FindCloserCellToTarget(AActor Target)
    {
        if(m_Cells.Num() == 0)
            return nullptr;     
        if(Target == nullptr)
             return FindCloserCellByActorLocation(m_Cells, GetOwner().GetActorLocation());
        return FindCloserCellByActorLocation(m_Cells, Target.GetActorLocation());
    }

    AGornSleeper_ElectrifiedCell FindCloserCellByActorLocation(TArray<AGornSleeper_ElectrifiedCell> Cells, FVector OriginActorLocation)
    {
        float distance = MAX_flt;
        AGornSleeper_ElectrifiedCell selectedCell = nullptr;

        for(auto cell : Cells)
        {
            if(cell.IsActive())
                continue;
            float currentDistance = cell.GetActorLocation().Distance(OriginActorLocation);
            if(currentDistance < distance)
            {
                distance = currentDistance;
                selectedCell = cell;
            }
        }

        return selectedCell;
    }

    void DeactivateArea()
    {
        for(auto cell : m_Cells)
        {
            cell.DeactivateCell();
        }
        if(m_ElectrifiedAreaVisualManager != nullptr)
            m_ElectrifiedAreaVisualManager.DeactivateCells();
    }

    void OnRequestSpawnRayOnCell(AGothicCharacter InstigatorCharacter)
    {
        FVector getOriginPosition = GetRaySpawnLocation(InstigatorCharacter);
        if(m_SelectedCellToActivate != nullptr)
        {
            m_SelectedCellToActivate.SpawnRayOnCell(getOriginPosition);
        }
    }

    FVector GetRaySpawnLocation(AGothicCharacter InstigatorCharacter)
    {
        auto itemVisual = Cast<AMeleeWeaponVisual>(InstigatorCharacter.GetCarryComponent().GetItemVisual());
        auto staticMesh = Cast<UStaticMeshComponent>(itemVisual.GetComponentByClass(UStaticMeshComponent::StaticClass()));
        auto socketLocation = staticMesh.GetSocketLocation(m_GornAxeSocket);
        FHitResult hit;
        MagicScript::FindFloorAtLocation(socketLocation, hit, this, ECollisionChannel::IKTrace, m_MinFloorHeight, m_MaxFloorHeight);
        return hit.ImpactPoint;
    }
}

UCLASS()
class UGornSleeper_ElectrifiedCellPlacement : USceneComponent
{
    UPROPERTY()
    int m_PlacementId = 0;
}


