#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ee), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_DREAMEDLAND_TALKSERAPHIA);
                DC(int64(0x000000ee), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA GetOldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKSERAPHIA::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */