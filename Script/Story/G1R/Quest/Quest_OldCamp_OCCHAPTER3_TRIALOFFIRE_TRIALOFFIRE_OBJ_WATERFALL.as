#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000115), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_TRIALOFFIRE_WATERFALL);
                DC(int64(0x00000115), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL GetOldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */