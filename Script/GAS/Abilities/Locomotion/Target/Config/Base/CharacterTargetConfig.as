UCLASS(Abstract)
class UCharacterTargetConfig_AS : UCharacterTargetConfig
{
    default m_DetectionRadiusAI = 1000.f;
    default m_DetectionRadiusPlayer = 2000.f;

    default m_TargetCheckVisibilityRate = 0.25f;
    default m_TargetLostTimeout = 3.0f;

	default m_ShouldFindTargetOnVisualLost = false;
	default m_ShouldFindTargetOnTargetDefeated = false;
	default m_ShouldFindTargetOnTargetDie = false;
	default m_ShouldFindTargetOnTargetCantBeTargeted = true;
    default m_ShouldAimToTargetHeadOrChest = true;
    default m_ShouldFilterTargetByRelationship = true;

    UFUNCTION(BlueprintOverride)
    USceneComponent GetAccurateTargetComponentOnCurrentTarget_Scriptable(USceneComponent TargetComponent)
    {
        auto character = GetCharacterFromSceneComp(TargetComponent);
        if(!IsValidSpecies(character))
            return TargetComponent;
        auto accurateComp = GetAccurateAimingComponent(character);
        if(accurateComp != nullptr)
            return accurateComp;
        return TargetComponent;
    }

    //@DE - Override this method on child classes
    USceneComponent GetAccurateAimingComponent(AGothicCharacter Character)
    {
        return SearchCollisionComponentBySocketName(Character, FString("spine"));
    }

    USceneComponent SearchCollisionComponentBySocketName(AGothicCharacter Character, FString SocketName)
    {
        auto collisionComps = Character.GetCollisionComponents();
        for(auto collisionComp : collisionComps)
        {
            auto attachedSocketName = collisionComp.GetAttachSocketName().ToString();
            if(attachedSocketName.Contains(SocketName))
                return collisionComp;
        }
        return nullptr;
    }

    bool IsValidSpecies(AGothicCharacter Character)
    {
        if(Character == nullptr)
            return false;
        auto characterDef = Character.GetCharacterDefinition();

        FGameplayTagContainer validSpeciesTags = FGameplayTagContainer();
        validSpeciesTags.AddTag(GameplayTag::Species_Human);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Demon);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Goblin);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Golem);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Harpy);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Troll);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Undead);
        validSpeciesTags.AddTag(GameplayTag::Species_Orc);
        validSpeciesTags.AddTag(GameplayTag::Species_Creature_Minecrawler_Queen);

        return characterDef.m_Species.MatchesAny(validSpeciesTags);
            
    }

    //@DE - Here the targets are already filtered by species
    UFUNCTION(BlueprintOverride)
    void FilterTargetByRelationship_Scriptable(AGothicCharacter OwnerCharacter, TArray<USceneComponent>& Targets)
    {
        if(OwnerCharacter == nullptr)
            return;
        //@DE - Check valid only for player
        if(IsNPC(OwnerCharacter))
            return;

        
        //@DE - The check must be NPC->IsEnemyTowards(Player)
        TArray<USceneComponent> enemyTargets = GetEnemyTargets(OwnerCharacter, Targets);
        if(enemyTargets.Num() > 0)
        {
            Targets = enemyTargets;
            return;
        }

        TArray<USceneComponent> hostileTargets = GetHostileTargets(OwnerCharacter, Targets);
        if(hostileTargets.Num() > 0)
        {
            Targets = hostileTargets;
            return;
        }

        TArray<USceneComponent> neutralTargets = GetNeutralAndAngryTargets(OwnerCharacter, Targets);
        if(neutralTargets.Num() > 0)
        {
            Targets = neutralTargets;
            return;
        }

        TArray<USceneComponent> friendlyTargets = GetFriendlyTargets(OwnerCharacter, Targets);
        if(friendlyTargets.Num() > 0)
        {
            Targets = friendlyTargets;
            return;
        }
    }

    AGothicCharacter GetCharacterFromSceneComp(USceneComponent Target)
    {
        return Cast<AGothicCharacter>(Target.GetOwner());
    }

    bool IsNPC(AGothicCharacter Character)
    {
        return !Character.IsPlayerControlled() && !Character.IsPlayerCharacter();
    }

    //@DE - Friendly character + other players
    TArray<USceneComponent> GetFriendlyTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        for(auto target : Targets)
        {
            AGothicCharacter character = GetCharacterFromSceneComp(target);
            if(!IsNPC(character))
                outTargets.Add(target);
            else
                if(character.IsFriendlyTowards(OwnerCharacter))
                    outTargets.Add(target);
        }
        return outTargets;
    }
    


    TArray<USceneComponent> GetNeutralAndAngryTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        outTargets = GetNeutralTargets(OwnerCharacter, Targets);
        outTargets.Append(GetAngryTargets(OwnerCharacter, Targets));
        return outTargets;
    }

    TArray<USceneComponent> GetNeutralTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        for(auto target : Targets)
        {
            AGothicCharacter character = GetCharacterFromSceneComp(target);
            if(IsNPC(character) && character.IsNeutralTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<USceneComponent> GetAngryTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        for(auto target : Targets)
        {
            AGothicCharacter character = GetCharacterFromSceneComp(target);
            if(IsNPC(character) && character.IsAngryTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<USceneComponent> GetHostileTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        for(auto target : Targets)
        {
            AGothicCharacter character = GetCharacterFromSceneComp(target);
            if(IsNPC(character) && character.IsHostileTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }

    TArray<USceneComponent> GetEnemyTargets(AGothicCharacter OwnerCharacter, TArray<USceneComponent> Targets)
    {
        TArray<USceneComponent> outTargets;
        for(auto target : Targets)
        {
            AGothicCharacter character = GetCharacterFromSceneComp(target);
            if(IsNPC(character) && character.IsEnemyTowards(OwnerCharacter))
                outTargets.Add(target);
        }
        return outTargets;
    }
}