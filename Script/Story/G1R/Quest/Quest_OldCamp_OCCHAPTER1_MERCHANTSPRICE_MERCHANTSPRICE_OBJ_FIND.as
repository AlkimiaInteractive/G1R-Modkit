#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Scroll_Certificate, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND GetOldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */