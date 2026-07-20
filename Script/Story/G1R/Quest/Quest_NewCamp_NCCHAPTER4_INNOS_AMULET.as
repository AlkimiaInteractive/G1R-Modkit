#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET : UG1RQuest
        {
            default InvolvedCharacters.Add(n"NC_KDW_NEFARIUS_603");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER4_INNOS_AMULET-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_INNOS_AMULET-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_INNOSAMULET;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_KDW_NEFARIUS_603";
            
            AGothicCharacterState GetNefarius() const property { return GetCharacter(n"NC_KDW_NEFARIUS_603"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Nefarius != nullptr && Nefarius.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f9), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_INNOSAMULET_COMPLETE);
                DC(int64(0x000000f9), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET GetNewCamp_NCCHAPTER4_INNOS_AMULET() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */