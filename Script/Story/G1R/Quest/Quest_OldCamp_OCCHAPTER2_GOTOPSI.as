#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_GOTOPSI : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER2_GOTOPSI-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_GOTOPSI-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_GOTOPSI;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_EBR_RAVEN_105";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a5), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_GOTOPSICAMP_COMPLETE);
                DC(int64(0x000000a5), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_GOTOPSI GetOldCamp_OCCHAPTER2_GOTOPSI() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_GOTOPSI>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_GOTOPSI::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */