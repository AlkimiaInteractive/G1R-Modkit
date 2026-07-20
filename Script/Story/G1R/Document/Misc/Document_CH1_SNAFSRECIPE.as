#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_SNAFSRECIPE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNAFSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SNAFSRECIPE_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNAFSRECIPE_MeatbugsLocation : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNAFSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SNAFSRECIPE_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNAFSRECIPE_MushroomsLocation : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNAFSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SNAFSRECIPE_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNAFSRECIPE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNAFSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SNAFSRECIPE_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNAFSRECIPE_DailyRagout : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNAFSRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_SNAFSRECIPE_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH1_SNAFSRECIPE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_SNAFSRECIPE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_SNAFSRECIPE;
        }
    }
}
#endif /* WITH_STORY_G1R */