class UGodCommand : UCheatCommandBase 
{
    default CommandName = "God";
    default CommandUsage = "God 1|0";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 1;

    bool m_IsGodModeActive = false;
    UPROPERTY()
    TWeakObjectPtr<AGothicCharacterState> m_LastCharacterStateGodApplied;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 1)
		    return false;

        const auto player = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if(player == nullptr)
            return false;

        auto abilitySystemComponent = Cast<UGothicAbilitySystemComponent>(player.AbilitySystemComponent);
        if(abilitySystemComponent == nullptr)
            return false;

        auto settingGodModeValue = UCheatModeHelper::ConvertStringToInteger(args[0]);
        if( settingGodModeValue == 1)
        {
            if (!abilitySystemComponent.HasGameplayTag(GameplayTag::State_Invulnerable))
                abilitySystemComponent.AddLooseGameplayTag(GameplayTag::State_Invulnerable);
            m_LastCharacterStateGodApplied = player.GetCharacterState();
        }
        else
        { 
            if (abilitySystemComponent.HasGameplayTag(GameplayTag::State_Invulnerable))
                abilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::State_Invulnerable);
            m_LastCharacterStateGodApplied = nullptr;
        }

        m_IsGodModeActive = settingGodModeValue == 1;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        const auto player = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if(player == nullptr)
            return;

        const auto abilitySystemComponent = Cast<UGothicAbilitySystemComponent>(player.AbilitySystemComponent);
        if(abilitySystemComponent == nullptr)
            return;

        m_IsGodModeActive = abilitySystemComponent.HasGameplayTag(GameplayTag::State_Invulnerable);
        
        ImGui::Text("God mode makes the player completely invulnerable to any type of damage.");
        if (ImGui::Checkbox("Is God mode active", m_IsGodModeActive))
        {
            TArray<FString> arguments;
            arguments.Add(m_IsGodModeActive ? "1" : "0");
            ExecuteCommand(arguments);
        }
    }

    UFUNCTION(BlueprintOverride)
    void Reset()
    {
        if(m_LastCharacterStateGodApplied.IsValid())
        {
            auto abilitySystemComponent = m_LastCharacterStateGodApplied.Get().AbilitySystemComponent;
            if (abilitySystemComponent != nullptr && abilitySystemComponent.HasGameplayTag(GameplayTag::State_Invulnerable))
                abilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::State_Invulnerable);
        }

        m_IsGodModeActive = false;
        m_LastCharacterStateGodApplied = nullptr;
    }
}
