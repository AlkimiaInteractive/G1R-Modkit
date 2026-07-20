
class UGA_Spell_Teleport: UGameplayAbilitySpellTeleport
{ 
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnTeleportPath = n"Blueprint'/Game/Maps/Magic/BP_TeleportLocation.BP_TeleportLocation_C'";
    
    default m_MaxTraceDistanceToFindGround = 1000.0f;
    default m_TeleportAppearingClass = n"Blueprint'/Game/GameplayCues/GC_TeleportAppearingActor.GC_TeleportAppearingActor_C'";
    

    FName GetTeleportLocationName() const
    {
        return n"";
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnTeleportPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    FVector GetSpawnPositionServer_Scriptable(AGothicCharacter owner, TSubclassOf<UObject> actorToSpawnClass) const
    {
        const auto spotHandleFound = FInteractionSpotHandle(GetTeleportLocationName());
        //check(spotHandleFound.IsValid(), "Teleport point not found: " + GetTeleportLocationName());

        if(!spotHandleFound.IsValid())
        {
            return FVector::ZeroVector;
        }
        
        return spotHandleFound.Location;
    }

    UFUNCTION(BlueprintOverride)
    float GetAppearingTime_Scriptable(AGothicCharacter owner) const
    {
        const auto spellConfig = MagicScript::GetSpellConfigGivenACharacter(owner);
        const auto teleportSpellConfig = Cast<UTeleportSpellConfig>(spellConfig);
        return teleportSpellConfig.m_AppearingDuration;
    }

    UFUNCTION(BlueprintOverride)
    float GetVanishingTime_Scriptable(AGothicCharacter owner) const
    {
        const auto spellConfig = MagicScript::GetSpellConfigGivenACharacter(owner);
        const auto teleportSpellConfig = Cast<UTeleportSpellConfig>(spellConfig);
        return teleportSpellConfig.m_VanishingDuration;
    }

    UFUNCTION(BlueprintOverride)
    FColor GetColor_Scriptable(AGothicCharacter owner) const
    {
        const auto spellConfig = MagicScript::GetSpellConfigGivenACharacter(owner);
        const auto teleportSpellConfig = Cast<UTeleportSpellConfig>(spellConfig);
        return teleportSpellConfig.m_Color;
    }

    UFUNCTION(BlueprintOverride)
    void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
    {
        StartTeleportServer(ActorSpawned);
    }

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable() 
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnTeleportFinished_Scriptable()
    {
        #ifdef WITH_STORY_G1R
            if(G1R::UStoryG1R::Get().WaterMaguesTeleportBlocked > 0)
            {
                G1R::UStoryG1R::Get().TeleportToWaterMagesBlockedDone = 1;
            }
        #endif
    }
}

class UGA_Spell_Teleport_MagiciansOfFire: UGA_Spell_Teleport
{ 
   FName GetTeleportLocationName() const override
   {
        return n"WP_OC_TELEPORT_01";
   }
}

class UGA_Spell_Teleport_SwampCamp: UGA_Spell_Teleport
{ 
    FName GetTeleportLocationName() const override
    {
        return n"WP_SC_TELEPORT_01";
    }
}

class UGA_Spell_Teleport_MagiciansOfWater: UGA_Spell_Teleport
{
    FName GetTeleportLocationName() const override
    {
        #ifdef WITH_STORY_G1R
            if(G1R::UStoryG1R::Get().WaterMaguesTeleportBlocked > 0)
            {
                return n"WP_NC_TELEPORT_02";
            }
            else
            {
                return n"WP_NC_TELEPORT_01";
            }
        #else
            return n"WP_NC_TELEPORT_01";
        #endif
    }
}

class UGA_Spell_Teleport_Necromancer: UGA_Spell_Teleport
{ 
    FName GetTeleportLocationName() const override
    {
        return n"WP_OW_TP_XARDASTOWER";
    }
}

class UGA_Spell_Teleport_OrcCementery: UGA_Spell_Teleport
{ 
    FName GetTeleportLocationName() const override
    {
        return n"";
    }
}

class UGA_Spell_Teleport_SleepersTemple: UGA_Spell_Teleport
{ 
    FName GetTeleportLocationName() const override
    {
        return n"WP_OT_TP_ORCTEMPLE";
    }
}

class UGA_Spell_Teleport_SunkenTower: UGA_Spell_Teleport
{ 
    FName GetTeleportLocationName() const override
    {
        return n"WP_SNT_TELEPORT";
    }
}