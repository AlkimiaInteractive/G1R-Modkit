struct FRelativeCrimeImGuiHistoryMarvin
{
    FRelativeCrimeImGuiHistoryMarvin(AGothicCharacterState Instigator)
    {
        InstigatorCharacterState = Instigator;
    }

    UPROPERTY()
    AGothicCharacterState InstigatorCharacterState;

    TMap<int, FCrimeImGuiSeverityStackContainerMarvin> SeverityContainers;

    float CurrentCumulativeSeverity;
    FRelativeCrimeImGuiEntryMarvin TotalWorstCrime;
}

struct FCrimeImGuiSeverityStackContainerMarvin
{
    FCrimeImGuiSeverityStackContainerMarvin(FString DisplayName, float MaxSeverity)
    {
        MaximumSeverity = MaxSeverity;
        Name = DisplayName;
    }

    UPROPERTY()
    TArray<FRelativeCrimeImGuiEntryMarvin> Crimes;
    
    UPROPERTY()
    FCrimeSeverityResult Result;

    UPROPERTY()
    FRelativeCrimeImGuiEntryMarvin WorstCrime;

    UPROPERTY()
    const FString Name;

    UPROPERTY()
    const float MaximumSeverity;
}

struct FGlobalCrimeImGuiHistoryMarvin
{
    UPROPERTY()
    AGothicCharacterState InstigatorCharacterState;

    UPROPERTY()
    TArray<FGlobalCrimeDataEntry> Crimes;
}

struct FRelativeCrimeImGuiEntryMarvin
{
    UPROPERTY()
    FCrimeEntry CrimeEntry;

    UPROPERTY()
    float Severity = 0.0f;
}

class UCrimeCommand : UCheatCommandBase
{
    //default MenuEntry = "AI:Crime";

    default CommandName = "Crime";
    default CommandUsage = "CrimeCommand";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 8;

    FString SecondCharacterLabel = "PotentialCriminal";
    private AGothicCharacterState CurrentlyDisplayedCharacter;

    UPROPERTY()
    TArray<FRelativeCrimeImGuiHistoryMarvin> RelativeCrimeHistories;

    UPROPERTY()
    TArray<FGlobalCrimeImGuiHistoryMarvin> GlobalCrimeHistories;
    UPROPERTY()
    AGothicCharacterState m_SelectedCharacterState;
    UPROPERTY()
    AGothicNPCState m_SelectedNPCState;
    UPROPERTY()
    APlayerState m_SelectedCharacter;

    UPROPERTY()
    FString m_Filter;

    bool ShouldShowPlayer(AGothicPlayerState PlayerState) const
    {
        return false;
    }


    bool ShouldShowNPC(AGothicNPCState NPCState) const
    {
        if (!IsValid(NPCState))
            return false;

        return true;
    }

    TArray<APlayerState> GetAllAvailableCharacters()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
        TArray<APlayerState> result;
        auto availableCharacters = ImGui::GetAllAvailableCharacters(world, m_Filter);
        for(auto availableCharacter : availableCharacters)
        {
            const auto characterState = Cast<AGothicCharacterState>(availableCharacter);
            if(characterState == nullptr)
                continue;

            const auto target = characterState.GetCharacter();
            if(target == nullptr)
                continue;

            if(target.IsDead())
                continue;
            if(!target.IsPlayerCharacterOrPlayerControlled())
            {
                if(target.IsHuman())
                    result.Add(availableCharacter);
            }
        }

