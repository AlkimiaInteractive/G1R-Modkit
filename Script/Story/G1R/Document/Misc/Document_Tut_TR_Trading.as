#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_TR_Trading_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_TR_Trading;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_152253"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_152407"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/trade_ui"), LocText("TEXT_WIP_DABMKKF_20260223_153509"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_152503"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_152510"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154209"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154243"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_154253"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/trade_value_calculation"), LocText("TEXT_WIP_DABMKKF_20260223_153526"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_154311"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154409"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154417"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154426"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_154436"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_154449"));
            }
        }
        
        
        class UDocument_Tut_TR_Trading : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_TR_Trading_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_152239";
            default m_SortOrder = 1001;
            default Metadata.Add(n"SortOrder", "1001");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_TR_Trading : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_TR_Trading;
        }
    }
}
#endif /* WITH_STORY_G1R */