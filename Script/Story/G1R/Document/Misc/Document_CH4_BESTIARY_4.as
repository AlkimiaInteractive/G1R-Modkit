#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_BESTIARY_4_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BESTIARY_4;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_095649"));
            }
        }
        
        
        class UDocumentSegment_CH4_BESTIARY_4_AnotherBook : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BESTIARY_4;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_100026"));
            }
        }
        
        
        class UDocumentSegment_CH4_BESTIARY_4_Collect : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BESTIARY_4;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_100157"));
            }
        }
        
        
        class UDocumentSegment_CH4_BESTIARY_4_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BESTIARY_4;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_101407"));
            }
        }
        
        
        class UDocument_CH4_BESTIARY_4 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_BESTIARY_4 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_BESTIARY_4;
        }
    }
}
#endif /* WITH_STORY_G1R */