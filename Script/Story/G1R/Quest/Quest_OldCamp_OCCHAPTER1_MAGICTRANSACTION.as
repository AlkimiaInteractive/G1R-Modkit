#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default InvolvedCharacters.Add(n"OC_KDF_TORREZ_405");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_MAGICTRANSACTION-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MAGICTRANSACTION-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_MAGICTRANSACTION;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_KDF_TORREZ_405";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            AGothicCharacterState GetTorrez() const property { return GetCharacter(n"OC_KDF_TORREZ_405"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage)) || (Torrez != nullptr && Torrez.IsEveryoneOfThisKindDead());
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_MAGICTRANSACTION_COMPLETE);
                DC(int64(0x0000006c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION GetOldCamp_OCCHAPTER1_MAGICTRANSACTION() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MAGICTRANSACTION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */