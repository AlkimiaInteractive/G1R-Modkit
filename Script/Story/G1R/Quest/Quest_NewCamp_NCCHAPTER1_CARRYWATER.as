#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CARRYWATER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_ORG_LEFTY_844");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_CARRYWATER-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CARRYWATER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_CARRYWATER;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_ORG_LEFTY_844";
            
            AGothicCharacterState GetLefty() const property { return GetCharacter(n"NC_ORG_LEFTY_844"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Lefty != nullptr && Lefty.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CARRYWATER GetNewCamp_NCCHAPTER1_CARRYWATER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CARRYWATER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CARRYWATER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */