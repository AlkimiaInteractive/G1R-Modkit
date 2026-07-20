#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_JOINNC : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_JOINNC-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_JOINNC-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_JOINNC;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000007d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_JOINNC_COMPLETE);
                DC(int64(0x0000007d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_JOINNC GetNewCamp_NCCHAPTER1_JOINNC() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_JOINNC>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_JOINNC::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */