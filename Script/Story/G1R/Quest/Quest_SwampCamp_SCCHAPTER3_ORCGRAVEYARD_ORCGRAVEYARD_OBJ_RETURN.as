#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OG_GUR_BAALLUKOR_1211");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetBaalLukor() const property { return GetCharacter(n"OG_GUR_BAALLUKOR_1211"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return BaalLukor != nullptr && BaalLukor.IsEveryoneOfThisKindDead();
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN GetSwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */