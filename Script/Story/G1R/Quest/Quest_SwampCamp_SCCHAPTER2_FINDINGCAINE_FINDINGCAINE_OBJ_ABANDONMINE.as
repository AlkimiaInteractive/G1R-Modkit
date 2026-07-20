#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItKe_AbandonedMine_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FINDINGCAINE_ABANDONMINE);
                DC(int64(0x0000006c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE GetSwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */