// ---------------------------------------------------------------------------
// 1) A plain selectable choice, only selectable once
// ---------------------------------------------------------------------------
class UChoiceDiego_Example_DiegoConversation_PlainChoice : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = LocText("Example_DiegoConversation_PlainChoice_Caption");

    // Don't offer this choice again once it has been picked.
    default Rules.HideIfKnows(UChoiceDiego_Example_DiegoConversation_PlainChoice);

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(LocText("Example_DiegoConversation_PlainChoice_Player"));
        Diego.AI.Say(LocText("Example_DiegoConversation_PlainChoice_Npc"));
    }
}


// ---------------------------------------------------------------------------
// 2) A choice that opens a small subdialog
// ---------------------------------------------------------------------------
class UChoiceDiego_Example_DiegoConversation_Subdialog : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = LocText("Example_DiegoConversation_Subdialog_Caption");

    default Rules.HideIfKnows(UChoiceDiego_Example_DiegoConversation_Subdialog);

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(LocText("Example_DiegoConversation_Subdialog_Player"));
        Diego.AI.Say(LocText("Example_DiegoConversation_Subdialog_Npc"));

        // Offer the two follow-up topics as a sub-menu.
        Subdialog(
            UChoiceDiego_Example_DiegoConversation_SubdialogA,
            UChoiceDiego_Example_DiegoConversation_SubdialogB
        );
    }
}

class UChoiceDiego_Example_DiegoConversation_SubdialogA : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = LocText("Example_DiegoConversation_SubdialogA_Caption");
    default bIsSubTopic = true;

    default Rules.HideIfKnows(UChoiceDiego_Example_DiegoConversation_SubdialogA);

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(LocText("Example_DiegoConversation_SubdialogA_Player"));
        Diego.AI.Say(LocText("Example_DiegoConversation_SubdialogA_Npc"));
        EndConversation();
    }
}

class UChoiceDiego_Example_DiegoConversation_SubdialogB : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = LocText("Example_DiegoConversation_SubdialogB_Caption");
    default bIsSubTopic = true;

    default Rules.HideIfKnows(UChoiceDiego_Example_DiegoConversation_SubdialogB);

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(LocText("Example_DiegoConversation_SubdialogB_Player"));
        Diego.AI.Say(LocText("Example_DiegoConversation_SubdialogB_Npc"));
        EndConversation();
    }
}

// ---------------------------------------------------------------------------
// 3) A forced topic
// ---------------------------------------------------------------------------
class UChoiceDiego_Example_DiegoConversation_Forced : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    // Forced conversations aren't picked from a list, caption does not matter
    default Caption = FText::FromString("[Forced Conversation]");
    default PriorityRank = -1;
    default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;

    default Rules.HideIfKnows(UChoiceDiego_Example_DiegoConversation_Forced);

    // Fire when Diego is close to his bench
    default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"IO_OC_CHAIR_BENCH_14_DIEGO", 1500.0f);

    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Diego.AI.Say(LocText("Example_DiegoConversation_Forced_Npc"));
    }
}
