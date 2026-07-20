#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_RC_Base_Draw_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_RC_Base_Draw;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_144203"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_144213"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144220"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144227"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144233"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144309"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_144323"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144353"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144356"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144403"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_144410"));
            }
        }
        
        
        class UDocument_Tut_RC_Base_Draw : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_RC_Base_Draw_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_144018";
            default m_SortOrder = 9;
            default Metadata.Add(n"SortOrder", "9");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_RC_Base_Draw : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_RC_Base_Draw;
        }
    }
}
#endif /* WITH_STORY_G1R */