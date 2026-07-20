#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_ORG_WOLF_855");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER4_MCPLATEARMOR-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_MCPLATEARMOR-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_MCPLATEARMOR;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_ORG_WOLF_855";
            
            AGothicCharacterState GetWolf() const property { return GetCharacter(n"NC_ORG_WOLF_855"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Wolf != nullptr && Wolf.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ee), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_MCPLATEARMOR_COMPLETE);
                DC(int64(0x000000ee), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR GetNewCamp_NCCHAPTER4_MCPLATEARMOR() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */