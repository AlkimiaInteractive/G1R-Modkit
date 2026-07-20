
class UGE_Parry : UScriptGameplayEffect
{
    //5.4 instant effects can not use this to give tags, a new method must be found
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Parried);
}

class UGE_Ex_Damage : UGE_ExecutionCalculationBase
{

    UFUNCTION(BlueprintOverride)
    void Execute(const FGameplayEffectCustomExecutionParameters& ExecutionParams, FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const
    {
        // Get the gameplay ability component of both source and target
        UGothicAbilitySystemComponent targetAbComp = Cast<UGothicAbilitySystemComponent>(ExecutionParams.GetTargetAbilitySystemComponent());
        UGothicAbilitySystemComponent sourceAbComp = Cast<UGothicAbilitySystemComponent>(ExecutionParams.GetSourceAbilitySystemComponent());

        APlayerController sourcePlayerController = sourceAbComp.GetPlayerController();
        APlayerController targetPlayerController = targetAbComp.GetPlayerController();

        AActor target = targetAbComp.GetAvatar();
        AActor source = sourceAbComp.GetAvatar();

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(target);
        AGothicCharacter sourceCharacter = Cast<AGothicCharacter>(source);

        if (targetCharacter.HasGameplayTag(GameplayTag::State_IgnoreAllDamage))
        {
            return;
        }

        // Get the execution effect spec
        const FGameplayEffectSpec& spec = ExecutionParams.GetOwningSpec();
        
        // Get the target and source tags
        const FAngelscriptTagContainerAggregator sourceTags = spec.GetCapturedSourceTags();
        const FAngelscriptTagContainerAggregator targetTags = spec.GetCapturedTargetTags();

        const FGameplayEffectContextHandle contextHandle = spec.GetContext();
        FGameplayEffectContext_HitResponse hitData = contextHandle.GetHitContext();

        /////////////////
        //  PLACEHOLDER IMMORTALITY FOR ESSENTIAL NPCS
        /////////////////
        bool bIsImmortal = false;
        if (targetCharacter != nullptr)
        {
            bIsImmortal = targetCharacter.HasGameplayTag(GameplayTag::State_Immortal) || targetCharacter.HasGameplayTag(GameplayTag::State_Invulnerable); 
        }
        ////////////////////////////////////////////////

        // Damage Filter
        // if the creature has one or more filters, the creature can ONLY be damaged by sources with the same tag
        if(targetAbComp.HasGameplayTag(GameplayTag::Filter_Damage))
        {
            TArray<FGameplayTag> damageTags;
            targetAbComp.GetAllChildTags(GameplayTag::Filter_Damage, damageTags);
            bool filterSuccess = false;
            for (auto tag : damageTags)
            {
                if(sourceAbComp.HasGameplayTag(tag))
                {
                    filterSuccess = true;
                }
            }
            if(!filterSuccess)
            {
                bIsImmortal = true;
            }
        }

        if(hitData.WeaponUsed == nullptr)
        {
            return;
        }
        
        UWeaponDefinition weaponUsed = Cast<UWeaponDefinition>(hitData.WeaponUsed.Get().GetDefaultObject());
        const UWeaponMeleeDefinition weaponMeleeItem = Cast<UWeaponMeleeDefinition>(weaponUsed);
        if(weaponUsed == nullptr)
        {
            return;
        }
        
        const UCombatConfig combatConfig = Cast<UCombatConfig>(UCombatConfig::StaticClass().GetDefaultObject());
        
        // Capture target Damage multiplier
        bool success = false;
        FGameplayAttribute DamageMultiplierAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"DamageMultiplier");
        float targetDamageMultiplier = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, DamageMultiplierAttr, success);
        
        // Check block / parry
        UDataModule_Combat targetDataModuleCombat = DataModule::GetCombatDataModule(target);
        UDataModule_Combat sourceDataModuleCombat = DataModule::GetCombatDataModule(source);
       
        if (targetDataModuleCombat == nullptr)
        {
            return;
        }

        // PARRY - Check if it has been a parry
        if (hitData.CanBeParried && CheckParry(targetDataModuleCombat,hitData,combatConfig,target))
        {
            if (ExecuteParry(ExecutionParams, targetAbComp, sourceAbComp, weaponMeleeItem, combatConfig, hitData.SourceAttackDirection, spec))
            {
                return;
            }    
        }

        
        bool bLimitDamageToMinimum = false;

