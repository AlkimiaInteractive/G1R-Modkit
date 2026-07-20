#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000057), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_JORUJOINTS_COMPLETE);
                DC(int64(0x00000057), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS GetSwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */