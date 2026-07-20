#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_DAMLURKER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DAMLURKER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DAMLURKER_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_DAMLURKER_Info1 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DAMLURKER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DAMLURKER_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_DAMLURKER_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DAMLURKER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DAMLURKER_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH1_DAMLURKER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_DAMLURKER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_DAMLURKER;
        }
    }
}
#endif /* WITH_STORY_G1R */