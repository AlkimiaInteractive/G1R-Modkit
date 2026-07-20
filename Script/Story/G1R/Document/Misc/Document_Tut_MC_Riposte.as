#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Riposte_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Riposte;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123215"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123221"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123226"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123232"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123240"));
            }
        }
        
        
        class UDocument_Tut_MC_Riposte : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Riposte_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_123155";
            default m_SortOrder = 408;
            default Metadata.Add(n"SortOrder", "408");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Riposte : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Riposte;
        }
    }
}
#endif /* WITH_STORY_G1R */