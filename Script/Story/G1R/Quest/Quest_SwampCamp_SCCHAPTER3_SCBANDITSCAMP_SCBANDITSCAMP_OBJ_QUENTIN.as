#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_REPORT.StartQuest();
                DC(int64(0x000000e4), EConversationDebugInfo::Done);
                DC(int64(0x000000e5), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_QUENTIN);
                DC(int64(0x000000e5), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN GetSwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_QUENTIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */