#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OM_STT_SANTINO_335");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_MERCHANTSPRICE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MERCHANTSPRICE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_MERCHANTSPRICE;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OM_STT_SANTINO_335";
            
            AGothicCharacterState GetSantino() const property { return GetCharacter(n"OM_STT_SANTINO_335"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Santino != nullptr && Santino.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000009c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_MERCHANTSPRICE_COMPLETE);
                DC(int64(0x0000009c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE GetOldCamp_OCCHAPTER1_MERCHANTSPRICE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MERCHANTSPRICE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */