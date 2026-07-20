#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d2), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_CRAFT.StartQuest();
                DC(int64(0x000000d2), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF GetOldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */