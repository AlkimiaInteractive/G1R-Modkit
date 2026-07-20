#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_DELIVERWEED_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_BalorHarvest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_BalorExtraInfo : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_Cipher : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_7"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_ViranQuest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_ViranHarvest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_WholeHarvest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_DELIVERWEED_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_DELIVERWEED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_DELIVERWEED_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH1_DELIVERWEED : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_DELIVERWEED : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_DELIVERWEED;
        }
    }
}
#endif /* WITH_STORY_G1R */