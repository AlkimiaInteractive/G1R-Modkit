class UChangeCharacterRelationshipCommand : UCheatCommandBase 
{
    default CommandName = "Change Character Relationship";
    default CommandUsage = "ChangeCharacterRelationship";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 6;

    TSubclassOf<UGameplayEffect> m_GameplayEffectDamage = UGameplayEffect_DebugKillCharacter::StaticClass();

    UPROPERTY()
    APlayerState m_SelectedCharacterA;
    UPROPERTY()
    APlayerState m_SelectedCharacterB;

    UPROPERTY()
    FString m_FilterA;
    UPROPERTY()
    FString m_FilterB;
    UPROPERTY()
    TSubclassOf<UItemRecipeDefinition> CurrentKnownRecipeClass;
    UPROPERTY()
    FString CurrentKnownRecipeName;
    UPROPERTY()
    TSubclassOf<UItemRecipeDefinition> CurrentUnknownRecipeClass;
    UPROPERTY()
    FString CurrentUnknownRecipeName;

    UPROPERTY()
    TSubclassOf<UItemRecipeDefinition> m_ItemDef;

    UPROPERTY()
    FString m_HeaderText = "Change Character Relationship";


    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        //if (ImGui::BeginTabBar("##Tabs"/*, ImGuiTabBarFlags_None*/))
        {
            auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
            m_SelectedCharacterA = ImGui::ImGuiCharacterSelection("Select Character (A)", ImGui::GetAllAvailableCharactersExcluding(world, m_FilterA, nullptr), m_SelectedCharacterA, m_FilterA);
            if(m_SelectedCharacterA == m_SelectedCharacterB)
                m_SelectedCharacterB = nullptr;
            m_SelectedCharacterB = ImGui::ImGuiCharacterSelection("Select Other Character (B)", ImGui::GetAllAvailableCharactersExcluding(world, m_FilterB, m_SelectedCharacterA), m_SelectedCharacterB, m_FilterB);
            if (!ImGui::BeginTabBar("tabs"))
		        return;
            ImGui::ImGuiDisplayCharacterRelationshipTab(m_SelectedCharacterA, m_SelectedCharacterB);
            ImGui::ImGuiDisplayCharacterRelationshipOverrideTab(m_SelectedCharacterA, m_SelectedCharacterB);
            ImGui::EndTabBar();
            ShowFollowButtons();
            ImGui::Separator();
        }
        //#endif
    }

    void ShowFollowButtons()
    {
        if(m_SelectedCharacterA == nullptr || m_SelectedCharacterB == nullptr)
            return;
        const auto follower = Cast<AGothicCharacter>(m_SelectedCharacterB.Pawn);
        if(follower == nullptr)
            return;
        if(follower.IsPlayerCharacterOrPlayerControlled())
            return;
        UGameplayAbility_CharacterAI CharacterAI = Cast<UGameplayAbility_CharacterAI>(follower.AI);
        if(CharacterAI == nullptr)
        {
            return;
        }
        auto abComp = Cast<UGothicAbilitySystemComponent>(follower.GetAbilitySystemComponent());
        bool hasFollowingAbility = abComp.HasTagExact(GameplayTag::AIState_Follow_MarvinMode);
        if(!hasFollowingAbility)
        {
            if (ImGui::Button("Character B Follow Character A"))
            { 
                auto selectedCharacterStateA = Cast<AGothicCharacterState>(m_SelectedCharacterA);
                if(!IsValid(selectedCharacterStateA))
                    return;          
                CharacterAI.SwitchAIStateImmediately(UAIState_FollowCharacterMarvin(selectedCharacterStateA));

            }
        }
        else 
        {
            if (ImGui::Button("Character B Unfollow Character A"))
            {
                CharacterAI.CancelStatesOfClass(UAIState_FollowCharacterMarvin);
            }
        }
    }
}
