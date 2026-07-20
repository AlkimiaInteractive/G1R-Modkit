
UCLASS()
class AGolemBase: AAIAgentCharacter
{
	default DefaultAIAgentConfig = UAIAgentConfig_Golem_Fire::StaticClass();

    UPROPERTY()
    TArray<FItemVirtualData> m_LootContainer;
    UPROPERTY()
    UDataModule_Container DataModule_Container;
    UPROPERTY()
    EInventoryTypes InventoryType = EInventoryTypes::MainContainer;

    UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    bool m_IgnoreLootVisualsActivation = false;
    
    
    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    bool m_ShouldCheckLoot = false;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponent()).HasTagExact(GameplayTag::State_Summoned))
            m_IgnoreLootVisualsActivation = true;
        InitializeVisuals();
        DataModule_Container = DataModule::GetContainerDataModule(this);
        if(IsDead())
        {
            InitializeLootCheck();
            OnDie();
        }
        else
            m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(this, GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
    }

	void InitializeLootCheck()
	{
        m_ShouldCheckLoot = true;
	}

    UFUNCTION(BlueprintEvent)
    void InitializeVisuals()
    {

    }

    UFUNCTION(BlueprintEvent)
    void OnDie()
    {

    }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(this, m_OnDieMeBeforeHandle);
        InitializeLootCheck();
        OnDie();
    }
    
	UFUNCTION(BlueprintOverride)
	void Tick(float DeltaSeconds)
	{
        if(m_ShouldCheckLoot)
        {
            m_LootContainer = DataModule_Container.GetItemsIn(InventoryType);
            if(HasEmptyLoot(m_LootContainer))
                OnEmptyLoot();
        }
	}

	bool HasEmptyLoot(TArray<FItemVirtualData> LootContainer)
	{
        if(LootContainer.IsEmpty())
            return true;
        for(auto item : LootContainer)
		{
            if(item.m_SlotData.m_ItemDefinition != nullptr)
                return false;
		}
        return true;
	}

    void OnEmptyLoot()
    {
        //@DE - There is a delay activation on the loot when the game loads. so prevent the loot activation
        m_IgnoreLootVisualsActivation = true;
        m_ShouldCheckLoot = false;
        EmptyLootEvent();
    }

    UFUNCTION(BlueprintEvent)
    void EmptyLootEvent()
    {

    }
}