#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMi_Inscription_Parchment, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER GetOldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_PAPER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */