#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Strength_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Strength;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121700"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121712"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121726"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121736"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121747"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121757"));
            }
        }
        
        
        class UDocument_Tut_MC_Strength : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Strength_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_121642";
            default m_SortOrder = 406;
            default Metadata.Add(n"SortOrder", "406");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Strength : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Strength;
        }
    }
}
#endif /* WITH_STORY_G1R */