        // Let NPCs only damage other characters if their relationship allows it
        if (sourceCharacter != nullptr && targetCharacter != nullptr && !sourceCharacter.IsPlayerControlled())
        {
            //@DE - A NPC can do damage itself. Example: falling damage. So if the weapon is the environment, avoid check relationship
            if(!weaponUsed.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Environment))
            {
                ERelationship Relationship = sourceCharacter.GetRelationshipTowards(targetCharacter);
            
                if (Relationship != ERelationship::Enemy && Relationship != ERelationship::Hostile)
                    return; // Drop the damage, this was an accidential hit
                
                ERelationshipHostility Hostility = sourceCharacter.GetHostilityTowards(targetCharacter);

                // If NPCs are fighting one another in a training fight, limit damage to 1
                if (!targetCharacter.IsPlayerCharacterOrPlayerControlled() && Hostility == ERelationshipHostility::TrainingFight)
                {
                    bLimitDamageToMinimum = true;
                }
            }
        }
        
        // Capture target health
        FGameplayAttribute healthAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        float targetHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, healthAttr, success);

        // Capture source Strength
        FGameplayAttribute strengthAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Strength::StaticClass(), n"Strength");
        float sourceStrength = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(sourceAbComp, strengthAttr, success);
        float targetStrength = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, strengthAttr, success);

        // Capture source Strength
        FGameplayAttribute dextertyhAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Dexterity::StaticClass(), n"Dexterity");
        float sourceDexterty = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(sourceAbComp, dextertyhAttr, success);

        // Capture source Critical Probability
        float sourceCriticalProbAttr = 0;
        if(sourceAbComp.GetPlayerController() != nullptr) // Only players can do critics
        {
            if(weaponUsed.HasItemSpec(GameplayTag::Item_Grip_OneHand))
            {
                FGameplayAttribute criticalProbAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_OneHand");
                sourceCriticalProbAttr = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(sourceAbComp, criticalProbAttr, success);
            }
            else if(weaponUsed.HasItemSpec(GameplayTag::Item_Grip_TwoHand))
            {
                FGameplayAttribute criticalProbAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Strength::StaticClass(), n"Critical_TwoHand");
                sourceCriticalProbAttr = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(sourceAbComp, criticalProbAttr, success);
            }
        }

        // CALCULATE DAMAGE
        float physicalDamage = 0.0f, elementalDamage = 0.0f, impactDamage = 0.0f;
        float criticalMulti = 1.0f;

        float pityCriticalIncrease = combatConfig.GetPityCriticalIncrease();
        
        bool isGodModeForPlayer = GetIsGodModeForPlayer(combatConfig, targetAbComp, bIsImmortal);

        // Capture target SuperArmor
        FGameplayAttribute superArmorAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Armor::StaticClass(), n"SuperArmor");
        float targetSuperArmor = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, superArmorAttr, success);
        
        // Apply damage to SuperArmor
        float totalTargetSuperArmor = 0.0f;
        if(!targetTags.CapturedActorTags.HasTagExact(GameplayTag::State_Immunity_SuperArmor))
        {
            totalTargetSuperArmor = Math::Max(weaponUsed.SuperArmorDamage * hitData.MultiplierSuperArmor, 0.0f);
            totalTargetSuperArmor = Math::Min(totalTargetSuperArmor, targetSuperArmor);
        }


        for(TMapIterator<FGameplayTag, float32> entry : weaponUsed.m_DamageBase)
        {
            if(hitData.MultiplierDamages.Contains(entry.Key))
            {
                float attackMult = hitData.MultiplierDamages[entry.Key];

                if (attackMult == 0.0f)
                    continue;

                float weaponDmg = GetCalculatedDamage(sourceAbComp, targetAbComp, entry, spec, weaponUsed);

                TArray<FString> tagParts;
                entry.Key.ToString().ParseIntoArray(tagParts, ".");
                FString damageName = tagParts[tagParts.Num() - 1];
                
                FGameplayAttribute resistanceAttr;
                float targetResistance = 0.f;
                if(UAngelscriptAttributeSet::TryGetGameplayAttribute(UAttributeSet_Armor::StaticClass(), FName("Resistance_" + damageName), resistanceAttr))
                {
                    //@DE - If the character is riding, we get the rider resistance.
                    if (targetCharacter.HasGameplayTag(GameplayTag::State_Mounted))
                    {
                        if (targetCharacter.GetMountComponent() != nullptr)
                        {
                            AGothicCharacter riderCharacter = targetCharacter.GetMountComponent().GetRiderCharacter();
                            targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(riderCharacter.GetGothicAbilitySystemComponent(), resistanceAttr, success);
                        }
                    }
                    else
                    {
                        targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, resistanceAttr, success);
                    }    
                    //@DE - Avoid negative resistance
                    if(targetResistance < 0.f)
                        targetResistance = 0.f;
                }
  
                //Check for weakspots
                bool weakSpotReached = false;
                if (!weaponUsed.m_CriticalWeakSpotsTags.IsEmpty())
                {
                    FHitResult hitresult; 
                    contextHandle.GetHitResult(hitresult);
                    FGameplayTagContainer tagsToCheck;
                    UGothicPhysicsMaterialTags characterPhysMaterial = Cast<UGothicPhysicsMaterialTags>(hitresult.GetPhysMaterial());
                    UHurtBoxCollisionComponent hurtBox = Cast<UHurtBoxCollisionComponent>(hitresult.GetComponent());
                    if (characterPhysMaterial != nullptr)
                    {
                        tagsToCheck = characterPhysMaterial.m_tags;
                    }
                    else if (hurtBox != nullptr)
                    {
                        tagsToCheck = hurtBox.m_Tags;
                    }


                    if (!tagsToCheck.IsEmpty() && weaponUsed.m_CriticalWeakSpotsTags.HasAnyExact(tagsToCheck))
                    {
                        weakSpotReached = true;
                    }
                }

                if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Physical))
                {
                    bool criticalHit = weakSpotReached;
                    
                    //If no weakspot has been hit, check the critical chance
                    if(!criticalHit && (sourceCriticalProbAttr > 0))
                    {
                         if (sourceDataModuleCombat == nullptr)
                         {
                            return;
                         }
           
                        float failedDicesRounds = Math::FloorToFloat(sourceDataModuleCombat.GetAttackCount() / (100.0f / sourceCriticalProbAttr));
                        float trueCriticalProbability = sourceCriticalProbAttr + (failedDicesRounds * pityCriticalIncrease);
                        float diceCritical = Math::RandRange(1.0f, 100.0f);

                        if(diceCritical <= trueCriticalProbability)
                        {
                            criticalHit = true;
                            sourceDataModuleCombat.ResetAttackCount();
                        }
                    }

                    if (criticalHit)
                    {
                        criticalMulti = weaponUsed.GetCriticalMultiplier();
                    }

                    if (weaponUsed.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Bow) || weaponUsed.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Crossbow))
                    {
                        // Damage formula
                        float BowStretch = Math::Max(0.2f,hitData.BowStretch);
                        physicalDamage += (((attackMult * weaponDmg) + sourceDexterty) - targetResistance) * criticalMulti * targetDamageMultiplier * BowStretch;
        
                    }
                    else
                    {
                        if (weaponUsed.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Fist))
                        {
                            float skillLvl = 1 + ((sourceCharacter.GetCurrentlyDrawnWeaponSkillLevel()+0.5f)*0.1f);
                            physicalDamage += (((attackMult * weaponDmg) + (sourceStrength * (1 + ((sourceCharacter.GetCurrentlyDrawnWeaponSkillLevel()+0.5f)*0.1f)))) - targetResistance) * criticalMulti * targetDamageMultiplier;
                        }
                        //@DE - Special case for throwable items.
                        else if (weaponUsed.HasItemSpec(GameplayTag::Item_Property_Throwable))
                        {
                            physicalDamage +=  weaponDmg;
                        }
                        else
                        {
                        // Damage formula
                        physicalDamage += (((attackMult * weaponDmg) + sourceStrength) - targetResistance) * criticalMulti * targetDamageMultiplier;
                        }
                    }

                    if(physicalDamage <= 0 || bLimitDamageToMinimum)
                    {
                        physicalDamage = 1;
                    }

                    //Check if the hit is blocked, and adapt the damage acording to it
                    float blockResistance = 0;
                    const bool hitBlocked = GothicCombatLibrary::IsHitBlocked(hitData,target);
                    
                    if (hitBlocked && weaponMeleeItem!=nullptr)
                    {
                        UWeaponDefinition targetWeaponDefinition = targetDataModuleCombat.GetEquipedWeaponDefinition();

                        for (auto damageInMap : targetWeaponDefinition.m_DamageBase)
                            blockResistance += damageInMap.Value;

                        blockResistance += targetStrength;
                        blockResistance = Math::Max(blockResistance, 0.0f);

                        hitData.Impact = GameplayTag::Combat_HitType_Deflected;
                        GothicGAS::Log_Info(EGothicLogCategory::Combat, source.GetName() + " deflected by " + target.GetName());
                        SendGameplayEvent(EReceiverEventActor::INSTIGATOR, GameplayTag::Action_Deflected, 0.0f, ExecutionParams);

                        //@aparis - Increase super armor damage when blocked
                        if(!targetTags.CapturedActorTags.HasTagExact(GameplayTag::State_Immunity_SuperArmor))
                        {
                            totalTargetSuperArmor = totalTargetSuperArmor*1.6f;
                            totalTargetSuperArmor = Math::Min(totalTargetSuperArmor, targetSuperArmor);
                        }
                    }
                    else if (!hitBlocked && targetDataModuleCombat.GetBlockState()==GameplayTag::Combat_BlockState_Block)
                    {
                        totalTargetSuperArmor=targetSuperArmor;
                    }

                    if(physicalDamage >= 0)
                    {
                        physicalDamage = Math::Max(physicalDamage - blockResistance, 1.0f);
                    }

                    if(physicalDamage > 0 && !isGodModeForPlayer)
                    {   
                        //@DE - Apply phisical debuff for freeze state. If the weapon have physical and elemental damage, only apply elementalDamageOnce. (On elemental evaluation)
                        ApplyDamageEffectStacks(spec.Def, GetCommonElementalDamageEffectStacks(spec.Def), sourceAbComp, targetAbComp, physicalDamage);                               
                    }
                }
                else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental)) // TODO: Elemental damage
                {
                    if (weakSpotReached)
                    {
                        criticalMulti = weaponUsed.GetCriticalMultiplier();
                    }
                    
                    elementalDamage += ((((attackMult * weaponDmg)) * targetDamageMultiplier) - targetResistance) * criticalMulti;

                    if(elementalDamage <= 0 || bLimitDamageToMinimum)
                    {
                        elementalDamage = 1;
                    }
                    
                    if(elementalDamage > 0 && !isGodModeForPlayer)
                    {   //@DE - Update 29-1-25 - We need an effect that inherits from UGE_Damage and some spells that damage its in AdditionalEffects array.
                        //So we must pass as arg the current GE definition instead the weapon hit effect definition (weaponUsed.GetHitEffect())
                        //Example: Pyrokinesis UPyrokinesisProjectileDefinition. HitEffect is UGE_Pyrokinesis_Slowdown 
                        //and the damage is on AdditionalEffects with UGE_Damage_Pyrokinesis_Infinite and UGE_FireStack as elemental damage
                        //@DE - Update 15-4-26 - Split elemental effect stack to common and elemental. Common is applied to all damages, like breakFreezeStack
                        // First apply the elemental effects and finally the common.
                        ApplyDamageEffectStacks(spec.Def, GetElementalDamageEffectStacks(spec.Def), sourceAbComp, targetAbComp, elementalDamage);               
                        ApplyDamageEffectStacks(spec.Def, GetCommonElementalDamageEffectStacks(spec.Def), sourceAbComp, targetAbComp, physicalDamage);                 
                    }
                }
                else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Impact_Falling)) // Falling damage.
                {
                    impactDamage += (attackMult * weaponDmg) - targetResistance;
                }
                else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Environment))
                {
                    if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Environment_Drown))
                    {
                        physicalDamage = attackMult * weaponDmg;
                    }
                    if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Environment_Lightning))
                    {
                        elementalDamage = attackMult * weaponDmg;
                        if(elementalDamage > 0 && !isGodModeForPlayer)
                        {   
                            ApplyDamageEffectStacks(spec.Def, GetElementalDamageEffectStacks(spec.Def), sourceAbComp, targetAbComp, elementalDamage);       
                            ApplyDamageEffectStacks(spec.Def, GetCommonElementalDamageEffectStacks(spec.Def), sourceAbComp, targetAbComp, physicalDamage);                          
                        }
                        
                    }
                }
            }
        }

        float finalDamage = physicalDamage + elementalDamage + impactDamage;
        //@DE - Some creatures have special events when the health reach into a percentage, so we can do more damage than the limit.
        EvaluateDamageLimiter(finalDamage, target);
        GothicGAS::Log_Info(EGothicLogCategory::Combat, "Final Damage: Physical: " + physicalDamage + " Elementa: " + elementalDamage + " Impact: " + impactDamage);

        // Notify the source and target that they will perform/receive damage
        SendGameplayEvent(EReceiverEventActor::INSTIGATOR, GameplayTag::Event_Damaged_Target_Before, finalDamage, ExecutionParams);
        SendGameplayEvent(EReceiverEventActor::TARGET, GameplayTag::Event_Damaged_Me_Before, finalDamage, ExecutionParams);
        SendGameplayEvent(EReceiverEventActor::INSTIGATOR, GameplayTag::Event_Damage_Caused, criticalMulti, ExecutionParams);

        // Calculate final damage
        float totalTargetDamage = 0.0f;
        
        if (targetHealth > 0.0f && !isGodModeForPlayer)
        {
            totalTargetDamage = Math::Min(finalDamage, targetHealth);
        }

        FGameplayModifierEvaluatedData superArmorData;
        superArmorData.Attribute = superArmorAttr;
        superArmorData.ModifierOp = EGameplayModOp::Additive;
        superArmorData.Magnitude = -totalTargetSuperArmor;
        OutExecutionOutput.AddOutputModifier(superArmorData);
        
        // Play rumble, shake and freeze frame in source
        if(sourcePlayerController != nullptr && sourcePlayerController.IsLocalController() && weaponMeleeItem != nullptr && spec.GetPeriod() == 0)
        {
            FGameplayTag impact = hitData.Impact;

            if(hitData.Impact == GameplayTag::Combat_HitType_Standard)
            {
                if(targetSuperArmor - totalTargetSuperArmor > 0)
                {
                    impact = GameplayTag::Combat_HitType_Additive;
                }
            }

            const UFeedbackData feedbackData = weaponMeleeItem.GetFeedbackControl();
            if(feedbackData != nullptr)
            {
                //Play camera shake in source
                const TSubclassOf<UCameraShakeBase> shake = feedbackData.GetAttackCameraShake(impact);
                if (shake != nullptr)
                {
                    Log("shake " + shake.Get().GetFullName() + " impact:" + impact);
                    sourcePlayerController.ClientStartCameraShake(shake);
                }

                // Play Haptic in source
                UForceFeedbackEffect rumble = feedbackData.GetAttackRumble(impact);
                if (rumble != nullptr)
                {
                    sourcePlayerController.ClientPlayForceFeedback(rumble, FName("Attack"), false, false, false);
                }
            }
        }

        // FREEZE FRAMES for both target and source
        if (((sourcePlayerController != nullptr && sourcePlayerController.IsLocalController()) || (targetPlayerController != nullptr && targetPlayerController.IsLocalController())) && weaponMeleeItem != nullptr && spec.GetPeriod() == 0)       
        {
            const UFeedbackData feedbackData = weaponMeleeItem.GetFeedbackControl();
            if (feedbackData!= nullptr)
            {
                    FGameplayTag impact = hitData.Impact;
                    if (hitData.Impact == GameplayTag::Combat_HitType_Standard)
                    {
                        if (targetSuperArmor - totalTargetSuperArmor > 0)
                        {
                            impact = GameplayTag::Combat_HitType_Additive;
                        }
                    }

                //If the attack is deflected, the attacker will get a deflected hit
                const FFreezeParams hitFreezeParams = impact != GameplayTag::Combat_HitType_Deflected ? feedbackData.GetHitFreezeParams(impact) : feedbackData.GetAttackFreezeParams(impact);
                const FFreezeParams attackFreezeParams =impact != GameplayTag::Combat_HitType_Deflected ? feedbackData.GetAttackFreezeParams(impact) : feedbackData.GetHitFreezeParams(impact);

                if (hitFreezeParams.m_FreezeDuration > 0)
                {
                    if (sourceCharacter != nullptr)
                    {
                        sourceCharacter.ActiveFreezeFrame(attackFreezeParams.m_CustomTimeDilation, attackFreezeParams.m_FreezeDuration, attackFreezeParams.m_BlendOutDuration);
                    }

                    if (targetCharacter != nullptr)
                    {
                        targetCharacter.ActiveFreezeFrame(hitFreezeParams.m_CustomTimeDilation, hitFreezeParams.m_FreezeDuration, hitFreezeParams.m_BlendOutDuration);
                    }
                }
            }
        }

        // If we have to perform damages we apply them to the corresponding health properties
        //@DE: Allow damage on defeated enemies. Note for future: Defeat != Death. Live <-> Defeat -> Death
        if (!(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated)&&sourceAbComp.HasGameplayTag(GameplayTag::State_Attack)))
        {
            //Blood effects
            FGameplayAttribute maxHealthAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
            float targetMaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, maxHealthAttr, success);

            if (weaponMeleeItem != nullptr)
            {
                AMeleeWeaponVisual meleeWeaponVisual = Cast<AMeleeWeaponVisual>(sourceCharacter.GetCarryComponent().GetItemVisual());
                if (meleeWeaponVisual != nullptr)
                {
                    meleeWeaponVisual.OnDamageDealt(targetCharacter, totalTargetDamage / targetMaxHealth);
                }
            }

            FGameplayCueParameters Parameters;
            Parameters.EffectContext = contextHandle;
	        Parameters.Normal = hitData.AttackLinearVelocity;
            Parameters.RawMagnitude = totalTargetDamage;
            Parameters.NormalizedMagnitude = totalTargetDamage / targetMaxHealth;
            Parameters.Instigator = contextHandle.Instigator;
            Parameters.EffectCauser = contextHandle.EffectCauser;
            Parameters.SourceObject = weaponUsed;
            //@DE - On dot damage, there is no bleeding. - We need some kind of feedback for dot damage. not blood
            //@DE - Update 28/02/25 - Neither bleeding if damage is 0
            if(hitData.Impact != GameplayTag::Combat_HitType_Dot && totalTargetDamage > 0.f)
            {
                PlayHitCue(targetAbComp, weaponUsed, Parameters);
            }
            // Apply damage to Health
            FGameplayModifierEvaluatedData healthData;
            healthData.Attribute = healthAttr;
            healthData.ModifierOp = EGameplayModOp::Additive;
            healthData.Magnitude = Math::Min(-totalTargetDamage,0.0f);
            OutExecutionOutput.AddOutputModifier(healthData);
            
            //@DE - Save last attacker on all attacks except environment to provide exp if there is an environmental damage. (ray or falling)
            if(!weaponUsed.GetItemType().MatchesTag(GameplayTag::Item_Weapon_Environment))
                targetDataModuleCombat.SetLastAttackerCharacter(Cast<AGothicCharacter>(source));
            
            // Apply condition gameplay effects
            OutExecutionOutput.MarkConditionalGameplayEffectsToTrigger();
        }
        GothicGAS::Log_Info(EGothicLogCategory::Combat, target.GetName() + " damaged by " + source.GetName() + ": HP: " + totalTargetDamage + " SP:" + totalTargetSuperArmor);
    }


    //@DE - Allow override it on other damages, like lava, that always do damage.
    //Avoid dodge on lava invulnerability.
    bool GetIsGodModeForPlayer(const UCombatConfig& combatConfig, UGothicAbilitySystemComponent targetAbComp, bool bIsImmortal) const
    {
        return (combatConfig.IsGodModeOn() && targetAbComp.GetPlayerController() != nullptr) || bIsImmortal;
    }

    void PlayHitCue(UGothicAbilitySystemComponent TargetAbComp, UWeaponDefinition WeaponUsed, FGameplayCueParameters& Parameters) const
    {
        //@jmarin Don't spawn blood when throwing items
        if (WeaponUsed.HasItemSpec(GameplayTag::Item_Property_NoHitParticles))
            return;

        bool canExecutePhysicalCue = true; 
        bool canExecuteFireCue = true; 
        bool canExecuteIceCue = true; 
        bool canExecuteWindCue = true; 
        bool canExecuteEnergyCue = true; 

        FGameplayTag specieTag = FGameplayTag();
        auto targetChar = Cast<AGothicCharacter>(TargetAbComp.Avatar);
        if(targetChar != nullptr)
            specieTag = targetChar.GetCharacterState().Species;

        for(TMapIterator<FGameplayTag, float32> entry : WeaponUsed.m_DamageBase)
        {
            if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental_Fire))
            {
                TryExecuteHitCue(canExecuteFireCue, TargetAbComp, WeaponUsed.GetHitCueDataByDamageTypeAndSpecie(GameplayTag::Item_Damage_Elemental_Fire, specieTag), Parameters);
            }
            else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental_Ice))
            {
                TryExecuteHitCue(canExecuteIceCue, TargetAbComp, WeaponUsed.GetHitCueDataByDamageTypeAndSpecie(GameplayTag::Item_Damage_Elemental_Ice, specieTag), Parameters);
            }
            else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental_Impact_Wind))
            {
                TryExecuteHitCue(canExecuteWindCue, TargetAbComp, WeaponUsed.GetHitCueDataByDamageTypeAndSpecie(GameplayTag::Item_Damage_Elemental_Impact_Wind, specieTag), Parameters);
            }
            else if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental_Energy))
            {
                TryExecuteHitCue(canExecuteEnergyCue, TargetAbComp, WeaponUsed.GetHitCueDataByDamageTypeAndSpecie(GameplayTag::Item_Damage_Elemental_Energy, specieTag), Parameters);
            }
            //@DE - Default visual is blood  
            else//if(entry.Key.MatchesTag(GameplayTag::Item_Damage_Physical))  
            {
                TryExecuteHitCue(canExecutePhysicalCue, TargetAbComp, WeaponUsed.GetHitCueDataByDamageTypeAndSpecie(GameplayTag::Item_Damage_Physical, specieTag), Parameters);
            }
        }
        
    }

    void TryExecuteHitCue(bool& CanExecuteCue, UGothicAbilitySystemComponent TargetAbComp, FGameplayTag GameplayCueTag, FGameplayCueParameters& Parameters) const
    {
        if(!CanExecuteCue)
            return;
        if(GameplayCueTag == FGameplayTag::Empty)
            return;
        TargetAbComp.ExecuteGameplayCueWithParameters(GameplayCueTag, Parameters);
        CanExecuteCue = false;
    }

    void EvaluateDamageLimiter(float& finalDamage, AActor Target) const
    {
        
        auto damageLimiterComp = UDamageLimiterComponentBase::Get(Target);
        if(damageLimiterComp == nullptr)
            return;
        if(!damageLimiterComp.IsEnableDamageLimiter())
            return;
        finalDamage = damageLimiterComp.GetMaxDamage(finalDamage);
    }

    //@DE - Added to allow override and apply custom damage values. (Focus Stone Puzzle)
    float GetCalculatedDamage(UGothicAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, TMapIterator<FGameplayTag, float32> Entry, FGameplayEffectSpec Spec, UWeaponDefinition WeaponUsed) const
    {
        if(Entry.Key.MatchesTag(GameplayTag::Item_Damage_Elemental)) 
        {
            return GetDamageByMagicCircle(SourceAbComp, Entry, WeaponUsed);
        }
        return Entry.Value;
    }

    float GetDamageByMagicCircle(UGothicAbilitySystemComponent SourceAbComp, TMapIterator<FGameplayTag,float32> Entry, UWeaponDefinition WeaponUsed) const
    {
        auto spellProjectile = Cast<USpellProjectileDefinition>(WeaponUsed);
        if(spellProjectile == nullptr)
        {
            //PrintError(f"{WeaponUsed.GetName()} : GetDamageByMagicCircle - Null cast weapon to USpellProjectileDefinition", 25.f);
            return Entry.Value;
        }
         
        return spellProjectile.GetDamageByCharacterMagicCircle(Cast<AGothicCharacter>(SourceAbComp.GetAvatar()), Entry.Key);
    }

    TArray<FElementalEffectStackData> GetCommonElementalDamageEffectStacks(const UGameplayEffect HitEffect) const
    {
        UGE_Damage damageEffect = Cast<UGE_Damage>(HitEffect);
        if(damageEffect != nullptr)
            return damageEffect.m_CommonElementalEffectStacks;
        return TArray<FElementalEffectStackData>();
    }

    TArray<FElementalEffectStackData> GetElementalDamageEffectStacks(const UGameplayEffect HitEffect) const
    {
        UGE_Damage damageEffect = Cast<UGE_Damage>(HitEffect);
        if(damageEffect != nullptr)
            return damageEffect.m_ElementalEffectStacks;
        return TArray<FElementalEffectStackData>();
    }

    UFUNCTION()
    void ApplyDamageEffectStacks(const UGameplayEffect HitEffect, TArray<FElementalEffectStackData> StacksArray, UAngelscriptAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, float elementalDamage) const
    {
        UGE_Damage damageEffect = Cast<UGE_Damage>(HitEffect);
        if(damageEffect != nullptr && targetAbComp != nullptr && sourceAbComp != nullptr)
        {
            ////@DE - Reverse iteration because at 0 is UGE_FreezeHitsStack::StaticClass() on ALL damage
            //for(int i = damageEffect.m_ElementalEffectStacks.Num() - 1; i >= 0; i--)
            for(auto elementalEffect : StacksArray)
            {
                //auto elementalEffect = damageEffect.m_ElementalEffectStacks[i];
                auto elementalDamageEffect = elementalEffect.ElementalEffectStack;//damageEffect.m_ElementalEffectStack;
                if(elementalDamageEffect != nullptr)
                {
                    ApplyStack(sourceAbComp, targetAbComp, damageEffect, elementalDamageEffect, elementalDamage, elementalEffect.ForceOverflowElementalEffectStack/*damageEffect.m_ForceOverflowElementalEffectStack*/);
                }
            }
        }  
    }


    void ApplyStack(UAngelscriptAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, 
        UGE_Damage DamageEffect, TSubclassOf<UScriptGameplayEffect> ElementalDamageEffect, 
        float DamageValue, bool ForceOverflowElementalEffectStack) const
    {
        FGameplayEffectContextHandle context = SourceAbComp.MakeEffectContext();

        //For perception, we use AGothicCharacterState as Instigator
        context.AddInstigator(SourceAbComp.GetAvatar(), SourceAbComp.GetAvatar());

        FGameplayEffectSpecHandle specStackHandle = SourceAbComp.MakeOutgoingSpec(ElementalDamageEffect, 1.0f, context);
        //IMPORTANT
        //Old method. This method doesnt works due on first application of the effect, the stack is not considered. The stack it's only considered on ACTIVE effects.
        //In the first application of a firebolt attack, the stack is overflowed (firestack (limit : 10) --- firebolt (elementalDamage: 15)) and the character never get burn
        //NOTE: Effect Stack can't be greater than the max stack value. Check GameplayEffect.cpp line 3037 - "if (ExistingSpec.StackCount == ExistingSpec.Def->StackLimitCount)"
        //According to the Epic comment on the previous line, the effect only is applied when the stack reach the LIMIT, not when the stack is greater.
        //Once the application stack is equal to the limit, the next application will overflow it the stack only if the stack remains on the limit.
        // 
        //AbilitySystem::SetStackCount(specStackHandle, elementalDamage);
        //targetAbComp.ApplyGameplayEffectSpecToSelf(specStackHandle);

        //So, now, for the instant magic elemental effects, we increase by one the stack each on each point of damage. If the attack generates 15 damage points
        //We increment the stack 15 times or until we reach the limit and the overflow effect is triggered.
        //For the effects with duration, we keep the inrease by one in each effect period.

        //For magic projectiles.
        if(DamageEffect.GetDurationType() == EGameplayEffectDurationType::Instant || ForceOverflowElementalEffectStack)
        {
            int newStackCount = 0;
            int limitStack = MagicScript::GetStackLimitCount(specStackHandle);

            if(DamageValue >= limitStack || ForceOverflowElementalEffectStack)
                newStackCount = limitStack; // We only apply the same number of stack limit
            else
            {
                //We reduce in one the stack count due we apply the effect twice.
                newStackCount = Math::FloorToInt(DamageValue - 1);
                newStackCount = Math::Max(0, Math::Abs(newStackCount));
            }
            //loopIterations = OptimizeStackLoopIterations(specStackHandle, targetAbComp, limitStack, elementalDamage);
            

            AbilitySystem::SetStackCount(specStackHandle, newStackCount);
            
            //To overflow the stack, the effect must be previously applied
            SourceAbComp.ApplyGameplayEffectSpecToTarget(specStackHandle, TargetAbComp);  
            
        }

        AbilitySystem::SetStackCount(specStackHandle, 1);

        //1.Default application. Note: On effects with duration, the stack will be increased each period. 
        SourceAbComp.ApplyGameplayEffectSpecToTarget(specStackHandle, TargetAbComp); 
    }

    UFUNCTION()
    int OptimizeStackLoopIterations(FGameplayEffectSpecHandle specStackHandle, UGothicAbilitySystemComponent targetAbComp, int limitStack, float elementalDamage)
    {
        FActiveGameplayEffect activeEffect;
        int loopIterations = 0;
        targetAbComp.FindStackableActiveGameplayEffect(specStackHandle, activeEffect);

        //If the stack is active, we optimize the loop iterations.
        //Loop iterations = Min(StackLimit , CurrentStack - ElementalDamage) 
        if(MagicScript::IsValidStackableActiveGameplayEffect(activeEffect))
        {
            int currentStackCount = MagicScript::GetGameplayEffectStackCount(activeEffect);
            int remainStackToOverflow = limitStack - Math::Min(limitStack, currentStackCount); // This avoid a negative value the remainStackOverflow value if the current stack is greater than the limit

            if(elementalDamage + currentStackCount >= limitStack)
            {
                loopIterations = remainStackToOverflow;
                if(elementalDamage + currentStackCount >= limitStack + 1)
                    loopIterations = remainStackToOverflow + 1; //We force the stack overflow.
            }
            else
                loopIterations = Math::FloorToInt(elementalDamage);
        }

        return loopIterations;

    }

    UFUNCTION()
    bool CheckParry( const UDataModule_Combat& targetDataModuleCombat,const FGameplayEffectContext_HitResponse& hitData, 
                     const UCombatConfig& combatConfig, AActor target) const
    {
        const FGameplayTag targetBlock = targetDataModuleCombat.GetBlockState();
          
#if WITH_IMGUI
        if (combatConfig.GetParryCheatMode() && (targetBlock == GameplayTag::Combat_BlockState_Parry || targetBlock == GameplayTag::Combat_BlockState_Block))
        {
            return true;
        }
#endif

        if(targetBlock == GameplayTag::Combat_BlockState_Parry && GothicCombatLibrary::IsHitBlocked(hitData,target))
        {
            
            const FGameplayTag sourceDir = hitData.SourceAttackDirection;
            const FGameplayTag targetDir = targetDataModuleCombat.GetCurrentParryDirection();
            // Parried conditions
            bool parried = false;
            if(combatConfig.GetParryMode() == EParryMode::ModeA)
            {
                parried = parried || (sourceDir == GameplayTag::Combat_Attack_Top && targetDir == GameplayTag::Combat_Attack_Top);
                parried = parried || (sourceDir == GameplayTag::Combat_Attack_Bottom && targetDir == GameplayTag::Combat_Attack_Bottom);
                parried = parried || (sourceDir == GameplayTag::Combat_Attack_Left && targetDir == GameplayTag::Combat_Attack_Left);
                parried = parried || (sourceDir == GameplayTag::Combat_Attack_Right && targetDir == GameplayTag::Combat_Attack_Right);
            }
            else
            {
                parried = true;
            }
            return parried;
        }
        return false;
    }

    UFUNCTION()
    bool ExecuteParry(const FGameplayEffectCustomExecutionParameters& ExecutionParams, UGothicAbilitySystemComponent& targetAbComp, UGothicAbilitySystemComponent& sourceAbComp,
                      const UWeaponMeleeDefinition& weaponMeleeItem,const UCombatConfig& combatConfig, FGameplayTag attackDirection,const FGameplayEffectSpec& spec ) const 
    {         
        AActor target = targetAbComp.GetAvatar();
        AActor source = sourceAbComp.GetAvatar();

        GothicGAS::Log_Info(EGothicLogCategory::Combat, source.GetName() + " parried by " + target.GetName());

        // Target and source are changed because the source was parried by the target
        {
            FGameplayEffectContext_HitResponse hit_data =spec.Context.HitContext;
            hit_data.Impact = GameplayTag::Combat_HitType_Parried;

            FGameplayEventData payload;
            payload.Target = source;
            payload.Instigator = target;
            payload.OptionalObject = DataModule::GetCombatDataModule(source).CurrentCombo;

            GothicGAS::InitializeHitData(payload, hit_data);

            GothicGAS::SendGameplayEvent(source, GameplayTag::Action_Parried, payload);
        }

        if(combatConfig.GetParryMode() == EParryMode::ModeB)
        {
            FGameplayEffectContext_HitResponse hit_data =spec.Context.HitContext;
            hit_data.Impact = GameplayTag::Combat_HitType_Parried;

            // Create event
            FGameplayEventData payload;
            payload.Target = source;
            payload.Instigator = target;
            
            GothicGAS::InitializeHitData(payload, hit_data);
            GothicGAS::AddTargetInputData(payload, attackDirection);

            GothicGAS::SendGameplayEvent(target, GameplayTag::Action_Parry, payload);
        }

        // FREEZE FRAMES for both target and source
        const APlayerController targetController = targetAbComp.GetPlayerController();
        const APlayerController sourceController = sourceAbComp.GetPlayerController();
        if(((sourceController !=nullptr && sourceController.IsLocalController()) || (targetController !=nullptr && targetController.IsLocalController())) && weaponMeleeItem != nullptr && spec.GetPeriod() == 0)       
        {
            const UFeedbackData feedbackData = weaponMeleeItem.GetFeedbackControl();
            if (feedbackData!= nullptr)
            {
                const FFreezeParams hitFreezeParams =  feedbackData.GetHitFreezeParams(GameplayTag::Combat_HitType_Parried);
                const FFreezeParams attackFreezeParams = feedbackData.GetAttackFreezeParams(GameplayTag::Combat_HitType_Parried);

                if (hitFreezeParams.m_FreezeDuration > 0)
                {
                    AGothicCharacter characterSource = Cast<AGothicCharacter>(source);
                    if(characterSource != nullptr)
                    {
                        characterSource.ActiveFreezeFrame(hitFreezeParams.m_CustomTimeDilation, hitFreezeParams.m_FreezeDuration, hitFreezeParams.m_BlendOutDuration);
                    }

                    AGothicCharacter characterTarget = Cast<AGothicCharacter>(target);
                    if(characterTarget != nullptr)
                    {
                        characterTarget.ActiveFreezeFrame(attackFreezeParams.m_CustomTimeDilation,  attackFreezeParams.m_FreezeDuration, attackFreezeParams.m_BlendOutDuration);
                    }
                }
            }
             
        }    
        return true;
    }

}

