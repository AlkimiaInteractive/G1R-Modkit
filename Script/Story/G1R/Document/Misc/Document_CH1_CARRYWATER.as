#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_CARRYWATER_WaterGiven : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_TurnedDown : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_AskWater : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_LeftyAgain : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_LeftyMad : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_Restart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_CARRYWATER_LeftyDefeated : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CARRYWATER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_CARRYWATER_ENTRY_7"));
            }
        }
        
        
        class UDocument_CH1_CARRYWATER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_CARRYWATER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_CARRYWATER;
        }
    }
}
#endif /* WITH_STORY_G1R */