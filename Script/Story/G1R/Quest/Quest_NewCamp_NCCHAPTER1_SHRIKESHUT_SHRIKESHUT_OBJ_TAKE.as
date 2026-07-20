#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000067), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_SHRIKESHUT_COMPLETE);
                DC(int64(0x00000067), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE GetNewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */