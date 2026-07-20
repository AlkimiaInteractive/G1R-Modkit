#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST : UG1RQuest
        {
            default InvolvedCharacters.Add(n"BC_BAN_BRANNOK_863");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_BanditsCamp;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-BANDITSCAMP_BANDITSTRUST-DESCRIPTION";
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_BANDITSTRUST;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"BC_BAN_BRANNOK_863";
            
            AGothicCharacterState GetBrannok() const property { return GetCharacter(n"BC_BAN_BRANNOK_863"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Brannok != nullptr && Brannok.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000006), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSTRUST_COMPLETE);
                DC(int64(0x00000006), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST GetBanditsCamp_BANDITSTRUST() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */