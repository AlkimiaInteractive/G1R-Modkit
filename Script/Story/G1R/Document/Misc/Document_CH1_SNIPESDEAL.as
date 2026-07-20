#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_SNIPESDEAL_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_Lure : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_Mad : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_KeyOffered : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_KeyBought : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_SellKey : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_SNIPESDEAL_KeySold : UDocumentSegment
        {
            default InDocument = UDocument_CH1_SNIPESDEAL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_SNIPESDEAL_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH1_SNIPESDEAL : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_SNIPESDEAL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_SNIPESDEAL;
        }
    }
}
#endif /* WITH_STORY_G1R */