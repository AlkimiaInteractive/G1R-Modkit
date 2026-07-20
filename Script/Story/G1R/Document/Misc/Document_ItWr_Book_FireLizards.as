#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_FireLizards_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_FireLizards;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_RQSBFK_20251107_144704"));
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_144713"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_FireLizard_01_Full"), LocText("TEXT_WIP_OQHNQN_20260120_191252"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_RQSBFK_20251107_144715"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                AGothicCharacterState::FindByUniqueName(n"Hero").LearnSkill(UGE_Skill_Hunting_Fins_Trained);
            }
        }
        
        
        class UDocument_ItWr_Book_FireLizards : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_FireLizards_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_FireLizards : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_FireLizards;
        }
    }
}
#endif /* WITH_STORY_G1R */