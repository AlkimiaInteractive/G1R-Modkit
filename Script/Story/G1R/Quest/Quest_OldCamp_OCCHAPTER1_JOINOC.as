#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_JOINOC : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_JOINOC;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000008e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_JOINOC_COMPLETE);
                DC(int64(0x0000008e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_JOINOC GetOldCamp_OCCHAPTER1_JOINOC() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_JOINOC>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_JOINOC::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */