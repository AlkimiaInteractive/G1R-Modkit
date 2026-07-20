#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_DAMLURKER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_BAU_HOMER_935");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_DAMLURKER-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_DAMLURKER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_DAMLURKER;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_BAU_HOMER_935";
            
            AGothicCharacterState GetHomer() const property { return GetCharacter(n"NC_BAU_HOMER_935"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Homer != nullptr && Homer.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000032), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_DAMLURKER_COMPLETE);
                DC(int64(0x00000032), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_DAMLURKER GetNewCamp_NCCHAPTER1_DAMLURKER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_DAMLURKER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_DAMLURKER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */