#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_TR_Region_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_TR_Region;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_155058"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_155105"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_155114"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_161215"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161336"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161340"));
            }
        }
        
        
        class UDocument_Tut_TR_Region : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_TR_Region_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_155043";
            default m_SortOrder = 1002;
            default Metadata.Add(n"SortOrder", "1002");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_TR_Region : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_TR_Region;
        }
    }
}
#endif /* WITH_STORY_G1R */