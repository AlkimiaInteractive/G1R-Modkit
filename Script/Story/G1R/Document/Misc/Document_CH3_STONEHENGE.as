#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_STONEHENGE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_STONEHENGE_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_STONEHENGE_DoorClosed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_STONEHENGE_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH3_STONEHENGE_DoorOpened : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TXFLHFD_20250618_115330"));
            }
        }
        
        
        class UDocumentSegment_CH3_STONEHENGE_Guardian : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_STONEHENGE_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_STONEHENGE_Focus : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_STONEHENGE_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH3_STONEHENGE_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_STONEHENGE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_STONEHENGE_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH3_STONEHENGE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_STONEHENGE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_STONEHENGE;
        }
    }
}
#endif /* WITH_STORY_G1R */