        return result;
    }


    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto playerCharacter =  Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        m_SelectedCharacterState = playerCharacter.CharacterState;

        m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character", GetAllAvailableCharacters(), m_SelectedCharacter, m_Filter);
        m_SelectedNPCState = Cast<AGothicNPCState>(m_SelectedCharacter);

        ImGui::BeginTabBar("Tabs");
        if (ImGui::BeginTabItem("Global Crime"))
        {
            ImGui::Indent(20.0f);
            DisplayGlobalCrimeTab();
            ImGui::Indent(-20.0f);
            ImGui::Separator();
            ImGui::EndTabItem();
        }
        ImGui::EndTabBar();
    }

    UFUNCTION(BlueprintCallable)
    void DisplayGlobalCrimeTab()
    {
        if (CurrentlyDisplayedCharacter != m_SelectedCharacterState)
        {
            CurrentlyDisplayedCharacter = m_SelectedCharacterState;
            LoadGlobalCrimes();
        }

        if (ImGui::Button("Reload Crimes"))
        {
            LoadGlobalCrimes();
        }
        
        DisplayGlobalCrimes();
    }

    UFUNCTION(BlueprintCallable)
    void LoadGlobalCrimes()
    {
        GlobalCrimeHistories.Reset();

        if(!IsValid(m_SelectedNPCState))
            return;

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(m_SelectedNPCState.AIAbility);

        if (!IsValid(GothicAI))
            return;
        
        auto CrimeMemory = UCrimeMemorySubsystem::Get(GothicAI);

        // Get All Crimes
        TArray<int> CrimeIDs = CrimeMemory.GetAllCrimesCommitedBefore(FInGameTime::Now());

        TMap<AGothicCharacterState, FGlobalCrimeImGuiHistoryMarvin> MappedCrimeHistories;

        for (int i = CrimeIDs.Num() - 1; i >= 0; i--)
        {
            int CrimeID = CrimeIDs[i];
            
            // Create crime entry
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            AGothicCharacterState InstigatorCharacterState = AGothicCharacterState::FindByGlobalId(GlobalCrimeData.CriminalGlobalID);

            if (!IsValid(InstigatorCharacterState))
            {
                Log("[ImGui][Crime] - Trying to load crimes of invalid criminal");
            }

            // Insert crime into history if it exists
            if (MappedCrimeHistories.Contains(InstigatorCharacterState))
            {
                MappedCrimeHistories[InstigatorCharacterState].Crimes.Add(GlobalCrimeData);
                continue;
            }

            // Create new history if it doesn't exist
            auto NewCrimeImGuiHistory = FGlobalCrimeImGuiHistoryMarvin();
            NewCrimeImGuiHistory.InstigatorCharacterState = InstigatorCharacterState;
            NewCrimeImGuiHistory.Crimes.Add(GlobalCrimeData);
            MappedCrimeHistories.Add(InstigatorCharacterState, NewCrimeImGuiHistory);
        }
        
        // Save mapped histories
        for (auto History : MappedCrimeHistories)
        {
            GlobalCrimeHistories.Add(History.Value);
        }
    }

    UFUNCTION(BlueprintCallable)
    void DisplayGlobalCrimes()
    {
        if(!IsValid(m_SelectedNPCState))
            return;

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(m_SelectedNPCState.AIAbility);

        if (!IsValid(GothicAI))
            return;

        auto CrimeMemorySubsystem = UCrimeMemorySubsystem::Get(GothicAI);

        if (!IsValid(CrimeMemorySubsystem))
            return;

        bool bDeletedCrimes = false;

        ImGui::SameLine();
        ImGui::PushID("DeleteAllButton" + m_SelectedNPCState.CharacterUniqueName);
        if (ImGui::Button("Delete All Crimes"))
        {
            for (auto History : GlobalCrimeHistories)
            {
                for (auto CrimeImGuiEntry : History.Crimes)
                {
                    CrimeMemorySubsystem.RemoveCrime(CrimeImGuiEntry.ID);
                    bDeletedCrimes = true;
                }
            }
        }
        ImGui::PopID();

        for (auto History : GlobalCrimeHistories)
        {
            if (!IsValid(History.InstigatorCharacterState))
                continue;

            if (!ImGui::CollapsingHeader(History.InstigatorCharacterState.CharacterGlobalId.ToString()))
                continue;

            ImGui::PushID("DeleteAllForCharacterButton" + History.InstigatorCharacterState);
            if (ImGui::Button("Delete All Character Crimes "))
            {
                for (auto CrimeImGuiEntry : History.Crimes)
                {
                    CrimeMemorySubsystem.RemoveCrime(CrimeImGuiEntry.ID);
                    bDeletedCrimes = true;
                }
            }
            ImGui::PopID();
            
            ImGui::Indent(20.0f);
            int Index = 0;
            for (auto CrimeImGuiEntry : History.Crimes)
            {

                ImGui::PushID(CrimeImGuiEntry.ID);
                DisplayGlobalCrime(History.InstigatorCharacterState, CrimeImGuiEntry, Index);
                ImGui::SameLine();
                if (ImGui::Button("Delete Crime"))
                {
                    CrimeMemorySubsystem.RemoveCrime(CrimeImGuiEntry.ID);     
                    bDeletedCrimes = true;     
                }
                ImGui::PopID();
                Index++;
            }

            ImGui::Indent(-20.0f);
        }

        if (bDeletedCrimes)
        {
            LoadGlobalCrimes();
        }
    }
    
    void DisplayGlobalCrime(AGothicCharacterState Instigator, FGlobalCrimeDataEntry GlobalCrimeDataEntry, int Index)
    {
        /////////////////
        // CRIME HEADER
        /////////////////
        ImGui::Separator();
        ImGui::Separator();
        
        ImGui::PushID(Instigator.CharacterUniqueName.ToString() + GlobalCrimeDataEntry.ID + f"{Index}");
        if (!ImGui::TreeNodeColored(GlobalCrimeDataEntry.CrimeType.TagName.ToString(), FColor::Yellow, false))
        {
            ImGui::PopID();
            return;
        }
        ImGui::PopID();


        ImGui::Text(f"ID: {GlobalCrimeDataEntry.ID}");

        // Time and place committed
        ImGui::BeginDisabled();
        ImGui::Text(f"{Math::FloorToInt(GlobalCrimeDataEntry.TimeCommitted.AgeInRealtimeSeconds)}s ago"); ImGui::SameLine();
        ImGui::Text(" /// "); ImGui::SameLine(); DisplayAge(GlobalCrimeDataEntry.TimeCommitted.AgeInIngameSeconds);
        if (GlobalCrimeDataEntry.AreaTag.IsValid())
        {
            ImGui::SameLine(); ImGui::Text("@ " + GlobalCrimeDataEntry.AreaTag.TagName);
        }
        ImGui::EndDisabled();
        ////

        ImGui::Separator();

        //////////////////////////////////////////////////////

        /////////////////
        // STATUS
        /////////////////

        ImGui::BeginDisabled();
        ImGui::CollapsingHeader("Status", true);
        ImGui::EndDisabled();
        ImGui::Indent(10.0f);

        // Source and reliability
        FString AffectedEntitySourceText = f"{GlobalCrimeDataEntry.AffectedEntitySource}"; AffectedEntitySourceText.RemoveFromStart("ECrimeAffectedEntitySource::");
        ImGui::Text("Memory source type: " + AffectedEntitySourceText);
        ///

        // Crime memory status
        ImGui::Text("Forgiven:"); ImGui::SameLine(); ImGui::BoolIcon(GlobalCrimeDataEntry.bIsForgiven);

        // Item and interactive object
        if (IsValid(GlobalCrimeDataEntry.ItemDefinitionClass))
        {
            ImGui::Text("Related item:"); ImGui::SameLine(); ImGui::Text(GlobalCrimeDataEntry.ItemDefinitionClass.DefaultObject.Name.ToString());
        }
        if (IsValid(GlobalCrimeDataEntry.InteractiveObjectDefinitionClass))
        {
            ImGui::Text("Related Interactable:"); ImGui::SameLine(); ImGui::Text(GlobalCrimeDataEntry.InteractiveObjectDefinitionClass.DefaultObject.Name.ToString());
        }

        // Directness
        ImGui::Text("Personal: " + (!GlobalCrimeDataEntry.VictimGlobalIDs.IsEmpty() ? "Yes" : "No"));

        ImGui::Indent(-10.0f);

        //////////////////////////////////////////////////////

        /////////////////
        // Criminal info
        /////////////////

        ImGui::BeginDisabled();
        ImGui::CollapsingHeader("Criminal", true);
        ImGui::EndDisabled();
        ImGui::Indent(10.0f);

        DisplayCharacterInfo(GlobalCrimeDataEntry.CriminalGlobalID, bDisplayRelationships = false, Guild = GlobalCrimeDataEntry.CriminalGuild);

        ImGui::Indent(-10.0f);

        //////////////////////////////////////////////////////

        /////////////////
        // Victims info
        /////////////////

        ImGui::BeginDisabled();
        ImGui::CollapsingHeader("Victims", true);
        ImGui::EndDisabled();
        ImGui::Indent(10.0f);

        for (auto VictimGlobalID : GlobalCrimeDataEntry.VictimGlobalIDs)
        {
            DisplayCharacterInfo(VictimGlobalID, bDisplayRelationships = false);
        }

        for (auto VictimGuild : GlobalCrimeDataEntry.VictimGuilds.GameplayTags)
        {
            DisplayGuildInfo(VictimGuild, bDisplayRelationships = false);
        }

        ImGui::Indent(-10.0f);

        //////////////////////////////////////////////////////

        if (GlobalCrimeDataEntry.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
        {
            ImGui::Separator();
            ImGui::BeginDisabled();
            ImGui::CollapsingHeader("Pickpocketed Items (victim LTM)", true);
            ImGui::EndDisabled();
            ImGui::Indent(10.0f);

            float CrimeT = GlobalCrimeDataEntry.TimeCommitted.TotalSeconds;
            const float PickpocketEvtBeforeCrimeSec = 45.0f;
            const float PickpocketEvtAfterCrimeSec = 15.0f;

            for (auto VictimGlobalID : GlobalCrimeDataEntry.VictimGlobalIDs)
            {
                AGothicCharacterState Victim = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
                if (!IsValid(Victim))
                    continue;

                TArray<FMemorizedEvent> AllPick = Victim.LongTermMemory
                    .Filter()
                    .WithTag(GameplayTag::Perception_ItemRemovedByPickpocket)
                    .CausedBy(Instigator.CharacterGlobalId)
                    .Affecting(Victim.CharacterGlobalId)
                    .Array;

                TArray<FMemorizedEvent> Events;
                for (auto Evt : AllPick)
                {
                    float EvT = Evt.Time.TotalSeconds;
                    if (EvT < CrimeT - PickpocketEvtBeforeCrimeSec || EvT > CrimeT + PickpocketEvtAfterCrimeSec)
                        continue;
                    Events.Add(Evt);
                }

                if (Events.IsEmpty())
                {
                    ImGui::TextDisabled("(no LTM events in game-time window vs crime TimeCommitted)");
                    continue;
                }

                for (auto Evt : Events)
                {
                    int Amount = Math::FloorToInt(Evt.Magnitude);
                    auto ResolvedClass = Evt.OptionalClass1.Get();
                    auto ItemDefCDO = IsValid(ResolvedClass) ? Cast<UItemDefinition>(ResolvedClass.GetDefaultObject()) : nullptr;
                    if (IsValid(ItemDefCDO))
                        ImGui::Text(f"  {ItemDefCDO.Name} x{Amount}");
                    else
                        ImGui::TextDisabled(f"  (invalid class) x{Amount}");
                }
            }

            ImGui::Indent(-10.0f);
        }

        ImGui::TreePop();
    }

    void DisplayAge(float AgeInIngameSeconds)
    {
        int Seconds = Math::FloorToInt(AgeInIngameSeconds) % 60;
        int TotalMinutes = Math::FloorToInt((AgeInIngameSeconds - Seconds) / 60);
        int Minutes = TotalMinutes % 60;
        int TotalHours = Math::FloorToInt((TotalMinutes - Minutes) / 60.0f);
        int Hours = TotalHours % 24;
        int Days = Math::FloorToInt((TotalHours - Hours) / 24.0f);

        ImGui::SameLine();

        bool bShowDays = Days > 0;
        bool bShowHours = Hours > 0;
        bool bShowMinutes = Minutes > 0;

        FString DaysText = bShowDays ? f"{Days}d " : "";
        FString HoursText = bShowHours ? f"{Hours}h " : "";
        FString MinutesText = bShowMinutes ? f"{Minutes}m " : "";
        FString SecondsText = f"{Seconds}s ";

        ImGui::Text(DaysText + HoursText + MinutesText + "ago");               
    }

    void DisplayGuildInfo(FGameplayTag Guild, ERelationship Relationship = ERelationship::Unknown, ERelationshipHostility Hostility = ERelationshipHostility::Unknown, ERelationshipRelativeRank RelativeRank = ERelationshipRelativeRank::Unknown, bool bDisplayRelationships = true)
    {
        ImGui::Text("Guild: " + Guild.TagName.ToString());
        
        if (!bDisplayRelationships)
            return;

        ImGui::Indent(10.0f);

        FString RelationshipText = GetRelationshipText(Relationship);
        FString HostilityText = GetHostilityText(Hostility);
        FString RelativeRankText = GetRelativeRankText(RelativeRank);

        ImGui::Text("Relationship:");
        PushRelationshipColor(Relationship);
        ImGui::SameLine(); ImGui::Text(RelationshipText);
        ImGui::PopStyleColor();

        ImGui::Text("Hostility:");
        PushHostilityColor(Hostility);
        ImGui::SameLine(); ImGui::Text(HostilityText);
        ImGui::PopStyleColor();
        
        ImGui::Text("Relative Rank:");
        PushRelativeRankColor(RelativeRank);
        ImGui::SameLine(); ImGui::Text(RelativeRankText);
        ImGui::PopStyleColor();

        ImGui::Indent(-10.0f);
    }

    void DisplayCharacterInfo(FName CharacterGlobalID, ERelationship Relationship = ERelationship::Unknown, ERelationshipRelativeRank RelativeRank = ERelationshipRelativeRank::Unknown, ERelationshipHostility Hostility = ERelationshipHostility::Unknown, FGameplayTag Guild = FGameplayTag::Empty, bool bDisplayRelationships = true)
    {
        FString DisplayName; FString SplitName; FString NameRemainder;
        if (CharacterGlobalID.ToString().Split("-", SplitName, NameRemainder))
        {
            DisplayName = SplitName;
        }
        else
        {
            DisplayName = CharacterGlobalID.ToString();
        }

        ImGui::Text("Character:");
        if (CharacterGlobalID == CurrentlyDisplayedCharacter.CharacterGlobalId)
        {
            ImGui::SameLine(); ImGui::TextColored(FColor::Green, "[SELF]");
        }
        ImGui::SameLine(); ImGui::Text(DisplayName);

        ImGui::Indent(10.0f);

        if (Guild.IsValid())
        {
            ImGui::Text("Guild: " + Guild.TagName.ToString());
        }

        if (bDisplayRelationships)
        {
            FString RelationshipText = GetRelationshipText(Relationship);
            FString HostilityText = GetHostilityText(Hostility);
            FString RelativeRankText = GetRelativeRankText(RelativeRank);

            ImGui::Text("Relationship:");
            PushRelationshipColor(Relationship);
            ImGui::SameLine(); ImGui::Text(RelationshipText);
            ImGui::SameLine(); ImGui::Text(" - ");
            ImGui::SameLine(); ImGui::Text(RelationshipText);
            ImGui::PopStyleColor();

            ImGui::Text("Hostility:");
            PushHostilityColor(Hostility);
            ImGui::SameLine(); ImGui::Text(HostilityText);
            ImGui::SameLine(); ImGui::Text(" - ");
            ImGui::SameLine(); ImGui::Text(HostilityText);
            ImGui::PopStyleColor();

            ImGui::Text("Relative Rank:");
            PushRelativeRankColor(RelativeRank);
            ImGui::SameLine(); ImGui::Text(RelativeRankText);
            ImGui::PopStyleColor();
        }            

        ImGui::Indent(-10.0f);
    }

    void PushRelationshipColor(ERelationship Relationship)
    {
        switch (Relationship)
        {
            case ERelationship::Friend:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Green);
                break;
            
            case ERelationship::Neutral:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor(160, 160, 160));
                break;

            case ERelationship::Angry:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Yellow);
                break;

            case ERelationship::Hostile:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Orange);
                break;

            case ERelationship::Enemy:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Red);
                break;
            
            case ERelationship::Unknown:
            case ERelationship::ERelationship_MAX:
            default:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Purple);
                break;
        }
    }

    void PushHostilityColor(ERelationshipHostility Hostility)
    {
        switch (Hostility)
        {
            case ERelationshipHostility::Help:
            case ERelationshipHostility::CloseFriend:
            case ERelationshipHostility::ProtectFromNonFriendly:
            case ERelationshipHostility::ProtectFromCreature:
            case ERelationshipHostility::ProtectFromDifferentGuild:
            case ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction:
            case ERelationshipHostility::ProtectFromDifferentGuild_Premium:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Green);
                break;
            
            case ERelationshipHostility::None:
            case ERelationshipHostility::FollowOnSight:
            case ERelationshipHostility::LowThreatMagicTarget:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor(160, 160, 160));
                break;

            case ERelationshipHostility::TrainingFight:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Yellow);
                break;

            case ERelationshipHostility::ReportToGuardsWithinReason:
            case ERelationshipHostility::AttackWithinReason:
            case ERelationshipHostility::AttackWithFistsWithinReason:
            case ERelationshipHostility::Loot:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Orange);
                break;

            case ERelationshipHostility::Predator:
            case ERelationshipHostility::Prey:
            case ERelationshipHostility::FleeOnSight:
            case ERelationshipHostility::MagicFear:
            case ERelationshipHostility::AttackOnSight:
            case ERelationshipHostility::AttackWithFistsOnSight:
            case ERelationshipHostility::ReportToGuardsOnSight:
            case ERelationshipHostility::Execute:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Red);
                break;

            case ERelationshipHostility::Unknown:
            case ERelationshipHostility::Count:
            case ERelationshipHostility::ERelationshipHostility_MAX:
            default:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Purple);
                break;
        }
    }

    void PushRelativeRankColor(ERelationshipRelativeRank Relationship)
    {
        switch (Relationship)
        {
            case ERelationshipRelativeRank::Boss:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Green);
                break;
            
            case ERelationshipRelativeRank::HigherThanMe:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Cyan);
                break;

            case ERelationshipRelativeRank::Same:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor(160, 160, 160));
                break;

            case ERelationshipRelativeRank::LowerThanMe:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Yellow);
                break;

            case ERelationshipRelativeRank::Scum:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Orange);
                break;
            
            case ERelationshipRelativeRank::Unknown:
            case ERelationshipRelativeRank::ERelationshipRelativeRank_MAX:
            default:
                ImGui::PushStyleColor(ImGuiCol::Text, FColor::Purple);
                break;
        }
    }

    FString GetRelationshipText(ERelationship Relationship)
    {
        FString ResultText = f"{Relationship}"; ResultText.RemoveFromStart("ERelationship::");
        FString RestOfTheText;
        ResultText.Split(" ", ResultText, RestOfTheText);
        return ResultText;
    }

    FString GetHostilityText(ERelationshipHostility Hostility)
    {
        FString ResultText = f"{Hostility}"; ResultText.RemoveFromStart("ERelationshipHostility::");
        FString RestOfTheText;
        ResultText.Split(" ", ResultText, RestOfTheText);
        return ResultText;
    }

    FString GetRelativeRankText(ERelationshipRelativeRank RelativeRank)
    {
        FString ResultText = f"{RelativeRank}"; ResultText.RemoveFromStart("ERelationshipRelativeRank::");
        FString RestOfTheText;
        ResultText.Split(" ", ResultText, RestOfTheText);
        return ResultText;
    }
}