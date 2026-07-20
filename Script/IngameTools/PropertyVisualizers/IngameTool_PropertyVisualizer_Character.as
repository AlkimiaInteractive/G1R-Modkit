class UIngameTool_PropertyVisualizer_Character : UIngameTool_SelectedActorProperties_ActorVisualizer
{
    default ForActorsOfClass = AGothicCharacter;
    default Title = "Character";

    void DrawImGuiForActor() override
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(Actor);

        if (!IsValid(Character))
            return;

        FString DisplayName = Character.GetCharacterDisplayName().ToString();
        FString UniqueName = Character.GetCharacterUniqueName().ToString();
        FString GlobalId = Character.GetCharacterGlobalId().ToString();

        ImGui::InputText(f"Display Name", DisplayName, ImGuiInputTextFlags::ReadOnly);
        ImGui::InputText(f"Unique Name", UniqueName, ImGuiInputTextFlags::ReadOnly);
        ImGui::InputText(f"Global Id", GlobalId, ImGuiInputTextFlags::ReadOnly);

        if (!IsValid(Character.CharacterState))
        {
            ImGui::TextDisabled("[No CharacterState]");
            return;
        }

        ImGui::SeparatorText("Attributes");

        if (ImGui::BeginTable("Attributes", 2, ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg | ImGuiTableFlags::SizingFixedFit))
        {
            ImGui::TableSetupColumn("Attribute");
            ImGui::TableSetupColumn("Value", ImGuiTableColumnFlags::WidthStretch);
            ImGui::TableHeadersRow();

            DrawAttributeRow("Health", f"{int(Character.GetHealthAttribute())}/{int(Character.GetMaxHealthAttribute())}");
            DrawAttributeRow("Mana", f"{int(Character.GetManaAttribute())}/{int(Character.GetMaxManaAttribute())}");
            DrawAttributeRow("Level", f"{int(Character.GetLevelAttribute() + 0.5f)}");
            DrawAttributeRow("Experience", f"{int(Character.GetExperienceAttribute() + 0.5f)}");
            DrawAttributeRow("Skillpoints", f"{int(Character.GetSkillpointsAttribute() + 0.5f)}");
            DrawAttributeRow("Strength", f"{int(Character.GetStrengthAttribute() + 0.5f)}");
            DrawAttributeRow("Dexterity", f"{int(Character.GetDexterityAttribute() + 0.5f)}");

            ImGui::EndTable();
        }
    }

    private void DrawAttributeRow(FString AttributeName, FString Value)
    {
        ImGui::TableNextRow();
        ImGui::TableNextColumn();
        ImGui::Text(AttributeName);
        ImGui::TableNextColumn();
        ImGui::Text(Value);
    }
}

class UIngameTool_PropertyVisualizer_NPCCharacter : UIngameTool_SelectedActorProperties_ActorVisualizer
{
    default ForActorsOfClass = AAIAgentCharacter;
    default Title = "NPC Character";

    void DrawImGuiForActor() override
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(Actor);

        if (!IsValid(Character))
            return;

        AGothicNPCState NPCState = Cast<AGothicNPCState>(Character.CharacterState);

        if (!IsValid(NPCState))
            return;

        ImGui::SeparatorText("AI");
        ImGui::Text(f"AIState: {NPCState.AIAbility.CurrentState}");
        ImGui::Text(f"Assigned Routine: {NPCState.DailyRoutineTemplate}");
    }
}
