#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_TR_Stocks_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_TR_Stocks;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162016"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162023"));
                AddEnumeratedListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_162040"));
                AddEnumeratedListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_162050"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162030"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162116"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162124"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162133"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_162146"));
            }
        }
        
        
        class UDocument_Tut_TR_Stocks : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_TR_Stocks_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_161817";
            default m_SortOrder = 1003;
            default Metadata.Add(n"SortOrder", "1003");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_TR_Stocks : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_TR_Stocks;
        }
    }
}
#endif /* WITH_STORY_G1R */