#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_OCBANDITSCAMP-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_OCBANDITSCAMP-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_OCBANDITSCAMP;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_GRD_THORUS_200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000010e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_COMPLETE);
                DC(int64(0x0000010e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP GetOldCamp_OCCHAPTER3_OCBANDITSCAMP() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */