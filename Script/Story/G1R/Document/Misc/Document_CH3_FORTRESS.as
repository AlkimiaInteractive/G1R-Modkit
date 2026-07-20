#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_FORTRESS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FORTRESS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_Pedestal : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FORTRESS_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_DoorClosed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FORTRESS_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_DoorOpened : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IZNMDQD_20250617_163105"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_Deed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IZNMDQD_20250617_164802"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_Lester : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FORTRESS_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORTRESS_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORTRESS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FORTRESS_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH3_FORTRESS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_FORTRESS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_FORTRESS;
        }
    }
}
#endif /* WITH_STORY_G1R */