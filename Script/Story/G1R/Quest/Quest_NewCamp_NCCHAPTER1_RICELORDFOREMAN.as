#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDFOREMAN-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDFOREMAN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_RICELORDFOREMAN;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_BAU_RICELORD_900";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000004f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_RICELORDFOREMAN.SucceedQuest();
                DC(int64(0x0000004f), EConversationDebugInfo::Done);
                DC(int64(0x00000050), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RICELORDFOREMAN_COMPLETE);
                DC(int64(0x00000050), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN GetNewCamp_NCCHAPTER1_RICELORDFOREMAN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */