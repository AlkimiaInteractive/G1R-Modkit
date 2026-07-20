#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_PP_Dexterity_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_PP_Dexterity;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173328"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/pickpocketing_difficulty_indicator"), LocText("TEXT_WIP_DABMKKF_20260223_154811"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173335"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173347"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173354"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173401"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173418"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173428"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173439"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_173447"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/pickpocketing_difficulty_colors"), LocText("TEXT_WIP_DABMKKF_20260223_154822"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_173459"));
            }
        }
        
        
        class UDocument_Tut_PP_Dexterity : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_PP_Dexterity_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_173312";
            default m_SortOrder = 1102;
            default Metadata.Add(n"SortOrder", "1102");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_PP_Dexterity : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_PP_Dexterity;
        }
    }
}
#endif /* WITH_STORY_G1R */