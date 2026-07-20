#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MORDRAGKO : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_MORDRAGKO-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MORDRAGKO-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_MORDRAGKO;
            default QuestGiverCharacterUniqueName = n"OC_GRD_THORUS_200";
            default QuestKind = EQuestKind::Side;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x0000000e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MORDRAGKO GetOldCamp_OCCHAPTER1_MORDRAGKO() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MORDRAGKO>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MORDRAGKO::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */