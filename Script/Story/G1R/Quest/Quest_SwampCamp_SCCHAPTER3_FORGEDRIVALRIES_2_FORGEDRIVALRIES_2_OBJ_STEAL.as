#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Scroll_WeaponDesign, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ef), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVEDESIGNTOSTONE.StartQuest();
                DC(int64(0x000000ef), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_DesignFound);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_STEAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */