#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_TR_Liquidity_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_TR_Liquidity;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161515"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/merchant_ore_display"), LocText("TEXT_WIP_DABMKKF_20260223_153548"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161524"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161533"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161542"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_161555"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_161627"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_161636"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_161643"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_161650"));
            }
        }
        
        
        class UDocument_Tut_TR_Liquidity : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_TR_Liquidity_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_161506";
            default m_SortOrder = 1004;
            default Metadata.Add(n"SortOrder", "1004");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_TR_Liquidity : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_TR_Liquidity;
        }
    }
}
#endif /* WITH_STORY_G1R */