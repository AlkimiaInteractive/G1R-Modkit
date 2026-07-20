#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_WeaponDesign_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_WeaponDesign;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_133651"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/ItWr_Scroll_WeaponDesign"), LocText("TEXT_WIP_CGPNVSI_20260317_121512"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_133836"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_WeaponDesign : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_WeaponDesign_Initial);
            default Title = "TEXT_WIP_SRFQVSM_20250506_110147";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_WeaponDesign : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_WeaponDesign;
        }
    }
}
#endif /* WITH_STORY_G1R */