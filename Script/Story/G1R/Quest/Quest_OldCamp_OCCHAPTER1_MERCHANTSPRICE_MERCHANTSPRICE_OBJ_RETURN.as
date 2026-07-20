#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Scroll_Certificate, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN GetOldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE_MERCHANTSPRICE_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */