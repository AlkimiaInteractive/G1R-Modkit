#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CONVOY;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_CONVOY_GORN);
                DC(int64(0x0000001e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN GetNewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_GORN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */