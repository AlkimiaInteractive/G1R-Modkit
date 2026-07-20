#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_144835"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_FindStone : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_155917"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_AskDarrion : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_111244"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_GetGomezKey : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_112550"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionRejected : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_113212"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionHelp : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_114919"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_OpenGate : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_115033"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_GomezKey : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_115210"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_Escort : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_115343"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_FreeSC : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_115438"));
            }
        }
        
        
        class UDocumentSegment_CH5_FORGEDRIVALRIES_3_FreeNC : UDocumentSegment
        {
            default InDocument = UDocument_CH5_FORGEDRIVALRIES_3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_115838"));
            }
        }
        
        
        class UDocument_CH5_FORGEDRIVALRIES_3 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_FORGEDRIVALRIES_3 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_FORGEDRIVALRIES_3;
        }
    }
}
#endif /* WITH_STORY_G1R */