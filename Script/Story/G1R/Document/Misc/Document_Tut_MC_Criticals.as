#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Criticals_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Criticals;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_121844"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121858"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121904"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_121909"));
            }
        }
        
        
        class UDocument_Tut_MC_Criticals : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Criticals_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_121824";
            default m_SortOrder = 404;
            default Metadata.Add(n"SortOrder", "404");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Criticals : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Criticals;
        }
    }
}
#endif /* WITH_STORY_G1R */