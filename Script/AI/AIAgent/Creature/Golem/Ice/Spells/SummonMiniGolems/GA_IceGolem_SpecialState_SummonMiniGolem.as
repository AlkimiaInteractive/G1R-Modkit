//* @DE - Deprecated. The BP_MiniGolemIceRockSpawnerActor_IceGolem_C will be in the map so we dont need summon them
class UGA_IceGolem_SpecialState_SummonMiniGolem : UGameplayAbilityCreatureSpecialState
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Golem/Ice/BP_MiniGolemIceRockSpawnerActor_IceGolem.BP_MiniGolemIceRockSpawnerActor_IceGolem_C'";

    //default AbilityTags.AddTag(GameplayTag)

    default m_StateGameplayTag = GameplayTag::State_Knockback;

    UPROPERTY()
    USummonIceMiniGolemSpawnPlaceHelper m_SummonIceMiniGolemSpawnPlaceHelper;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	FAISpawnData m_CharacterToSpawn;

    TSubclassOf<USpellConfig> m_SpellConfigClass = USummonIceMiniGolem_IceGolem_SpellConfig::StaticClass();
    USummonIceMiniGolem_IceGolem_SpellConfig m_Config;

    FVector m_ValidSpawnPosition;
 

    UGA_IceGolem_SpecialState_SummonMiniGolem()
    {
        //@DE - Due AS fields Initialization. Its necessary set the tag explicitally instead m_StateGameplayTag
        TriggerBeginOn(GameplayTag::State_Knockback);
        if(IsValid(Cast<USummonIceMiniGolem_IceGolem_SpellConfig>(m_SpellConfigClass.Get().DefaultObject)))
        {
            m_Config = Cast<USummonIceMiniGolem_IceGolem_SpellConfig>(m_SpellConfigClass.Get().DefaultObject);
        }
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto currentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        auto maxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        bool successCurrentHealth = false;
        bool successMaxHealth = false;
        auto currentHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), currentValueAttribute, successCurrentHealth);
        auto maxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), maxValueAttribute, successMaxHealth);
        
        if(!successMaxHealth || !successCurrentHealth || currentHealth < maxHealth * m_Config.m_SpawnCreatureHealthPercentageUpper)
            return false;
       
        TArray<AActor> outActors;
        GetAllActorsOfClass(AMiniGolemIceRockSpawnerVisual::StaticClass(), outActors);
        if(outActors.Num() >= m_Config.m_MaxSpawnCount)
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        //Print(FString("UGA_IceGolem_SpecialState_SummonMiniGolem - OnActivateAbility_Scriptable "));
        if(!m_SpawnActorPath.IsValid())
            MagicScript::GetPreloaded(m_SpawnActorPath);
        m_SummonIceMiniGolemSpawnPlaceHelper = Cast<USummonIceMiniGolemSpawnPlaceHelper>(NewObject(this, USummonIceMiniGolemSpawnPlaceHelper::StaticClass()));
        //m_Config = Cast<USummonIceMiniGolem_IceGolem_SpellConfig>(m_spellConfigClass.Get().DefaultObject);
        m_SummonIceMiniGolemSpawnPlaceHelper.m_Owner = GetAvatarActorFromActorInfo();
        SetupConfig();
        if(HasValidSpawnPosition())
            DoSpawnStateActorServer();
    }


    bool HasValidSpawnPosition()
    {
        AAIAgentCharacter default_character = m_SummonIceMiniGolemSpawnPlaceHelper.GetSummonCharacter(m_CharacterToSpawn);
        FVector desired_pos;

        m_SummonIceMiniGolemSpawnPlaceHelper.m_Odd = false;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_CurrentAngle = 0;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_CurrentDistance = m_SummonIceMiniGolemSpawnPlaceHelper.m_MinSummonDistance;
        
        if(m_SummonIceMiniGolemSpawnPlaceHelper.TryToGetValidSpawnPlace(GetAvatarActorFromActorInfo(), desired_pos, default_character))
        {
            m_ValidSpawnPosition = desired_pos;
            return true;
        }

        auto aiChar = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        if(aiChar == nullptr)
            return false;
        auto target = aiChar.GetTargetedActor();
        if(target == nullptr)
            return false;

        if(m_SummonIceMiniGolemSpawnPlaceHelper.TryToGetValidSpawnPlace(target, desired_pos, default_character))
        {
            m_ValidSpawnPosition = desired_pos;
            return true;
        }
        for(int i=0; i < m_Config.m_SpawnAttemptRadius; i++)
        {
            if(m_SummonIceMiniGolemSpawnPlaceHelper.TryToGetValidRandomInCircleSpawnPlace(target, desired_pos, default_character))
            {
                m_ValidSpawnPosition = desired_pos;
                return true;
            }
        }
        return false;
    }

    void SetupConfig()
    {
        m_CharacterToSpawn = m_Config.m_CharacterToSpawn;

        m_SummonIceMiniGolemSpawnPlaceHelper.m_MinSummonDistance = m_Config.m_MinSummonDistance;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_MaxSummonDistance = m_Config.m_MaxSummonDistance;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_AngleInterval = m_Config.m_AngleInterval;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_DistanceInterval = m_Config.m_DistanceInterval;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_SpawnAttemptRadius = m_Config.m_SpawnAttemptRadius;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_CreatureSpawnAttempts = m_Config.m_CreatureSpawnAttempts;
        m_SummonIceMiniGolemSpawnPlaceHelper.m_ActorsToIgnore.Add(GetAvatarActorFromActorInfo());
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner,
                                              TSubclassOf<UObject> actorToSpawnClass) const
    {
        return m_ValidSpawnPosition;
    }

    UFUNCTION(BlueprintOverride)
    FRotator GetSpawnRotationServer_Scriptable(AGothicCharacter owner,
                                               TSubclassOf<UObject> actorToSpawnClass) const
    {
        return GetAvatarActorFromActorInfo().GetActorRotation();
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        //Print("OnActorSpawnedServer_Scriptable(AActor ActorSpawned)");
        auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(ActorSpawned);
        if(spawnerRock != nullptr)
        {
            spawnerRock.m_ConfigClass = m_SpellConfigClass;
            spawnerRock.SetOwner(GetAvatarActorFromActorInfo());
        }
    }

    
}