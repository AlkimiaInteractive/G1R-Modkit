#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Finishers_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Finishers;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122724"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122728"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122733"));
            }
        }
        
        
        class UDocument_Tut_MC_Finishers : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Finishers_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_122706";
            default m_SortOrder = 403;
            default Metadata.Add(n"SortOrder", "403");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Finishers : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Finishers;
        }
    }
}
#endif /* WITH_STORY_G1R */