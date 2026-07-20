#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MG_Base_Scrolls_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MG_Base_Scrolls;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145920"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/scroll_inventory"), LocText("TEXT_WIP_DABMKKF_20260223_153228"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145923"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145930"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145936"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145945"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145952"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150021"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150158"));
            }
        }
        
        
        class UDocument_Tut_MG_Base_Scrolls : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MG_Base_Scrolls_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_145806";
            default m_SortOrder = 10;
            default Metadata.Add(n"SortOrder", "10");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MG_Base_Scrolls : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MG_Base_Scrolls;
        }
    }
}
#endif /* WITH_STORY_G1R */