class UPerceptionsCommand : UCheatCommandBase 
{
    default CommandName = "NPC Perceptions";
    default CommandUsage = "NPC Perceptions";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 2;

    TSubclassOf<UGameplayEffect> m_GameplayEffectDamage = UGameplayEffect_DebugKillCharacter::StaticClass();

    UPROPERTY()
    APlayerState m_SelectedCharacter;
    UPROPERTY()
    FString Filter;

    UPROPERTY()
    FString m_HeaderText = "Select the target npc you want to modify it perceptions";

    UPROPERTY()
    FGameplayTag m_DeafDebuffTag = GameplayTag::Debuff_Deaf;
    UPROPERTY()
    FGameplayTag m_SmellDebuffTag = GameplayTag::Debuff_Anosmic;
    UPROPERTY()
    FGameplayTag m_SightDebuffTag = GameplayTag::Debuff_Blind;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        auto playerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if(playerCharacter == nullptr)
            return false;

        if(m_SelectedCharacter == nullptr)
            return false;

        const auto target = Cast<AGothicCharacter>(m_SelectedCharacter.Pawn);
        if(target == nullptr)
            return false;

        auto abilitySystemComponent = target.GetAbilitySystemComponent();
        if(abilitySystemComponent == nullptr)
            return false;

        abilitySystemComponent.ApplyGameplayEffectToSelf(m_GameplayEffectDamage, 0, abilitySystemComponent.MakeEffectContext());
        m_SelectedCharacter = nullptr;
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        //if (ImGui::BeginTabBar("##Tabs"/*, ImGuiTabBarFlags_None*/))
        {
            //ImGui::Text(m_HeaderText);
                        
            m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select the target npc you want to modify it perceptions", GetAllAvailableCharacters(), m_SelectedCharacter, Filter);
            bool canSight = !HasTag(m_SelectedCharacter, m_SightDebuffTag);
            bool canHear = !HasTag(m_SelectedCharacter, m_DeafDebuffTag);
            bool canSmell = !HasTag(m_SelectedCharacter, m_SmellDebuffTag);
            if (ImGui::Checkbox("Is sight perception active", canSight))
            {
                UpdateSightPerception(m_SelectedCharacter, canSight);
            }
            if (ImGui::Checkbox("Is hear perception active", canHear))
            {
                UpdateHearPerception(m_SelectedCharacter, canHear);
            }
            if (ImGui::Checkbox("Is smell perception active", canSmell))
            {
                UpdateSmellPerception(m_SelectedCharacter, canSmell);
            }

            ImGui::Separator();
            //ImGui::EndTabBar();
        }
        //#endif
    }

    void UpdatePerceptionByTag(APlayerState SelectedCharacter, bool IsPerceptionEnabled, FGameplayTag PerceptionDebuffTag)
    {
        auto abComp = GetAbComp(SelectedCharacter);
        if(abComp == nullptr)
            return;
        if(IsPerceptionEnabled)
        {
            abComp.RemoveTag(PerceptionDebuffTag);
        }
        else
        {
            abComp.AddTag(PerceptionDebuffTag);
        }
    }

    void UpdateSightPerception(APlayerState SelectedCharacter, bool CanSight)
    {
        UpdatePerceptionByTag(SelectedCharacter, CanSight, m_SightDebuffTag);
    }

    void UpdateHearPerception(APlayerState SelectedCharacter, bool CanHear)
    {
        UpdatePerceptionByTag(SelectedCharacter, CanHear, m_DeafDebuffTag);
    }
    void UpdateSmellPerception(APlayerState SelectedCharacter, bool canSmell)
    {
        UpdatePerceptionByTag(SelectedCharacter, canSmell, m_SmellDebuffTag);
    }

    bool HasTag(APlayerState PlayerState, FGameplayTag Tag)
    {
        auto abComp = GetAbComp(PlayerState);
        if(abComp == nullptr)
            return false;
        return abComp.HasTagExact(Tag);
    }

    UGothicAbilitySystemComponent GetAbComp(APlayerState PlayerState)
    {
        if(PlayerState == nullptr)
            return nullptr;
        auto gothicChar = Cast<AGothicCharacter>(PlayerState.Pawn);
        if(gothicChar == nullptr)
            return nullptr;
        return Cast<UGothicAbilitySystemComponent>(gothicChar.AbilitySystemComponent);
    }

    TArray<APlayerState> GetAllAvailableCharacters()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
        TArray<APlayerState> result;
        auto availableCharacters = ImGui::GetAllAvailableCharacters(world, Filter);
        for(auto availableCharacter : availableCharacters)
        {
            const auto characterState = Cast<AGothicCharacterState>(availableCharacter);
            if(characterState == nullptr)
                continue;

            const auto target = characterState.GetCharacter();
            if(target == nullptr)
                continue;

            if(target.IsPlayerCharacterOrPlayerControlled())
                continue;

            if(!target.IsDead())
                result.Add(availableCharacter);
        }
        return result;
    }
}
