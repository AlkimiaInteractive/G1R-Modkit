#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Scroll_Kalom, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION GetOldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE_KALOMSRECIPE_OBJ_GETPOTION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */