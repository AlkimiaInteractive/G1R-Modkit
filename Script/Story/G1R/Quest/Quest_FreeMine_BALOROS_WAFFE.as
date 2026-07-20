#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_FreeMine_BALOROS_WAFFE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"FM_SLD_BALORO_753");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_FreeMine;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-FREEMINE_BALOROS_WAFFE-DESCRIPTION";
            default NameText = "QUEST-FREEMINE_BALOROS_WAFFE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_BALOROS_WAFFE;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"FM_SLD_BALORO_753";
            
            AGothicCharacterState GetBaloro() const property { return GetCharacter(n"FM_SLD_BALORO_753"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Baloro != nullptr && Baloro.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000004), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_FM_BALOROSWAFFE_COMPLETE);
                DC(int64(0x00000004), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_FreeMine_BALOROS_WAFFE GetFreeMine_BALOROS_WAFFE() property
        {
            return Cast<UQuest_FreeMine_BALOROS_WAFFE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_FreeMine_BALOROS_WAFFE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */