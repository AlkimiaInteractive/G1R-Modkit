#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000098), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BRINGFOCI_YBERION);
                DC(int64(0x00000098), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS GetNewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */