#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ca), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_JOINWATERMAGES_LEARNALCHEMY);
                DC(int64(0x000000ca), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY GetNewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */