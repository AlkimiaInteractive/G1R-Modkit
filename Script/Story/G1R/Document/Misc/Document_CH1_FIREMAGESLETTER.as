#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_FIREMAGESLETTER_ContactHighMagician : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RJGMTPL_20250520_142958"));
                AddParagraph(LocText("TEXT_WIP_RJGMTPL_20250520_144152"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_DiegoAdvice : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RJGMTPL_20250520_145143"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_Torrez : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RJGMTPL_20250520_145313"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_TorrezNo : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LOYHWBI_20260518_134141"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_DeliveredMilten : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPWCOUK_20250710_134859"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_DeliverToTorrez : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPWCOUK_20250710_141025"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_TorrezReward : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPWCOUK_20250710_142240"));
            }
        }
        
        
        class UDocumentSegment_CH1_FIREMAGESLETTER_DeliveredTorrez : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FIREMAGESLETTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPWCOUK_20250710_135338"));
            }
        }
        
        
        class UDocument_CH1_FIREMAGESLETTER : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_FIREMAGESLETTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_FIREMAGESLETTER;
        }
    }
}
#endif /* WITH_STORY_G1R */