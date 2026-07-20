class UDespawnTargetedCommand : UKillTargetedCommand 
{
    default CommandName = "Despawn Targeted";
    default CommandUsage = "Despawn Targeted NPC";

    
    default m_HeaderText = "Select the target npc you want to despawn";
    default m_ButtonText = "Despawn Targeted NPC";

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        //@DE - Temporal var due Super::ExecuteCommand(args) set m_SelectedCharacter to null once finish.
        auto localCharacter = m_SelectedCharacter;
        //@DE - NOT EXECUTE ON PLAYER CHARACTER OR PLAYER CONTROLLED CHARACTER
        if(Super::ExecuteCommand(args))
        {
            m_SelectedCharacter = localCharacter;
            //remove from world
            if(m_SelectedCharacter == nullptr)
                return false;
            const auto target = Cast<AGothicCharacter>(m_SelectedCharacter.Pawn);
            if(target == nullptr)
                return false;
            auto npcState = target.GetCharacterState().NPCState;
            if(npcState == nullptr)
                return false;
            npcState.RemoveFromWorld();
            m_SelectedCharacter = nullptr;
            return true;
        }
        return false;
    }

    TArray<APlayerState> GetAllAvailableCharacters() override
    {
        //@DE - REMOVE PLAYER CHARACTER OR PLAYER CONTROLLED CHARACTER
        TArray<APlayerState> result;
        auto availableCharacters = Super::GetAllAvailableCharacters();
        for(auto availableCharacter : availableCharacters)
        {
            const auto characterState = Cast<AGothicCharacterState>(availableCharacter);
            if(characterState == nullptr)
                continue;

            const auto target = characterState.GetCharacter();
            if(target == nullptr)
                continue;

            if(!target.IsPlayerCharacterOrPlayerControlled())
            {
                result.Add(availableCharacter);
            }
        }

        return result;
    }

}
