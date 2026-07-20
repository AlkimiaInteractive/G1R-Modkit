#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTNEK;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Amulet_Neks, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK GetOldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */