#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_BANNEDFROMOC_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BANNEDFROMOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_BANNEDFROMOC_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH4_BANNEDFROMOC_Lee : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BANNEDFROMOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_165922"));
            }
        }
        
        
        class UDocumentSegment_CH4_BANNEDFROMOC_Test : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BANNEDFROMOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_170229"));
            }
        }
        
        
        class UDocumentSegment_CH4_BANNEDFROMOC_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH4_BANNEDFROMOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_BANNEDFROMOC_ENTRY_12"));
            }
        }
        
        
        class UDocument_CH4_BANNEDFROMOC : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_BANNEDFROMOC : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_BANNEDFROMOC;
        }
    }
}
#endif /* WITH_STORY_G1R */