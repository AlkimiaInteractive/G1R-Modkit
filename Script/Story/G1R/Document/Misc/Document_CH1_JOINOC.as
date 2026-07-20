#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_JOINOC_VisitThorus : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_VisitDiego : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_BrowniePoints : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_10"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_TestCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_11"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_FailNC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_8"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_Shadow : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINOC_FailSC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINOC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINOC_ENTRY_7"));
            }
        }
        
        
        class UDocument_CH1_JOINOC : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_JOINOC : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_JOINOC;
        }
    }
}
#endif /* WITH_STORY_G1R */