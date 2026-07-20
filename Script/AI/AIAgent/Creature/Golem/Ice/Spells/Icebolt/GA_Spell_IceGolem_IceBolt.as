class UGA_Spell_IceGolem_IceBolt : UGA_Spell_SpawnRepeatingProjectile
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();

    int m_Index = 1;
    int m_NumSections = 0;
    bool m_DoOnce = true;
    bool m_IsTargetLost = true;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Ice/BP_IceBoltActor_IceGolem.BP_IceBoltActor_IceGolem_C'";
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnMinigolemActorPath = n"Blueprint'/Game/Items/Magic/Golem/Ice/BP_IceBoltActor_MiniIceGolem.BP_IceBoltActor_MiniIceGolem_C'";

    UPROPERTY()
    TSubclassOf<USpellProjectileConfig> m_SpellConfigClass = UProjectileSpellConfig_IceBolt_IceGolem::StaticClass();

    UProjectileSpellConfig_IceBolt_IceGolem m_SpellConfig;
    float m_ShootingFrontAngle = 100;


    UPROPERTY()
    UDelegateHandleContainer m_EndRequestHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_Index = 1;
        m_NumSections = GetNumSectionsLaunchSpellMontage();
        m_DoOnce = true;

        if(IsMinigolem())
        {
            if(!m_SpawnMinigolemActorPath.IsValid())
                MagicScript::GetPreloaded(m_SpawnMinigolemActorPath);
        }
        else
        {
            if(!m_SpawnActorPath.IsValid())
                MagicScript::GetPreloaded(m_SpawnActorPath);
        }

        m_EndRequestHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Icebolt_IceGolem_End, this, n"OnEndRequest");
        m_SpellConfig = Cast<UProjectileSpellConfig_IceBolt_IceGolem>(m_SpellConfigClass.Get().DefaultObject);
    }
   
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        if(IsMinigolem())
        {
            return m_SpawnMinigolemActorPath.Get();
        }
        else
        {
            return m_SpawnActorPath.Get();
        }
    }

    bool IsMinigolem() const
    {
        return Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).IsSpecies(GameplayTag::Species_Creature_Golem_Ice_Mini);
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnPlayLaunchSpellServer_Scriptable()
    {
        if(m_NumSections == 0 || m_IsTargetLost)
        {
            DoEndSpellAction();
            return;
        }

        if(m_Index > m_NumSections)
        {
            //@DE - Wait to end notify
            return;
        }

        m_Index++;
        if(m_DoOnce)
        {
            m_DoOnce = false;
            PlayLaunchSpellMontage_Scriptable(NAME_None, false);
        }
       
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_EndRequestHandle);
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        FVector SocketWorldLocation = MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetLocation();
        return SocketWorldLocation;
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        return MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetRotation().Rotator();
    }

    UFUNCTION(BlueprintOverride)
    bool IsAccesible_Scriptable(AGothicCharacter Character, FVector LocationToSpawn,
                                USpellProjectileDefinition ProjectileDefinition,
                                FVector& TargetLocation, FHitResult& outHitResult)
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();

        const auto headBoneTransform = MagicScript::GetCharacterBoneTransformGivenABoneName(Character, n"head");
        auto target = Character.GetGothicAI().CharacterOfInterest;
        auto LookAtDataModule = DataModule::GetLookAtDataModule(Character);
        auto lookingPoint = LookAtDataModule.GetLookAtPoint();
        auto lookAtRotation = LookAtDataModule.GetLookAtRotation().Euler();
        
        
        //Print(FString::ApplyFormat(lookAtRotation, FString()));
        //auto lookingDirection = headBoneTransform.GetRotation().ForwardVector;
        //System::DrawDebugSphere(possibleTargetLocation, 5, 12, FLinearColor::Green, 50);
        //System::DrawDebugLine(headBoneTransform.GetLocation(), possibleTargetLocation, FLinearColor::Yellow, 5);
        //System::DrawDebugLine(headBoneTransform.GetLocation(), headBoneTransform.GetLocation() + m_MoveComp.Get().ControllerRotation.GetForwardVector() * 1000, FLinearColor::Green, 15);

        m_IsTargetLost = true;

        if(target == nullptr)
        {
            VLog::LogInfo(Character, "[UGA_Spell_IceGolem_IceBolt] No target found");
            TargetLocation = lookingPoint;
            outHitResult.Actor = nullptr;
    
            return false;
        }
        else
        {
            TargetLocation = target.GetActorLocation();
            outHitResult.Actor = target;
        }

        if(lookAtRotation.Z > 90.f || lookAtRotation.Z < -90.f)
        {
            //Shooting backwards.
            TargetLocation = lookingPoint;
            return false;
        }
        
        m_IsTargetLost = false;
        return true;

        // auto shootingDirection = TargetLocation - LocationToSpawn;
       
        // shootingDirection.Normalize();
        // auto a = lookingPoint;
        // a.Normalize();
        // const auto angle = Math::RadiansToDegrees(Math::Acos(a.DotProduct(shootingDirection)));
        
        // if(angle > m_ShootingFrontAngle*0.5f)
        // {   
        //     //Shooting backwards.
        //     TargetLocation = lookingPoint;

        //     return false;
        // }

        // m_IsTargetLost = false;
        // return true;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldForceIgnoreInput_Scriptable()
    {
        return true;
    }

}