class UGE_Ex_FallDamage : UGE_ExecutionCalculationBase
{
    UFUNCTION(BlueprintOverride)
    void Execute(const FGameplayEffectCustomExecutionParameters& ExecutionParams, FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const
    {

        UGothicAbilitySystemComponent targetAbComp = Cast<UGothicAbilitySystemComponent>(ExecutionParams.GetTargetAbilitySystemComponent());
        bool success = false;
        FGameplayAttribute healthAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");

        float targetHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(targetAbComp, healthAttr, success);

        //How do we calculate the fall damage?
        float fallDamage = 100.0f;
        
        if (targetHealth > 0.0f)
        {
            fallDamage = Math::Min(fallDamage, targetHealth);
        }

        FGameplayModifierEvaluatedData healthData;
        healthData.Attribute = healthAttr;
        healthData.ModifierOp = EGameplayModOp::Additive;
        healthData.Magnitude = -fallDamage;
        OutExecutionOutput.AddOutputModifier(healthData);
        // Apply condition gameplay effects
        OutExecutionOutput.MarkConditionalGameplayEffectsToTrigger();
      
        GothicGAS::Log_Info(EGothicLogCategory::Combat, targetAbComp.GetAvatar().GetName() + " received fall damage " +": HP: " + fallDamage);
    }
}