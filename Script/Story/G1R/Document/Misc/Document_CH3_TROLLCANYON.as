#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_TROLLCANYON_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TROLLCANYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_TROLLCANYON_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_TROLLCANYON_Cave : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TROLLCANYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_TROLLCANYON_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_TROLLCANYON_TrollDefeated : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TROLLCANYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_TROLLCANYON_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH3_TROLLCANYON_Focus : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TROLLCANYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_TROLLCANYON_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH3_TROLLCANYON_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_TROLLCANYON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_TROLLCANYON_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH3_TROLLCANYON : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_TROLLCANYON : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_TROLLCANYON;
        }
    }
}
#endif /* WITH_STORY_G1R */