#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_RANKUPGUARD_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPGUARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_153636"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPGUARD_Recruit : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPGUARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_154139"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPGUARD_Raid : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPGUARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_154232"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPGUARD_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPGUARD;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_154405"));
            }
        }
        
        
        class UDocument_CH3_RANKUPGUARD : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_RANKUPGUARD : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_RANKUPGUARD;
        }
    }
}
#endif /* WITH_STORY_G1R */