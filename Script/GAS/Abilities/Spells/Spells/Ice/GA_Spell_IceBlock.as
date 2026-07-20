UCLASS()
class UGA_Spell_IceBlock : UGameplayAbilitySpellBasic
{

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/IceBlock/BP_IceBlock.BP_IceBlock_C'";

    default m_SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UPROPERTY()
    AIceBlock m_IceBlock;

    UPROPERTY()
    float m_SpellDuration;
    UPROPERTY()
    float m_CurrentDuration;
    UPROPERTY()
    bool m_EndedSpell;


    UPROPERTY()
    TSubclassOf<USpellConfig> m_spellConfig = UIceBlockSpellConfig::StaticClass();
    UPROPERTY()
    UIceBlockSpellConfig m_SepllDef;
   

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        if(!HasAuthority())
            return;

        m_SepllDef = Cast<UIceBlockSpellConfig>(m_spellConfig.Get().GetDefaultObject());
        m_SpellDuration = m_SepllDef.m_Duration;

    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        m_IceBlock = Cast<AIceBlock>(ActorSpawned);
        auto own = ActorSpawned.GetOwner();
        if(m_IceBlock != nullptr)
        {
            // const FVector pos = AvatarActorFromActorInfo.GetActorLocation();
            // const FRotator controllerRot = m_MoveComp.Get().GetControllerRotation();
            // const FRotator rot = FRotator(0.f, controllerRot.Yaw, controllerRot.Roll);

            // m_IceBlock.SetActorLocation(pos);
            // m_IceBlock.SetActorRotation(rot);
            m_IceBlock.EnableCollision();
            NotifySpellCategory();
        }

    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        //DebugScript::DrawSphere(AvatarActorFromActorInfo.GetActorLocation(), 10.0f, FColor::Red, 10.0f);
        return AvatarActorFromActorInfo.GetActorLocation();
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        const FRotator controllerRot = m_MoveComp.Get().GetControllerRotation();
        return FRotator(0.f, controllerRot.Yaw, controllerRot.Roll);
    }

}
