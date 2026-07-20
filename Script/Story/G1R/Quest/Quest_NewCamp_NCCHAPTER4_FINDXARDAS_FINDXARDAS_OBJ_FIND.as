#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_FINDXARDAS;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_FINDXARDAS_COMPLETE);
                DC(int64(0x000000d6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND GetNewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */