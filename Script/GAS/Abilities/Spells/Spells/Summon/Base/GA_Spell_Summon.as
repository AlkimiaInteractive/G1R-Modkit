class UGA_Spell_SummonAI : UGameplayAbilitySpellSummon
{

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<ASummonCreatureVisualEffect> m_SummonCreatureVisualEffectClass = n"Blueprint'/Game/Items/Magic/Summon/BP_SummonCreatureVisualEffect.BP_SummonCreatureVisualEffect_C'";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    TSubclassOf<USpell_Summon_Config_Base> m_SpellConfigClass;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    USpell_Summon_Config_Base m_SpellConfig;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TArray<FAISpawnData> m_CharactersToSpawn;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    ASummonCreatureVisualEffect m_SummonCreatureVisualEffect;

    UPROPERTY()
    USummonScrollSpawnPlaceHelper m_SummonSpawnPlaceHelper;

    UPROPERTY()
    USummonManagerComponent m_SummonManagerComponent;

    UPROPERTY()
    TArray<FAISpawnData> m_FailedToSpawn;


    UPROPERTY()
    float m_ZOffset = 15.f;

    // EXAMPLE INVOKER
    // UPROPERTY(EditAnywhere, BlueprintReadWrite)
    // AGothicInvokerActor SpawnInvoker;

    default m_SummonedEffect = UGE_SummonedNotVisible::StaticClass();

    UPROPERTY()
    float m_MinSummonDelay = 0.f;
    UPROPERTY()
    float m_MaxSummonDelay = 0.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

    UClass GetSummonCreatureVisualEffectClass_Scriptable() const
    {
        return m_SummonCreatureVisualEffectClass.Get();
    }


    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        m_SummonManagerComponent = CreateOrGetSummonManagetComponent();
        if(m_SummonManagerComponent == nullptr)
        {
            DoEndSpellAction();
            return;
        }
        m_SummonSpawnPlaceHelper = Cast<USummonScrollSpawnPlaceHelper>(NewObject(this, USummonScrollSpawnPlaceHelper::StaticClass()));
        m_SummonSpawnPlaceHelper.m_AvatarActor = GetAvatarActorFromActorInfo();
        InitializeConfiguration();
        DoSummon();       
    }

   
    UFUNCTION()
    void DoSummon()
    {
        //Print("OnActivateSpellServer_Scriptable", 10.f, FLinearColor::Blue);
        InitializeConfiguration();

        m_SummonSpawnPlaceHelper.m_Odd = false;
        m_SummonSpawnPlaceHelper.m_CurrentAngle = 0;
        m_SummonSpawnPlaceHelper.m_CurrentDistance = m_SummonSpawnPlaceHelper.m_MinSummonDistance;

        SpawnVisualEffectActor();

        //m_SummonSpawnPlaceHelper.m_IgnoreNavMesh = false;
        m_FailedToSpawn = SpawnCreatures(m_CharactersToSpawn);
        //m_SummonSpawnPlaceHelper.m_IgnoreNavMesh = true;
        //m_FailedToSpawn = SpawnCreatures(m_FailedToSpawn);
        ForceSpawnCreatures(m_FailedToSpawn);

        //Print("OnActivateSpellServer_Scriptable - EndAbilitySpell", 10.f, FLinearColor::Red);
        //EndAbility();
        DoEndSpellAction();
    }

    void ForceSpawnCreatures(TArray<FAISpawnData> CharactersToSpawn)
    {
        for(const FAISpawnData character_spawn : CharactersToSpawn)
        {
            AAIAgentCharacter default_character = m_SummonSpawnPlaceHelper.GetSummonCharacter(character_spawn);
    
            for(int i = 0; i < character_spawn.m_Amount; ++i)
            {
                FVector desired_pos = FVector::ZeroVector;
                UNavigationSystemV1::ProjectPointCustomExtentForUnspawnedCharacter(GetAvatarActorFromActorInfo(), character_spawn.m_SpawnAIAgentDefinition.GetDefaultObject(), GetAvatarActorFromActorInfo().ActorLocation, desired_pos, FVector(2500, 2500, 500));
                desired_pos.Z += 90.f;
                //System::DrawDebugSphere(desired_pos, 5.f, 12.f, FLinearColor::Red, 15.f, 5.f);
                float summonDelay = GetSummonDelay();
                m_SummonManagerComponent.SummonAI(GetAvatarActorFromActorInfo(), m_SummonedEffect,
                    character_spawn.m_SpawnAIAgentDefinition, desired_pos, character_spawn.m_DailyRoutine,
                    m_SummonCreatureVisualEffect, summonDelay);
            }
        }
    }

    TArray<FAISpawnData> SpawnCreatures(TArray<FAISpawnData> CharactersToSpawn)
    {
        TArray<FAISpawnData> failedToSpawn = CharactersToSpawn;
        m_SummonSpawnPlaceHelper.m_Odd = false;
        m_SummonSpawnPlaceHelper.m_CurrentAngle = 0;
        m_SummonSpawnPlaceHelper.m_CurrentDistance = m_SummonSpawnPlaceHelper.m_MinSummonDistance;
        for(const FAISpawnData character_spawn : CharactersToSpawn)
        {
            AAIAgentCharacter default_character = m_SummonSpawnPlaceHelper.GetSummonCharacter(character_spawn);
            int spawnedAmount = 0;
            for(int i = 0; i < character_spawn.m_Amount; ++i)
            {
                if(DoSpawnCreature(character_spawn, default_character))
                {
                    spawnedAmount++;
                }
            }

            int index = failedToSpawn.FindIndex(character_spawn);
            failedToSpawn[index].m_Amount -=spawnedAmount;
            if(failedToSpawn[index].m_Amount == 0)
                failedToSpawn.RemoveAt(index);
        }

        return failedToSpawn;
    }

    bool DoSpawnCreature(FAISpawnData character_spawn, AAIAgentCharacter default_character)
    {
        FVector desired_pos = FVector::ZeroVector;
        if(m_SummonSpawnPlaceHelper.TryToGetValidSpawnPlace(GetAvatarActorFromActorInfo(), desired_pos, default_character))
        {
            //System::DrawDebugSphere(desired_pos, 5.f, 12.f, FLinearColor::Red, 15.f, 5.f);
            float summonDelay = GetSummonDelay();
            //desired_pos.Z = desired_pos.Z + m_ZOffset;
            m_SummonManagerComponent.SummonAI(GetAvatarActorFromActorInfo(), m_SummonedEffect,
                character_spawn.m_SpawnAIAgentDefinition, desired_pos, character_spawn.m_DailyRoutine,
                m_SummonCreatureVisualEffect, summonDelay);
            return true;
        }
        return false;
    }

    float GetSummonDelay()
    {
        return Math::RandRange(m_MinSummonDelay, m_MaxSummonDelay);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        if(m_SummonCreatureVisualEffect != nullptr)
            m_SummonCreatureVisualEffect.SetLifeSpan(20.f);
    }


    void SpawnVisualEffectActor()
    {
        FHitResult hit;
        FVector floorLocation;
        MagicScript::FindFloorAtLocation(GetAvatarActorFromActorInfo().GetActorLocation(), hit, nullptr, ECollisionChannel::IKTrace, -200, 100);
        floorLocation = hit.ImpactPoint;
        //System::DrawDebugSphere(floorLocation, 10.f, 32, FLinearColor::Yellow, 20.f, 10.f);
        m_SummonCreatureVisualEffect = Cast<ASummonCreatureVisualEffect>(SpawnActor(GetSummonCreatureVisualEffectClass_Scriptable(), floorLocation));
    }

    UFUNCTION()
    void InitializeConfiguration()
    {
        if(m_SpellConfigClass == nullptr)
        {
            DoEndSpellAction();
            return;
        }       	
        m_SpellConfig = Cast<USpell_Summon_Config_Base>(m_SpellConfigClass.Get().GetDefaultObject());

        m_SummonSpawnPlaceHelper.m_MinSummonDistance = m_SpellConfig.m_MinSummonDistance;
        m_SummonSpawnPlaceHelper.m_MaxSummonDistance = m_SpellConfig.m_MaxSummonDistance;
        m_SummonSpawnPlaceHelper.m_AngleInterval = m_SpellConfig.m_AngleInterval;
        m_SummonSpawnPlaceHelper.m_DistanceInterval = m_SpellConfig.m_DistanceInterval;
        m_SummonSpawnPlaceHelper.m_SpawnAttemptRadius = m_SpellConfig.m_SpawnAttemptRadius;
        m_SummonSpawnPlaceHelper.m_CreatureSpawnAttempts = m_SpellConfig.m_CreatureSpawnAttempts;
        m_SummonSpawnPlaceHelper.m_ActorsToIgnore.Add(GetAvatarActorFromActorInfo());

        m_MaxSummonDelay = m_SpellConfig.m_MaxSummonDelay;
        m_MinSummonDelay = m_SpellConfig.m_MinSummonDelay;

        m_CharactersToSpawn = m_SpellConfig.m_CharactersToSpawn;

    }

    // UFUNCTION(BlueprintOverride)
    // void OnSummonedServer_Scriptable(AGothicNPCState CharacterState)
    // {
        
    // }

    USummonManagerComponent CreateOrGetSummonManagetComponent()
    {
        return USummonManagerComponent::GetOrCreate(GetAvatarActorFromActorInfo());
    }
   
   // EXAMPLE INVOKER
//    UFUNCTION()
//    void EndAbilitySpell(bool bWasCancelled)
//    {
//       SpawnInvoker.DestroyActor();
//    }
}
