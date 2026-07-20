#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000f), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DELIVERWEED_VIRAN);
                DC(int64(0x0000000f), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN GetSwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */