#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_THECHAMPIONBURIAL;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_AfterBurial);
            }
        }
        
        
        UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN GetORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN() property
        {
            return Cast<UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */