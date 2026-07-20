#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MG_Runes_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MG_Runes;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150444"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/rune_inventory"), LocText("TEXT_WIP_DABMKKF_20260223_153253"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150455"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150502"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150510"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150515"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_150521"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150553"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150601"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_150610"));
            }
        }
        
        
        class UDocument_Tut_MG_Runes : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MG_Runes_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_150415";
            default m_SortOrder = 602;
            default Metadata.Add(n"SortOrder", "602");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MG_Runes : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MG_Runes;
        }
    }
}
#endif /* WITH_STORY_G1R */