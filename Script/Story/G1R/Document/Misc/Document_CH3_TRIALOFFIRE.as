#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_TRIALOFFIRE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TRIALOFFIRE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_091842"));
            }
        }
        
        
        class UDocumentSegment_CH3_TRIALOFFIRE_Sea : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TRIALOFFIRE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_105958"));
            }
        }
        
        
        class UDocumentSegment_CH3_TRIALOFFIRE_Waterfall : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TRIALOFFIRE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_110041"));
            }
        }
        
        
        class UDocumentSegment_CH3_TRIALOFFIRE_ReportCorristo : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TRIALOFFIRE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_110140"));
            }
        }
        
        
        class UDocumentSegment_CH3_TRIALOFFIRE_ReportMilten : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TRIALOFFIRE;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_CORRISTO_402");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_KDF_CORRISTO_402") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_CORRISTO_402").IsEveryoneOfThisKindDead() && G1R::UStoryG1R::Get() != nullptr && G1R::UStoryG1R::Get().HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_110155"));
            }
        }
        
        
        class UDocument_CH3_TRIALOFFIRE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_TRIALOFFIRE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_TRIALOFFIRE;
        }
    }
}
#endif /* WITH_STORY_G1R */