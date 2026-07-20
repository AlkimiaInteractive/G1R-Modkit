#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_BESTIARY_2_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_133128"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_AnotherBook : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_153648"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_Collect : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_160426"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_FindBuyer : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_160038"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_SoldToRiordian : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_160329"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_SoldToDamarok : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_160357"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_SoldToKalom : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_160407"));
            }
        }
        
        
        class UDocumentSegment_CH2_BESTIARY_2_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BESTIARY_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EJWCSU_20260522_132342"));
            }
        }
        
        
        class UDocument_CH2_BESTIARY_2 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_BESTIARY_2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_BESTIARY_2;
        }
    }
}
#endif /* WITH_STORY_G1R */