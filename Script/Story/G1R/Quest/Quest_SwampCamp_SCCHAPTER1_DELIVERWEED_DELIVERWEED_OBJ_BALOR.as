#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000016), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DELIVERWEED_BALOR);
                DC(int64(0x00000016), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR GetSwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */