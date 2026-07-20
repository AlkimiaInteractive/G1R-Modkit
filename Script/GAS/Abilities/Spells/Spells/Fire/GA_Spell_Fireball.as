class URechargeableSpellConfigLevelData : USpellConfigLevelData
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath;
    //@DE - Added to allow override the default projectile config without duplicate the asset. Ex. Miten Sleeper fireball
    UPROPERTY()
    TSubclassOf<USpellProjectileDefinition> m_WeaponConfigOverride;

    UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
    int m_Lvl = 0;
}


class UFireballSpellConfigLevelData : URechargeableSpellConfigLevelData
{
    //float m_ChannelingCostSg = 1.f;
}

class USpellConfigLevelData_FireBall_lvl1 : UFireballSpellConfigLevelData
{
    
	default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl1.BP_Fireball_lvl1_C'";
    default m_Lvl = 1;
}

class USpellConfigLevelData_FireBall_lvl2 : UFireballSpellConfigLevelData
{
	default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl2.BP_Fireball_lvl2_C'";
    default m_Lvl = 2;
   
}

class USpellConfigLevelData_FireBall_lvl3 : UFireballSpellConfigLevelData
{
    //default m_ChannelingCostSg = 0.0010f;

	default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/BP_Fireball_lvl3.BP_Fireball_lvl3_C'";
    default m_Lvl = 3;
   
}


class UGA_Spell_Fireball : UGA_Spell_SpawnRechargeableProjectile
{

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	TSubclassOf<UGameplayEffect> m_GE_Channeling = UGE_Mana_Channeling::StaticClass();

    UPROPERTY()
    bool m_IsChannelling = false;

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return !IsLastSpellLevel();
    }

    float GetLevelChannelingCostSg()
    {
        // auto configLevelData = Cast<UFireballSpellConfigLevelData>(GetLevelSpellConfigData());
        // if(configLevelData == nullptr)
        //     return 0.f;

        // return configLevelData.m_ChannelingCostSg;
        return GetSpellManaCostPerSecond();
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        auto configLevelData = GetLevelSpellConfigData();
        if(configLevelData == nullptr)
            return nullptr;
        return configLevelData.m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spellConfig = GetSpellConfigurationContainer().GetSpellConfig();
        const auto locationFromBone = MagicScript::GetCharacterBoneTransformGivenABoneName(owner, spellConfig.GetSpawnLocationSocketName()).GetLocation();
        return locationFromBone + owner.GetActorForwardVector() * 50; //1/2m forward to avoid rootmotion
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
    {
		Super::OnActorSpawnedServer_Scriptable(actorSpawned);

        //Log("Spell level: " + GetCurrentSpellLevel());

        m_IsChannelling = false;
    
        if(IsLastSpellLevel() && CanDoChanneling())
        {
            m_IsChannelling = true;
            ApplyManaEffect(-GetLevelChannelingCostSg(), -1, m_GE_Channeling);
        } 

        m_Projectile.OnEndPlay.AddUFunction(this, n"OnProjectileEndPlay");
        m_Projectile.OnCollide.AddUFunction(this, n"OnProjectileDestroyed");
        m_ProjectileDefinition = Cast<USpellProjectileDefinition>(m_Projectile.GetWeaponDefinition().Get().GetDefaultObject());

        PlaySFX();
    }

    //@DE - Humans can do channeling. Created for orc Shamans
    bool CanDoChanneling()
    {
        return true;
    }

    void PlaySFX()
    {
        FGameplayTag SFXLaunch = GetSFXTagByLevel();

        

        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto fxComponent = character.GetFXComponent();

        fxComponent.PlayEffect(SFXLaunch, nullptr);
    }

    FGameplayTag GetSFXTagByLevel()
    {
        FGameplayTag SFXLaunch = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level1;
        switch(GetCurrentSpellLevel())
        {
            case 0:
                SFXLaunch = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level1;
                break;
            case 1:
                SFXLaunch = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level2;
                break;
            case 2:
                SFXLaunch = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level3;
            break;
            default:
                SFXLaunch = GameplayTag::FX_Magic_Spell_FireBall_Launch_Level1;
                break;
        }
        return SFXLaunch;
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateSpellServer_Scriptable(float DeltaTime)
    {
        if(!m_IsChannelling)
        {
            return;
        }

		Super::OnUpdateSpellServer_Scriptable(DeltaTime);
    }
    
    UFUNCTION()
    void OnProjectileEndPlay(AActor DestroyedActor, EEndPlayReason EEndPlayReason)
    {    
        OnProjectileDestroyed(DestroyedActor);
    }

    UFUNCTION()
    void OnProjectileDestroyed(AActor DestroyedActor)
    {    
        ASpellBallVisual_AS projectile = Cast<ASpellBallVisual_AS>(DestroyedActor);    
        if(projectile != nullptr && projectile == m_Projectile)
        {
            m_Projectile.OnEndPlay.Unbind(this, n"OnProjectileEndPlay");
            m_Projectile.OnCollide.Unbind(this, n"OnProjectileDestroyed");
        }
	    if(m_IsChannelling)
	    {
            DoEndSpellAction();
            
	    } 
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        if(m_Projectile != nullptr)
        {
            m_Projectile.OnEndPlay.Unbind(this, n"OnProjectileEndPlay");
            m_Projectile.OnCollide.Unbind(this, n"OnProjectileDestroyed");
        }
        
        const auto character = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        character.GetFXComponent().StopFXInstancesWithTag(GameplayTag::FX_Magic_Spell_FireBall_HoldLoop, false); 
    }

}