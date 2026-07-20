#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_JOINWATERMAGES;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_KDW_SATURAS_600";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000cf), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_JOINWATERMAGES_COMPLETE);
                DC(int64(0x000000cf), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES GetNewCamp_NCCHAPTER3_JOINWATERMAGES() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */