#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"BC_BAN_BRANNOK_863");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetBrannok() const property { return GetCharacter(n"BC_BAN_BRANNOK_863"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Brannok != nullptr && Brannok.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS GetSwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */