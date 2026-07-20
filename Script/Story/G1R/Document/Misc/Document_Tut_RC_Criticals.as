#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_RC_Criticals_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_RC_Criticals;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141804"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_141818"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_141824"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_141829"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_141838"));
            }
        }
        
        
        class UDocument_Tut_RC_Criticals : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_RC_Criticals_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_141741";
            default m_SortOrder = 503;
            default Metadata.Add(n"SortOrder", "503");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_RC_Criticals : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_RC_Criticals;
        }
    }
}
#endif /* WITH_STORY_G1R */