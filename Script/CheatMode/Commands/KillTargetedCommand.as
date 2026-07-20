class UKillTargetedCommand : UCheatCommandBase 
{
    default CommandName = "KillTargeted";
    default CommandUsage = "KillTargeted (TAB to select target)";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 5;

    TSubclassOf<UGameplayEffect> m_GameplayEffectDamage = UGameplayEffect_DebugKillCharacter::StaticClass();

    UPROPERTY()
    APlayerState m_SelectedCharacter;
    UPROPERTY()
    FString Filter;

    UPROPERTY()
    FString m_HeaderText = "Select the target npc you want to kill";
    UPROPERTY()
    FString m_ButtonText = "Kill Targeted";

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
                        
            m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character", GetAllAvailableCharacters(), m_SelectedCharacter, Filter);
            if (ImGui::Button(m_ButtonText))
            {
                ExecuteCommand(TArray<FString>());
            }
            //ImGui::EndTabBar();
        }
        //#endif
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

            if(!target.IsDead())
            {
                result.Add(availableCharacter);
            }
            
        }

        return result;
    }
}
