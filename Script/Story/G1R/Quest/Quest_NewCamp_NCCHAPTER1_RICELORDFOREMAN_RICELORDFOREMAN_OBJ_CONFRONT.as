#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000053), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RICELORDFOREMAN_CONFRONT);
                DC(int64(0x00000053), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT GetNewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */