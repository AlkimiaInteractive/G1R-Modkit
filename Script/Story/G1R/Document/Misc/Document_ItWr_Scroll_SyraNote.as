#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_SyraNote_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_SyraNote;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_NRHKDTK_20250722_114620"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.StartQuest();
                Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND.StartQuest();
            }
        }
        
        
        class UDocument_ItWr_Scroll_SyraNote : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_SyraNote_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_SyraNote : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_SyraNote;
        }
    }
}
#endif /* WITH_STORY_G1R */