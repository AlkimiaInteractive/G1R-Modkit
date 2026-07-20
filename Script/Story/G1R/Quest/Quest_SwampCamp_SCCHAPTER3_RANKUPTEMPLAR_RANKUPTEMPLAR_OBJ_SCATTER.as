#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Yberion_Ashes > 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c8), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_RETURN.StartQuest();
                DC(int64(0x000000c8), EConversationDebugInfo::Done);
                DC(int64(0x000000c9), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_RANKUPTEMPLAR_SCATTER);
                DC(int64(0x000000c9), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER GetSwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */