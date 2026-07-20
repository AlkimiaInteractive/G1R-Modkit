class UControlCommand : UCheatCommandBase 
{
    default CommandName = "Control";
    default CommandUsage = "Control character";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 7;

    UPROPERTY()
    APlayerState m_SelectedCharacter;
    UPROPERTY()
    FString m_Filter;
    UPROPERTY()
    float m_MaxDistance = 1800.f;
    UPROPERTY()
    FString Filter;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
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

        const auto isControlling = abilitySystemComponent.HasTagExact(GameplayTag::State_Controlled);

        ImGui::TextColored(FColor::White,  "Character under control? ");
        ImGui::SameLine();
        ImGui::TextColored(isControlling ? FColor::Green : FColor::Red, isControlling ? "Yes" : "No");

        if(!isControlling)
        {
            /*m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character:", UCheatModeHelper::GetAllCharactersStates(m_Filter), m_SelectedCharacter, m_Filter);
            auto selectedCharacterState = Cast<AGothicCharacterState>(m_SelectedCharacter);
            
            if (ImGui::Button("Control selected character"))
            {
                if(IsValid(selectedCharacterState))
                {
                    auto Payload = UCheatModeHelper::CreateGameplayEventDataWithTarget(m_SelectedCharacter);
                    GothicGAS::SendGameplayEvent(player.GetCharacterState(), GameplayTag::Event_Possessed_Debug_Start, Payload);
                }
            }*/

            m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character", GetAllAvailableCharacters(), m_SelectedCharacter, Filter);
            if (ImGui::Button("Control character"))
            {
                if(m_SelectedCharacter == nullptr)
                    return;
                auto characterState = Cast<AGothicCharacterState>(m_SelectedCharacter);
                if(characterState == nullptr)
                    return;

                if(!IsValid(characterState.GetCharacter()))
                    return;

                FGameplayEventData Payload = MagicScript::CreateEventData(characterState.GetCharacter().GetRootComponent());
                Payload.EventTag = GameplayTag::Event_Possessed_Debug_Start;
                Payload.Instigator = player;
                GothicGAS::SendGameplayEvent(player.GetCharacterState(), GameplayTag::Event_Possessed_Debug_Start, Payload);
            }
        }
    }

        TArray<APlayerState> GetAllAvailableCharacters()
    {
        auto playerCharacter = Gameplay::GetPlayerCharacter(0);
        auto world = playerCharacter.GetWorld();
        FVector actorLocation = playerCharacter.GetActorLocation();
        TArray<APlayerState> result;
        auto availableCharacters = ImGui::GetAllAvailableCharactersAlive(world, Filter);
        for(auto availableCharacter : availableCharacters)
        {
            const auto characterState = Cast<AGothicCharacterState>(availableCharacter);
            if(characterState == nullptr)
                continue;
            const auto target = characterState.GetCharacter();
            if(target == nullptr)
                continue;
            if(target == playerCharacter)
                continue;
            if(target.IsPlayerCharacterOrPlayerControlled())
                continue;

            if(target.IsDead())
                continue;

            if(actorLocation.Distance(target.GetActorLocation()) <= m_MaxDistance)
            {
                result.Add(availableCharacter);
            }            
        }

        return result;
    }
}