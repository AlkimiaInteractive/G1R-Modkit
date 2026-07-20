#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CF_Learning_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CF_Learning;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163452"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_163648"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_163655"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_163702"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_163709"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163727"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163720"));
            }
        }
        
        
        class UDocument_Tut_CF_Learning : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CF_Learning_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_163046";
            default m_SortOrder = 702;
            default Metadata.Add(n"SortOrder", "702");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CF_Learning : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CF_Learning;
        }
    }
}
#endif /* WITH_STORY_G1R */