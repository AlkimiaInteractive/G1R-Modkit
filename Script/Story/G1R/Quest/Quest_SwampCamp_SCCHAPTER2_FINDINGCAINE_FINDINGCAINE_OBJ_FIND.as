#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000070), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_RETURN.StartQuest();
                DC(int64(0x00000070), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND GetSwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */