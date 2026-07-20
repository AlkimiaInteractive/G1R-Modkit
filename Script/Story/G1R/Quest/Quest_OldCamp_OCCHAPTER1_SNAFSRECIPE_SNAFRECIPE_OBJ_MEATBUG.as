#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Meatbug_01, 3, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG GetOldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE_SNAFRECIPE_OBJ_MEATBUG::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */