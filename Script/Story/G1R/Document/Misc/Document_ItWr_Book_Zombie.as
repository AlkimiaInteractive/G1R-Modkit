#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Zombie_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Zombie;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_RQSBFK_20251107_174532"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_174546"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_175115"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Walking_Dead"), LocText("TEXT_WIP_HGPNVSI_20260312_141403"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                Quest::CreaturesGlossary_ZombieGlossary_ZombieEntry2.SucceedQuest();
            }
        }
        
        
        class UDocument_ItWr_Book_Zombie : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Zombie_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Zombie : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Zombie;
        }
    }
}
#endif /* WITH_STORY_G1R */