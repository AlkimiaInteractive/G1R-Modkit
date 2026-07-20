#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Base_Dodge_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Base_Dodge;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_123824"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123832"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123837"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123843"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_123849"));
            }
        }
        
        
        class UDocument_Tut_MC_Base_Dodge : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Base_Dodge_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_123806";
            default m_SortOrder = 7;
            default Metadata.Add(n"SortOrder", "7");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Base_Dodge : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Base_Dodge;
        }
    }
}
#endif /* WITH_STORY_G1R */