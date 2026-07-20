class UBattleBlockingBarrierComponent : UGothicGenericMagicComponent 
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite, NotVisible, Replicated)
    TArray<UStaticMeshComponent> m_BlockingMeshes;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ARegionVolume m_DetectionRegionVolume;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TArray<ARegionVolume> m_EntranceDetectionRegionVolumes;

    default bReplicates = true;

    UPROPERTY(NotVisible)
    URegionTrait_BattlePlayerBlockingBarrier m_RegionTrait;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    bool m_Activated = true;

    UPROPERTY()
    TArray<AGothicCharacterState> m_ActiveCharacters;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_UGE_BlockingTeleport = UGE_BattleBarrierBlockTeleport::StaticClass();

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {       
        if(!m_Activated)
            return;

        TArray<UActorComponent> outComps;
        GetOwner().GetComponentsByClass(UStaticMeshComponent::StaticClass(), outComps);

        for(auto comp : outComps)
        {   auto blockingMesh = Cast<UStaticMeshComponent>(comp);
            m_BlockingMeshes.Add(blockingMesh);
        }

        m_RegionTrait= GetRegionTrait();
        if(m_RegionTrait == nullptr)
        {
            FString text = FString("regionTrait is EMPTY on: ");
            text.Append(FString(GetOwner().GetName()));
            PrintError(text, 50.f);
            return;
        }

        m_RegionTrait.OnCharacterEnteringRegionDelegate.BindUFunction(this, n"OnCharacterEnteringRegionDelegate");
        m_RegionTrait.OnCharacterLeavingRegionDelegate.BindUFunction(this, n"OnCharacterLeavingRegionDelegate");

        InitializeEntranceVolumes();
        
    }

    void InitializeEntranceVolumes()
    {
        for(auto detectionVolume : m_EntranceDetectionRegionVolumes)
        {
            auto trait = Cast<URegionTrait_BattlePlayerBlockingBarrier>(detectionVolume.FindTraitByClass(URegionTrait_BattlePlayerBlockingBarrier::StaticClass()));
            if(trait != nullptr)
            {
                trait.OnCharacterEnteringRegionDelegate.BindUFunction(this, n"OnCharacterEnteringEntranceRegionDelegate");
                trait.OnCharacterLeavingRegionDelegate.BindUFunction(this, n"OnCharacterLeavingEntranceRegionDelegate");
                trait.m_ShouldHandleCharacter = true;
            }
        }
    }

    UFUNCTION(BlueprintCallable)
    void ActivateBlockCheck()
    {
        m_ActiveCharacters.Empty();
        //Print("Initialize");
        auto allPlayers = MagicScript::GetAllPlayers(GetOwner());
        for(auto playerState : allPlayers)
        {
            IgnoreAllMeshes(playerState.Character, true);
            TryIgnoreSpawnedCreatures(playerState.Character);
        }
        GetRegionTrait().m_ShouldHandleCharacter = true;
        
    }

    void TryIgnoreSpawnedCreatures(AGothicCharacter Character)
    {
        auto summonComp = USummonManagerComponent::Get(Character);
        if(summonComp == nullptr)
            return;
        for(auto creature : summonComp.m_SpawnedCreatures)
        {
            IgnoreAllMeshes(creature, true);
        }
    }

    UFUNCTION(BlueprintCallable)
    void DeactivateBlockCheck()
    {
        for(auto character : m_ActiveCharacters)
        {
            auto abComp = character.AbilitySystemComponent;
            abComp.RemoveActiveGameplayEffectBySourceEffect(m_UGE_BlockingTeleport, nullptr);
        }
        GetRegionTrait().m_ShouldHandleCharacter = false;
    }

    URegionTrait_BattlePlayerBlockingBarrier GetRegionTrait()
    {
        if(m_RegionTrait != nullptr)
            return m_RegionTrait;
        if(m_DetectionRegionVolume == nullptr)
            return nullptr;
        return Cast<URegionTrait_BattlePlayerBlockingBarrier>(m_DetectionRegionVolume.FindTraitByClass(URegionTrait_BattlePlayerBlockingBarrier::StaticClass()));
    }

    UFUNCTION()
    void OnCharacterEnteringRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        if(m_ActiveCharacters.Contains(GothicCharacterState))
            return;

        m_ActiveCharacters.Add(GothicCharacterState);
        IgnoreAllMeshes(GothicCharacterState.Character, false);
        auto abComp = GothicCharacterState.AbilitySystemComponent;
        abComp.ApplyGameplayEffectToSelf(m_UGE_BlockingTeleport, 0, abComp.MakeEffectContext());
    }

    UFUNCTION()
    void OnCharacterLeavingRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        //Print("OnCharacterLeavingRegionDelegate");
    }


    
    UFUNCTION()
    void OnCharacterEnteringEntranceRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        if(!m_ActiveCharacters.Contains(GothicCharacterState))
            return;

        IgnoreAllMeshes(GothicCharacterState.Character, true);
        auto abComp = GothicCharacterState.AbilitySystemComponent;
        abComp.RemoveActiveGameplayEffectBySourceEffect(m_UGE_BlockingTeleport, nullptr);
        m_ActiveCharacters.Remove(GothicCharacterState);
    }

    UFUNCTION()
    void OnCharacterLeavingEntranceRegionDelegate(AGothicCharacterState GothicCharacterState)
    {
        //Print("OnCharacterLeavingRegionDelegate");
    }


    UFUNCTION(NetMulticast)
    void IgnoreAllMeshes(AGothicCharacter Character, bool ShouldIgnore)
    {
        for(auto blockingMesh : m_BlockingMeshes)
        {   
            if(blockingMesh != nullptr)
                IgnorePlayer(blockingMesh, Character, ShouldIgnore);
        }
    }

    void IgnorePlayer(UStaticMeshComponent BlockingMesh, AGothicCharacter Character, bool ShouldIgnore)
    {
        BlockingMesh.IgnoreActorWhenMoving(Character, ShouldIgnore);
        Character.CapsuleComponent.IgnoreComponentWhenMoving(BlockingMesh, ShouldIgnore);
        BlockingMesh.IgnoreComponentWhenMoving(Character.CapsuleComponent, ShouldIgnore);
    }

}

class UGE_BattleBarrierBlockTeleport : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Spell_Teleport_Blocked);
    //Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Spell_Teleport_Blocked);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}
