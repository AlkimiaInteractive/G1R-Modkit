#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000114), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_TRIALOFFIRE_SEA);
                DC(int64(0x00000114), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA GetOldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */