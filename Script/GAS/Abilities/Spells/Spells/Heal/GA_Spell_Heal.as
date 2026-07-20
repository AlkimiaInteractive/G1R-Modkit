
class UGA_Spell_Heal : UGA_Spell_TargetableWithDebuff
{
    //default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Heal;
    
    default m_SpellConfig = UHealSpellConfig::StaticClass();

    default m_SpellStateTag = GameplayTag::State_LaunchingSpell_Heal;
    FGameplayTag m_PerceptionStartTag = GameplayTag::Perception_Spell_Debuff_Heal_Start;
    FGameplayTag m_PerceptionEndTag = GameplayTag::Perception_Spell_Debuff_Heal_End;

    default ActivationOwnedTags.AddTag(GameplayTag::State_LaunchingSpell_Heal);

    UPROPERTY()
    FGameplayTag m_WasteManaTag = GameplayTag::Debuff_Heal_OnlyWasteMana;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<AActor> m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/Heal/BP_HealSpellVisual.BP_HealSpellVisual_C'";

    AHealVisual m_HealVisual;
    
    UFUNCTION(BlueprintOverride)
    TSubclassOf<UObject> GetSpawnActorClassServer_Scriptable() const
    {
        return m_SpawnActorPath.Get();
    }

    FGameplayTag GetTriggerBeginOnTag() override
    {
        return GameplayTag::Ability_Action_Spell_Throw_Heal;
    }

    UFUNCTION(BlueprintOverride)
    bool HasOverrideManaCostValue_Scriptable()
    {
        //@DE - You can use heal to damage undead creatures.
        AGothicCharacter gothicChar = Cast<AGothicCharacter>(m_Target);
        if(gothicChar == nullptr)
            return false;
        if(gothicChar.IsUndead())
            return true;
        return false;
    }

    UFUNCTION(BlueprintOverride)
    float32 GetOverrideManaCostValue_Scriptable()
    {
        auto spellConfig = Cast<UHealSpellConfig>(GetConfig());
        return spellConfig.m_UndeadManaCostSeconds;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        Super::OnActivateSpellServer_Scriptable();
    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetVisibleOnServer_Scriptable()
    {
        if(m_Target == GetAvatarActorFromActorInfo())
            return true;
        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldEndSpell_Scriptable()
    {
        if(Super::ShouldEndSpell_Scriptable())
            return true;
        //@DE - You can use heal to damage undead creatures.
        AGothicCharacter gothicChar = Cast<AGothicCharacter>(m_Target);
        if(gothicChar == nullptr)
            return true;
        if(gothicChar.IsUndead())
        {
            if(gothicChar.IsDead())
                return true;
            return false;
        }
        return IsTargetFullHeal();
        
    }

    bool IsTargetFullHeal()
    {
        AGothicCharacter gothicChar = Cast<AGothicCharacter>(m_Target);
        if(gothicChar == nullptr)
            return true;
        return gothicChar.GetMaxHealthAttribute() == gothicChar.GetHealthAttribute();
   }

   UFUNCTION(BlueprintOverride)
   void OnNewTarget_Scriptable(AActor NewTarget)
   {
        Super::OnNewTarget_Scriptable(NewTarget);
        SpawnObject(GetSpawnActorClassServer_Scriptable(), m_Target.ActorLocation, FRotator::ZeroRotator);
   }

   UFUNCTION(BlueprintOverride)
   void OnActorSpawnedServer_Scriptable(AActor actorSpawned)
   {
        m_HealVisual = Cast<AHealVisual>(actorSpawned);
        if(m_HealVisual == nullptr || m_Target == nullptr)
            return;

        AGothicCharacter instigator = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        AGothicCharacter target = Cast<AGothicCharacter>(m_Target);
        m_HealVisual.InitializeActors(target, instigator);
        m_HealVisual.AttachToComponent(instigator.Mesh, n"hand_socket_r");
        m_HealVisual.ExecuteVFX();
   }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        //Super::OnEndSpellServer_Scriptable();
        if(m_HealVisual != nullptr)
            m_HealVisual.RemoveVFX();

        if(!WasTargetObtainedByTargetDatamodule())
            DeactivateTarget();
    }

    UFUNCTION(BlueprintOverride)
    void OnEffectApplied_Scriptable()
    {
        if (!m_PerceptionStartTag.IsValid())
            return;

        ReportPerceptionEvent(m_PerceptionStartTag, Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCharacterState(), Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()));
    }

    UFUNCTION(BlueprintOverride)
    void OnEffectRemoved_Scriptable()
    {
        if(!m_PerceptionEndTag.IsValid())
            return;
        
        ReportPerceptionEvent(m_PerceptionEndTag, Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCharacterState(), Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()));
    }


    void ReportPerceptionEvent(FGameplayTag PerceptionTag, AGothicCharacterState InstigatorState, AGothicCharacter TargetCharacter)
    {
        if (InstigatorState.Character == nullptr)
            return;

        InstigatorState.Character.Perception.ReportPerceptionEvent(
            PerceptionTag,
            TargetCharacter.ActorLocation,
            SensedCharacter = InstigatorState.Character,
            TargetActor = TargetCharacter,
            InstigatorActor = InstigatorState.Character,
            AffectedActor = TargetCharacter
        );
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void QuickApplyGEToTarget_Scriptable(FGameplayEffectSpec& EffectSpec)
    {
        //@DE - You can use heal to damage undead creatures.
        AGothicCharacter gothicChar = Cast<AGothicCharacter>(m_Target);
        if(gothicChar == nullptr)
            return;
        bool isUndead = gothicChar.IsUndead();
        float healAmount = GetHealAmount(isUndead);
        if(isUndead)
        {   
           healAmount = healAmount * -1;
        }
        if(gothicChar.HasGameplayTag(m_WasteManaTag))
        {
          healAmount = 0;
        }    
        EffectSpec.SetByCallerMagnitude(GameplayTag::GE_Param_Heal, float(healAmount));
    }

    float GetHealAmount(bool IsUndead)
    {
        auto magicCircleTag = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCharacterMagicCircleTag();
        auto spellConfig = Cast<UHealSpellConfig>(GetConfig());
        if(IsUndead)
            return spellConfig.m_UndeadHealDamageAmountByMagicCircle[magicCircleTag];
        return spellConfig.m_HealAmountByMagicCircle[magicCircleTag];
    }
}