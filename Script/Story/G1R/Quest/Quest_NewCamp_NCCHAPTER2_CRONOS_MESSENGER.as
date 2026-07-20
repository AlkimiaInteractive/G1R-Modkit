#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER2_CRONOS_MESSENGER-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_CRONOS_MESSENGER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_CRONOS_MESSENGER;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_KDW_CRONOS_604";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000091), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_CRONOSMESSENGER_COMPLETE);
                DC(int64(0x00000091), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER GetNewCamp_NCCHAPTER2_CRONOS_MESSENGER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */