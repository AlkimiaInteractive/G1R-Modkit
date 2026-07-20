class UBallLightningSpellConfigLevelData : URechargeableSpellConfigLevelData
{
    UPROPERTY()
    TSubclassOf<UBallLightningDefinition_Base> m_LevelProjectileDefinition;
	default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning.BP_BallLightning_C'";
}

class USpellConfigLevelData_BallLightning_Lvl1 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Lvl1::StaticClass();
    default m_Lvl = 1;
}

class USpellConfigLevelData_BallLightning_Lvl2 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Lvl2::StaticClass();
    default m_Lvl = 2;
}

class USpellConfigLevelData_BallLightning_Lvl3 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Lvl3::StaticClass();
    default m_Lvl = 3;
}

class USpellConfigLevelData_BallLightning_Lvl4 : UBallLightningSpellConfigLevelData
{
    default m_LevelProjectileDefinition = UBallLightningDefinition_Lvl4::StaticClass();
    default m_Lvl = 4;
}


class UGA_Spell_BallLightning : UGA_Spell_SpawnRechargeableProjectile
{
    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return true;
    }

    TSubclassOf<UBallLightningDefinition_Base> GetLevelProjectileDefinition()
    {
        auto configLevelData = Cast<UBallLightningSpellConfigLevelData>(GetLevelSpellConfigData());
        if(configLevelData == nullptr)
            return nullptr;

        return configLevelData.m_LevelProjectileDefinition;
    }

    int GetLevelProjectileLevel()
    {
        auto configLevelData = Cast<UBallLightningSpellConfigLevelData>(GetLevelSpellConfigData());
        if(configLevelData == nullptr)
            return 0;

        return configLevelData.m_Lvl;
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        auto right = MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetLocation();
        auto left =  MagicScript::GetCharacterBoneTransformGivenABoneName(owner, n"weapon_l").GetLocation();
        auto center = (right+left) / 2;
        //System::DrawDebugSphere(c, 10.f, 32, FLinearColor::Red, 20.f, 10.f);
        return center;
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned) 
    {
        Super::OnActorSpawnedServer_Scriptable(ActorSpawned);
        ABallLightningVisual projectileVisual = Cast<ABallLightningVisual>(ActorSpawned);
        if(projectileVisual != nullptr)
        {
            SetOwnerAndInstigator(projectileVisual);
            //projectileVisual.IgnoreActors(projectileVisual.m_CollisionComp, GetAvatarActorFromActorInfo());
            projectileVisual.SetSpellLevel(GetLevelProjectileLevel());
            projectileVisual.m_CollisionComp.m_WeaponData = GetLevelProjectileDefinition();
            projectileVisual.OnProjectileFired(GetLevelProjectileDefinition());
            SetProjectileDirectionAndVelocity(projectileVisual);
            PlayLaunchFXSound();
        }
    }

    void PlayLaunchFXSound()
    {
        int spellLevel = GetCurrentSpellLevel();
        if(spellLevel == 0)
        {
            //FX small
        }
        else if(spellLevel == 1)
        {
            //FX mid
        }
        else if(spellLevel == 2)
        {
            //FX big
        }
        else 
        {
            //FX bigger
        }
    }

    void SetProjectileDirectionAndVelocity(ABallLightningVisual projectileVisual)
    {
        const auto spellProjectileDefinition = Cast<UBallLightningDefinition_Base>(projectileVisual.m_CollisionComp.m_WeaponData.Get().GetDefaultObject());
        projectileVisual.SetVelocity(projectileVisual.m_SpawnDirection * spellProjectileDefinition.m_Speed);    
    }

    void SetOwnerAndInstigator(AActor ActorSpawned)
    {
        APawn pawn = Cast<APawn>(GetActorInfo().GetAvatarActor());

        ActorSpawned.SetOwner(GetActorInfo().GetAvatarActor());
        //ActorSpawned.SetInstigator(pawn);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        //Print("END SPELL", 10.f, FLinearColor::Green);
    }

}

