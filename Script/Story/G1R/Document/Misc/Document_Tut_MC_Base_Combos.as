#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MC_Base_Combos_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MC_Base_Combos;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122231"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122239"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122247"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122250"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122251"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122522"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122531"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122537"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_122544"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122559"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/combo_visual_cue"), LocText("TEXT_WIP_DABMKKF_20260223_153132"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122611"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122624"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_122632"));
            }
        }
        
        
        class UDocument_Tut_MC_Base_Combos : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MC_Base_Combos_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_122111";
            default m_SortOrder = 6;
            default Metadata.Add(n"SortOrder", "6");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MC_Base_Combos : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MC_Base_Combos;
        }
    }
}
#endif /* WITH_STORY_G1R */