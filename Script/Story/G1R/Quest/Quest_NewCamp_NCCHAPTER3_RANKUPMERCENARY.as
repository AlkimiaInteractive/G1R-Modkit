#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_RANKUPMERCENARY-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_RANKUPMERCENARY-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_RANKUPMERCENARY;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_SLD_LEE_700";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c4), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RANKUPMERCENARY_COMPLETE);
                DC(int64(0x000000c4), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY GetNewCamp_NCCHAPTER3_RANKUPMERCENARY() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */