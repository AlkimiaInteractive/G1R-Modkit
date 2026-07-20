#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TROLLCANYON;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_02, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS GetOldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */