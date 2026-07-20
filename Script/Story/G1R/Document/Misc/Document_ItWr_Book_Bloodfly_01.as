#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Bloodfly_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Bloodfly_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bloodfly_01_Full"), LocText("TEXT_WIP_OQHNQN_20260120_191112"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Bloodfly_01-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Bloodfly_01-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Bloodfly_01-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Bloodfly_01-Text_3"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Bloodfly_01_Mid"), LocText("TEXT_WIP_OQHNQN_20260120_191137"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                AGothicCharacterState::FindByUniqueName(n"Hero").LearnSkill(UGE_Skill_Hunting_Stings_Trained);
            }
        }
        
        
        class UDocument_ItWr_Book_Bloodfly_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Bloodfly_01_Initial);
            default Title = "Document-ItWr_Book_Bloodfly_01-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Bloodfly_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Bloodfly_01;
        }
    }
}
#endif /* WITH_STORY_G1R */