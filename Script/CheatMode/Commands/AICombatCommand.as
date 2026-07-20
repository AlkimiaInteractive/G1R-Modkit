class UAICombatCommand : UCheatCommandBase 
{
    default CommandName = "AICombat";
    default CommandUsage = "AICombat";
    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 4;

    UPROPERTY()
    APlayerState m_SelectedCharacterA;
    UPROPERTY()
    APlayerState m_SelectedCharacterB;

    UPROPERTY()
    FString m_FilterA;
    UPROPERTY()
    FString m_FilterB;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();

        m_SelectedCharacterA = ImGui::ImGuiCharacterSelection("Select Character (A)", ImGui::GetAllAvailableCharactersExcluding(World, m_FilterA, Gameplay::GetPlayerCharacter(0).PlayerState), m_SelectedCharacterA, m_FilterA);
            if(m_SelectedCharacterA == m_SelectedCharacterB)
                m_SelectedCharacterB = nullptr;
            m_SelectedCharacterB = ImGui::ImGuiCharacterSelection("Select Other Character (B)", ImGui::GetAllAvailableCharactersExcluding(World, m_FilterB, m_SelectedCharacterA), m_SelectedCharacterB, m_FilterB);

        
        auto targetCharacterState = Cast<AGothicCharacterState>(m_SelectedCharacterB);
        auto sourceCharacterState = Cast<AGothicCharacterState>(m_SelectedCharacterA);

        if (!IsValid(targetCharacterState) || !IsValid(sourceCharacterState))
            return;

        auto sourceCharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(sourceCharacterState.AI);

        if (!IsValid(sourceCharacterAI))
            return;
        
        if (ImGui::Button("Attack Immediately - To Death"))
        {
            sourceCharacterAI.StartAttackingImmediately(targetCharacterState);
        }

        if (ImGui::Button("Attack Immediately - Loot only"))
        {
            sourceCharacterAI.StartAttackingImmediatelyLootOnly(targetCharacterState);
        }

        if (ImGui::Button("Attack Immediately - Spare Life No Looting"))
        {
            sourceCharacterAI.StartAttackingImmediatelySpareLifeNoLooting(targetCharacterState);
        }

        if (ImGui::Button("Attack Immediately - Fists Loot only"))
        {
            sourceCharacterAI.StartFistFightImmediately(targetCharacterState);
        }

        if (ImGui::Button("Attack Immediately - Fists No Looting"))
        {
            sourceCharacterAI.StartFistFightImmediatelyNoLooting(targetCharacterState);
        }
    }
}