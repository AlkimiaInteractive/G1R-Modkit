#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LURKER_BITE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_VLK_HUNO_538");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_LURKER_BITE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LURKER_BITE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_LURKERBITE;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_VLK_HUNO_538";
            
            AGothicCharacterState GetHuno() const property { return GetCharacter(n"OC_VLK_HUNO_538"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Huno != nullptr && Huno.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000003b), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_LURKERBITE_COMPLETE);
                DC(int64(0x0000003b), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LURKER_BITE GetOldCamp_OCCHAPTER1_LURKER_BITE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LURKER_BITE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LURKER_BITE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */