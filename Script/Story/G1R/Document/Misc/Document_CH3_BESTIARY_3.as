#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_BESTIARY_3_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BESTIARY_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_173129"));
            }
        }
        
        
        class UDocumentSegment_CH3_BESTIARY_3_AnotherBook : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BESTIARY_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_173218"));
            }
        }
        
        
        class UDocumentSegment_CH3_BESTIARY_3_Collect : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BESTIARY_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_180517"));
            }
        }
        
        
        class UDocumentSegment_CH3_BESTIARY_3_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BESTIARY_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MQZIHIK_20250725_182513"));
            }
        }
        
        
        class UDocument_CH3_BESTIARY_3 : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_BESTIARY_3 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_BESTIARY_3;
        }
    }
}
#endif /* WITH_STORY_G1R */