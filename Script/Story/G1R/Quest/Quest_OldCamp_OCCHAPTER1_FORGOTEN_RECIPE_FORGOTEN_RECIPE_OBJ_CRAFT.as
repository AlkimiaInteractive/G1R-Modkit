#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItFo_Ottostew, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000031), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_RETURN.StartQuest();
                DC(int64(0x00000031), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT GetOldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE_FORGOTEN_RECIPE_OBJ_CRAFT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */