#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_GOTOPSI_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNMDQD_20250612_105008"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSI_CaineDead : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSI;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Orc, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNMDQD_20250612_105013"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSI_AfterReport : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YXFLHFD_20250613_165132"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSI_AfterInvocation : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNMDQD_20250612_105022"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSI_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YXFLHFD_20250613_170115"));
            }
        }
        
        
        class UDocument_CH2_GOTOPSI : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_GOTOPSI : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_GOTOPSI;
        }
    }
}
#endif /* WITH_STORY_G1R */