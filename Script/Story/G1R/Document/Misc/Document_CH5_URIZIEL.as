#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_URIZIEL_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH5_URIZIEL_ENTRY_0"));
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_125634"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_Milten : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH5_URIZIEL_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_MiltenAgreed : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_133529"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_Gorn : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_132839"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_GornAgreed : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_133553"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_Charged : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH5_URIZIEL_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_RuneOffer : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH5_URIZIEL_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH5_URIZIEL_Rune : UDocumentSegment
        {
            default InDocument = UDocument_CH5_URIZIEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH5_URIZIEL_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH5_URIZIEL : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_URIZIEL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_URIZIEL;
        }
    }
}
#endif /* WITH_STORY_G1R */