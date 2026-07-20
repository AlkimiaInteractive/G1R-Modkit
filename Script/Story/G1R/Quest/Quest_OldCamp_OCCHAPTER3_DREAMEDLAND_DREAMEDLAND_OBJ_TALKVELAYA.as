#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ec), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_DREAMEDLAND_TALKVELAYA);
                DC(int64(0x000000ec), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA GetOldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */