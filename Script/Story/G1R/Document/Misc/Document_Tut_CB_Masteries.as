#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CB_Masteries_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CB_Masteries;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_115104"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115113"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115121"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115234"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144618"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115129"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115150"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115340"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_115401"));
            }
        }
        
        
        class UDocument_Tut_CB_Masteries : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CB_Masteries_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_115042";
            default m_SortOrder = 302;
            default Metadata.Add(n"SortOrder", "302");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CB_Masteries : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CB_Masteries;
        }
    }
}
#endif /* WITH_STORY_G1R */