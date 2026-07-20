#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_STORAGESHED : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDMINE_OMCHAPTER2_STORAGESHED-DESCRIPTION";
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_STORAGESHED-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_STORAGESHED;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000018), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OM_STORAGESHED_COMPLETE);
                DC(int64(0x00000018), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_STORAGESHED GetOldMine_OMCHAPTER2_STORAGESHED() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_STORAGESHED>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_STORAGESHED::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */