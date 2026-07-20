#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c1), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT.StartQuest();
                DC(int64(0x000000c1), EConversationDebugInfo::Done);
                DC(int64(0x000000c2), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RANKUPMERCENARY_VIBRATIONS);
                DC(int64(0x000000c2), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS GetNewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */