#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_SYRARECIPE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_WOC_SYRA_109");
            default InvolvedCharacters.Add(n"OC_VLK_SNAF_581");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_SYRARECIPE;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_VLK_SNAF_581";
            
            AGothicCharacterState GetSyra() const property { return GetCharacter(n"OC_WOC_SYRA_109"); }
            AGothicCharacterState GetSnaf() const property { return GetCharacter(n"OC_VLK_SNAF_581"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return ((Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE != nullptr && !Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE.HasBeenStarted() && Syra != nullptr && Syra.IsEveryoneOfThisKindDead())) || (Snaf != nullptr && Snaf.IsEveryoneOfThisKindDead());
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_SYRARECIPE GetOldCamp_OCCHAPTER2_SYRARECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_SYRARECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_SYRARECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */