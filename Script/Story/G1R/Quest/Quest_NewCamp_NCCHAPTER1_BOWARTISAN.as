#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_BOWARTISAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_SLD_HAENNO_741");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_BOWARTISAN-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_BOWARTISAN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_BOWARTISAN;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_SLD_HAENNO_741";
            
            AGothicCharacterState GetHaenno() const property { return GetCharacter(n"NC_SLD_HAENNO_741"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Haenno != nullptr && Haenno.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000003d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BOWARTISAN_COMPLETE);
                DC(int64(0x0000003d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_BOWARTISAN GetNewCamp_NCCHAPTER1_BOWARTISAN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_BOWARTISAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_BOWARTISAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */