#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_SLDTOKDW_Entry0 : UDocumentSegment
        {
            default InDocument = UDocument_CH4_SLDTOKDW;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_SLDTOKDW_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH4_SLDTOKDW : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_SLDTOKDW : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_SLDTOKDW;
        }
    }
}
#endif /* WITH_STORY_G1R */