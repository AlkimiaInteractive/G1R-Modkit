#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TROLLCANYON;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_02, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS GetOldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_FOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */