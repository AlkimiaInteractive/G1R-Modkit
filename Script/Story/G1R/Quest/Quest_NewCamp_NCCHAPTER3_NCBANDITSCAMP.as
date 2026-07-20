#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_NCBANDITSCAMP-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_NCBANDITSCAMP-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_NCBANDITSCAMP;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_SLD_LEE_700";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b8), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_COMPLETE);
                DC(int64(0x000000b8), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP GetNewCamp_NCCHAPTER3_NCBANDITSCAMP() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */