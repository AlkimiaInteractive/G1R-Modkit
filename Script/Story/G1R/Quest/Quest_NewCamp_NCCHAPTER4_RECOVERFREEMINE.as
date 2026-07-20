#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER4_RECOVERFREEMINE-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_RECOVERFREEMINE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_RECOVERFREEMINE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_SLD_GORN_699";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e0), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RECOVERFREEMINE_COMPLETE);
                DC(int64(0x000000e0), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE GetNewCamp_NCCHAPTER4_RECOVERFREEMINE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */