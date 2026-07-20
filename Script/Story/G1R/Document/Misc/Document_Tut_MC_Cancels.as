#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Cancels_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Cancels;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_140624"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_140636"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_140648"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_140655"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_140701"));
            }
        }
        
        
        class UDocument_Tut_MC_Cancels : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Cancels_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_140509";
            default m_SortOrder = 407;
            default Metadata.Add(n"SortOrder", "407");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Cancels : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Cancels;
        }
    }
}
#endif /* WITH_STORY_G1R */