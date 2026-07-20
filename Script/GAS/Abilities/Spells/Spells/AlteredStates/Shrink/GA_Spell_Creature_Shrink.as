UCLASS()
class UGA_Spell_Creature_Shrink : UGameplayAbilitySpellCreatureShrink
{
    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/Items/RuneScrolls/A_AdultTroll_Shrink_Montage.A_AdultTroll_Shrink_Montage'";
 
    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_ShrinkCompletedAttributesGameplayEffect = UGE_Shrink_Completed_Attributes::StaticClass();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    FAISpawnData m_CharacterToSpawn;
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_TC_TrollAdult_Shrinked::StaticClass();
    default m_CharacterToSpawn.m_DailyRoutine = UDailyRoutine_Troll_Base::StaticClass();

    default ActivationOwnedTags.AddTag(GameplayTag::State_BlockState);
	default ActivationOwnedTags.AddTag(GameplayTag::State_IgnoreMovementInput);
    default ActivationOwnedTags.AddTag(GameplayTag::State_LockMovement);

    // UPROPERTY(EditAnywhere, BlueprintReadWrite)
    // TSubclassOf<USpawnAIAgentDefinition> CharacterSpawnDefinition = USpawnAIAgentDefinition_TC_TrollAdult_Shrinked_Test::StaticClass(); 


    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement);
	//default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Locomotion);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Interaction);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Taunt);
    
    
    default	CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Movement);
	//default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Locomotion);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Interaction);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Taunt);

    //@DE - 29/07/2024 This functionality do the visual swap of the mesh but the config is still a normal Troll config.
    // Andre said he will work in the logic swap when the gamescom demo will be completed.

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        auto aiAgent = Cast<AAIAgentCharacter>(GetAvatarActorFromActorInfo());
        auto characterState = Cast<AGothicNPCState>(aiAgent.GetCharacterState());
/*
        characterState.VisualCharacterClass = m_CharacterToSpawn.m_SpawnAIAgentDefinition.GetDefaultObject().AIAgentCharacterClass;
        characterState.GetCharacter().DestroyActor();

        FGameplayAbilitySpec OutSpec;
        GetAbilitySystemComponentFromActorInfo().FindAbilitySpecFromClass(UGA_Spell_Creature_Shrink::StaticClass(), OutSpec);

        GetAbilitySystemComponentFromActorInfo().ClearAbility(OutSpec.Handle);*/

        auto abilitySystemComponent = aiAgent.GetAbilitySystemComponent();
       // abilitySystemComponent.ApplyGameplayEffectToSelf(m_ShrinkCompletedGameplayEffect, 0, GetAbilitySystemComponentFromActorInfo().MakeEffectContext());
        abilitySystemComponent.ApplyGameplayEffectToSelf(m_ShrinkCompletedAttributesGameplayEffect, 0, GetAbilitySystemComponentFromActorInfo().MakeEffectContext());
        
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo CurrentActorInfo, bool WasCancelled)
    {
        //Print("OnEndAbility_Scriptable", 5.f, FLinearColor::Red);
    }

    UFUNCTION(BlueprintOverride)
    void OnCancelledMontage_Scriptable()
    {
         //Print("11111111111111111111111111111111111111111111", 5.f, FLinearColor::Red);
    }

    UFUNCTION(BlueprintOverride)
    void OnInterruptedMontage_Scriptable()
    {
         //Print("222222222222222222222222222222222222222222", 5.f, FLinearColor::Red);
    }

    UFUNCTION(BlueprintOverride)
    void OnCompletedMontage_Scriptable()
    {
         //Print("3333333333333333333333333333333333333333333333", 5.f, FLinearColor::Red);
    }
}