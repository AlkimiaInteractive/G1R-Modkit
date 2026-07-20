#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MG_Channeling_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MG_Channeling;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151736"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151756"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151758"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151806"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151815"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_151830"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_151838"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_151855"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_151902"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_151909"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/fireball_reticle"), LocText("TEXT_WIP_DABMKKF_20260223_153359"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151920"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151929"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/telekinesis_reticle"), LocText("TEXT_WIP_DABMKKF_20260223_153411"));
            }
        }
        
        
        class UDocument_Tut_MG_Channeling : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MG_Channeling_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_151055";
            default m_SortOrder = 603;
            default Metadata.Add(n"SortOrder", "603");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MG_Channeling : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MG_Channeling;
        }
    }
}
#endif /* WITH_STORY_G1R */