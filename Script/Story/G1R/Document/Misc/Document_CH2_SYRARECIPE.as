#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_SYRARECIPE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_113153"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_SyraDenied : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_115444"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_SyraReward : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_121555"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_Steal : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_121601"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_GetRecipe : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_121822"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_Ingredients : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_123215"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_Wait : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_124301"));
            }
        }
        
        
        class UDocumentSegment_CH2_SYRARECIPE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_SYRARECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YPDUCLK_20250709_124543"));
            }
        }
        
        
        class UDocument_CH2_SYRARECIPE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_SYRARECIPE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_SYRARECIPE;
        }
    }
}
#endif /* WITH_STORY_G1R */