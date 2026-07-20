#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e5), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BANNEDFROMOC_ASKLEE);
                DC(int64(0x000000e5), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE GetNewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */