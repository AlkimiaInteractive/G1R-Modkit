#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT.StartQuest();
                DC(int64(0x000000f2), EConversationDebugInfo::Done);
                DC(int64(0x000000f3), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_MCPLATEARMOR_DELIVER);
                DC(int64(0x000000f3), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER GetNewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */