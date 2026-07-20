#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_STORAGESHED_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_STORAGESHED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_STORAGESHED_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_STORAGESHED_GetKey : UDocumentSegment
        {
            default InDocument = UDocument_CH1_STORAGESHED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_STORAGESHED_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_STORAGESHED_Key : UDocumentSegment
        {
            default InDocument = UDocument_CH1_STORAGESHED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_111126"));
            }
        }
        
        
        class UDocumentSegment_CH1_STORAGESHED_Lure : UDocumentSegment
        {
            default InDocument = UDocument_CH1_STORAGESHED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_STORAGESHED_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_STORAGESHED_Mad : UDocumentSegment
        {
            default InDocument = UDocument_CH1_STORAGESHED;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_STORAGESHED_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH1_STORAGESHED : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_STORAGESHED : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_STORAGESHED;
        }
    }
}
#endif /* WITH_STORY_G1R */