#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_FINDORCSHAMAN_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDORCSHAMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDORCSHAMAN_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDORCSHAMAN_UrshakFound : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDORCSHAMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDORCSHAMAN_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH4_FINDORCSHAMAN : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_FINDORCSHAMAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_FINDORCSHAMAN;
        }
    }
}
#endif /* WITH_STORY_G1R */