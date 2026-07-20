#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_BESTIARY_1_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BESTIARY_1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_125221"));
            }
        }
        
        
        class UDocumentSegment_CH1_BESTIARY_1_AnotherBook : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BESTIARY_1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_152001"));
            }
        }
        
        
        class UDocumentSegment_CH1_BESTIARY_1_Cavalorn : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BESTIARY_1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_130632"));
            }
        }
        
        
        class UDocumentSegment_CH1_BESTIARY_1_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BESTIARY_1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_131635"));
            }
        }
        
        
        class UDocument_CH1_BESTIARY_1 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_BESTIARY_1 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_BESTIARY_1;
        }
    }
}
#endif /* WITH_STORY_G1R */