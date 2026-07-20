class UCharacterTargetHealSpellConfig : USpellCharacterTargetConfig
{
    //@DE - Here the targets are already filtered by species
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void FilterTargetByRelationship_Scriptable(AGothicCharacter OwnerCharacter, TArray<USceneComponent>& Targets)
    {
        if(OwnerCharacter == nullptr)
            return;
        //@DE - Check valid only for player
        if(IsNPC(OwnerCharacter))
            return;

        // TArray<USceneComponent> friendlyTargets = GetFriendlyTargets(OwnerCharacter, Targets);
        // if(friendlyTargets.Num() > 0)
        // {
        //     Targets = friendlyTargets;
        //     return;
        // }
        
        // TArray<USceneComponent> neutralTargets = GetNeutralAndAngryTargets(OwnerCharacter, Targets);
        // if(neutralTargets.Num() > 0)
        // {
        //     Targets = neutralTargets;
        //     return;
        // }

        // TArray<USceneComponent> hostileTargets = GetHostileTargets(OwnerCharacter, Targets);
        // if(hostileTargets.Num() > 0)
        // {
        //     Targets = hostileTargets;
        //     return;
        // }

        // //@DE - The check must be NPC->IsEnemyTowards(Player)
        // TArray<USceneComponent> enemyTargets = GetEnemyTargets(OwnerCharacter, Targets);
        // if(enemyTargets.Num() > 0)
        // {
        //     Targets = enemyTargets;
        //     return;
        // }

        TArray<USceneComponent> totalTargets;
        TArray<USceneComponent> friendlyTargets = GetFriendlyTargets(OwnerCharacter, Targets);
        if(friendlyTargets.Num() > 0)
        {
            for(auto targetComp : friendlyTargets)
            {
                TryAdd(totalTargets, targetComp);             
            }
        }
        
        TArray<USceneComponent> neutralTargets = GetNeutralAndAngryTargets(OwnerCharacter, Targets);
        if(neutralTargets.Num() > 0)
        {
            for(auto targetComp : neutralTargets)
            {
                TryAdd(totalTargets, targetComp);             
            }
        }

        TArray<USceneComponent> hostileTargets = GetHostileTargets(OwnerCharacter, Targets);
        if(hostileTargets.Num() > 0)
        {
            for(auto targetComp : hostileTargets)
            {
                TryAdd(totalTargets, targetComp);             
            }
        }

        //@DE - The check must be NPC->IsEnemyTowards(Player)
        TArray<USceneComponent> enemyTargets = GetEnemyTargets(OwnerCharacter, Targets);
        if(enemyTargets.Num() > 0)
        {
            for(auto targetComp : enemyTargets)
            {
                TryAdd(totalTargets, targetComp);             
            }
        }

        Targets = totalTargets;
    }
      
    void TryAdd(TArray<USceneComponent>& TotalTargets, USceneComponent targetComp)
    {
        auto targetGothicCharacter = Cast<AGothicCharacter>(targetComp.GetOwner());
        if(targetGothicCharacter == nullptr)
            return;
        if(Cast<UGothicAbilitySystemComponent>(targetGothicCharacter.GetAbilitySystemComponent()).HasTagExact(GameplayTag::Debuff_Heal_OnlyWasteMana))
            return;
        for(auto otherComp : TotalTargets)
        {
            if(otherComp.GetOwner() == targetGothicCharacter)
                return;
        }
        TotalTargets.Add(targetComp);     
    }
}
    