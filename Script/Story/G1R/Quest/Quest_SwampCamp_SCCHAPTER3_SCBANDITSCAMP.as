#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP : UG1RQuest
        {
            default InvolvedCharacters.Add(n"BC_BAN_QUENTIN");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_SCBANDITSCAMP-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_SCBANDITSCAMP-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_SCBANDITSCAMP;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_GUR_BAALORUN_1209";
            
            AGothicCharacterState GetBC_BAN_QUENTIN() const property { return GetCharacter(n"BC_BAN_QUENTIN"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return BC_BAN_QUENTIN != nullptr && BC_BAN_QUENTIN.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e7), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_COMPLETE);
                DC(int64(0x000000e7), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP GetSwampCamp_SCCHAPTER3_SCBANDITSCAMP() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */