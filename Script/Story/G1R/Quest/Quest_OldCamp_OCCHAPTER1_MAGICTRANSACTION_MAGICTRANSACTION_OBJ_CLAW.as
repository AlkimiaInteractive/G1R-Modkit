#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Wolf_03, 2, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW GetOldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_CLAW::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */