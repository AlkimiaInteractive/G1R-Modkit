#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItFo_Plants_Mushroom_01, 5, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM GetOldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MUSHROOM::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */