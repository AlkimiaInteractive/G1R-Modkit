#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000010b), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_REPORT.StartQuest();
                DC(int64(0x0000010b), EConversationDebugInfo::Done);
                DC(int64(0x0000010c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_QUENTIN);
                DC(int64(0x0000010c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN GetOldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_QUENTIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */