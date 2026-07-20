#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b5), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_REPORT.StartQuest();
                DC(int64(0x000000b5), EConversationDebugInfo::Done);
                DC(int64(0x000000b6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSCAMP_QUENTIN);
                DC(int64(0x000000b6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN GetNewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_QUENTIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */