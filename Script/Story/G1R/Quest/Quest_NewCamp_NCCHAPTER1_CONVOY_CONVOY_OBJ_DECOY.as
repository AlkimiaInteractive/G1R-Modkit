#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_GRD_GUARD31_283N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD32_284N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD33_285N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD34_286N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD35_287N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD36_288N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD37_289N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD38_290N");
            default InvolvedCharacters.Add(n"OC_GRD_GUARD39_291N");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CONVOY;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetGuard31() const property { return GetCharacter(n"OC_GRD_GUARD31_283N"); }
            AGothicCharacterState GetOC_GRD_GUARD32_284N() const property { return GetCharacter(n"OC_GRD_GUARD32_284N"); }
            AGothicCharacterState GetOC_GRD_GUARD33_285N() const property { return GetCharacter(n"OC_GRD_GUARD33_285N"); }
            AGothicCharacterState GetOC_GRD_GUARD34_286N() const property { return GetCharacter(n"OC_GRD_GUARD34_286N"); }
            AGothicCharacterState GetOC_GRD_GUARD35_287N() const property { return GetCharacter(n"OC_GRD_GUARD35_287N"); }
            AGothicCharacterState GetOC_GRD_GUARD36_288N() const property { return GetCharacter(n"OC_GRD_GUARD36_288N"); }
            AGothicCharacterState GetOC_GRD_GUARD37_289N() const property { return GetCharacter(n"OC_GRD_GUARD37_289N"); }
            AGothicCharacterState GetOC_GRD_GUARD38_290N() const property { return GetCharacter(n"OC_GRD_GUARD38_290N"); }
            AGothicCharacterState GetOC_GRD_GUARD39_291N() const property { return GetCharacter(n"OC_GRD_GUARD39_291N"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Guard31 != nullptr && Guard31.IsDefeated() && OC_GRD_GUARD32_284N != nullptr && OC_GRD_GUARD32_284N.IsDefeated() && OC_GRD_GUARD33_285N != nullptr && OC_GRD_GUARD33_285N.IsDefeated() && OC_GRD_GUARD34_286N != nullptr && OC_GRD_GUARD34_286N.IsDefeated() && OC_GRD_GUARD35_287N != nullptr && OC_GRD_GUARD35_287N.IsDefeated() && OC_GRD_GUARD36_288N != nullptr && OC_GRD_GUARD36_288N.IsDefeated() && OC_GRD_GUARD37_289N != nullptr && OC_GRD_GUARD37_289N.IsDefeated() && OC_GRD_GUARD38_290N != nullptr && OC_GRD_GUARD38_290N.IsDefeated() && OC_GRD_GUARD39_291N != nullptr && OC_GRD_GUARD39_291N.IsDefeated() && Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000016), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE.StartQuest();
                DC(int64(0x00000016), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY GetNewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_DECOY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */