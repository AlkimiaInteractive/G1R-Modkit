#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_JOINNC_OCFail : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINNC_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_SCFail : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINNC_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_Success : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINNC_ENTRY_8"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_MordragStart : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINNC_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_MordragRing : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_JOINNC_ENTRY_10"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_MordragPass : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_123426"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_RicelordEntry : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_123609"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_NoPoints : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_123911"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_HelpRicelord : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_124154"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_Skills : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_124410"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_Rest : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_124627"));
            }
        }
        
        
        class UDocumentSegment_CH1_JOINNC_ListMissing : UDocumentSegment
        {
            default InDocument = UDocument_CH1_JOINNC;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKGDPMB_20251015_165455"));
            }
        }
        
        
        class UDocument_CH1_JOINNC : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_JOINNC : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_JOINNC;
        }
    }
}
#endif /* WITH_STORY_G1R */