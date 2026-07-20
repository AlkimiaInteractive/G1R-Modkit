#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_RC_Accuracy_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_RC_Accuracy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145012"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145019"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145025"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145031"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145038"));
            }
        }
        
        
        class UDocument_Tut_RC_Accuracy : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_RC_Accuracy_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_144953";
            default m_SortOrder = 502;
            default Metadata.Add(n"SortOrder", "502");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_RC_Accuracy : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_RC_Accuracy;
        }
    }
}
#endif /* WITH_STORY_G1R */