#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000cd), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_JOINWATERMAGES_LEARNINSCRIPTION);
                DC(int64(0x000000cd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION GetNewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */