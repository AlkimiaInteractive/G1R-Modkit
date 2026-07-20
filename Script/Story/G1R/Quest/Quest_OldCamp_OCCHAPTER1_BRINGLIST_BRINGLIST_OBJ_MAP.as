#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Map_OldMine, 1, 0);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP GetOldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_MAP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */