#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDMINE_OMCHAPTER2_IAN_GEARWHEEL-DESCRIPTION";
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_IAN_GEARWHEEL-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_IAN_GEARWHEEL;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"OM_STT_IAN_301";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000003), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OM_GEARWHEEL_COMPLETE);
                DC(int64(0x00000003), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL GetOldMine_OMCHAPTER2_IAN_GEARWHEEL() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_IAN_GEARWHEEL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */