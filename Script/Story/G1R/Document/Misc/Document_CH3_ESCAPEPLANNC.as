#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_ESCAPEPLANNC_Gorn : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ESCAPEPLANNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_143606"));
            }
        }
        
        
        class UDocumentSegment_CH3_ESCAPEPLANNC_Lester : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ESCAPEPLANNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_184429"));
            }
        }
        
        
        class UDocumentSegment_CH3_ESCAPEPLANNC_Diego : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ESCAPEPLANNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_184449"));
            }
        }
        
        
        class UDocumentSegment_CH3_ESCAPEPLANNC_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_ESCAPEPLANNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_143606_675"));
            }
        }
        
        
        class UDocument_CH3_ESCAPEPLANNC : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_ESCAPEPLANNC : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_ESCAPEPLANNC;
        }
    }
}
#endif /* WITH_STORY_G1R */