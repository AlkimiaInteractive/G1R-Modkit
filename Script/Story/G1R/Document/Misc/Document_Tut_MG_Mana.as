#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MG_Mana_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MG_Mana;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150742"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150747"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/mana_bar"), LocText("TEXT_WIP_DABMKKF_20260223_153313"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150755"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150900"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150909"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150921"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150927"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150944"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150959"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151007"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_151016"));
            }
        }
        
        
        class UDocument_Tut_MG_Mana : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MG_Mana_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_150710";
            default m_SortOrder = 601;
            default Metadata.Add(n"SortOrder", "601");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MG_Mana : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MG_Mana;
        }
    }
}
#endif /* WITH_STORY_G1R */