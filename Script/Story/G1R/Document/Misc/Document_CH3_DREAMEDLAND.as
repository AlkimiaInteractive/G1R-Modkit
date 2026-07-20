#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_DREAMEDLAND_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_145213"));
            }
        }
        
        
        class UDocumentSegment_CH3_DREAMEDLAND_Seraphia : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_145312"));
            }
        }
        
        
        class UDocumentSegment_CH3_DREAMEDLAND_Velaya : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_145327"));
            }
        }
        
        
        class UDocumentSegment_CH3_DREAMEDLAND_Complete : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FPWCOUK_20250717_145332"));
            }
        }
        
        
        class UDocumentSegment_CH3_DREAMEDLAND_AccessNC : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKGDPMB_20251015_152705"));
            }
        }
        
        
        class UDocumentSegment_CH3_DREAMEDLAND_AccessSC : UDocumentSegment
        {
            default InDocument = UDocument_CH3_DREAMEDLAND;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKGDPMB_20251015_152907"));
            }
        }
        
        
        class UDocument_CH3_DREAMEDLAND : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_DREAMEDLAND : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_DREAMEDLAND;
        }
    }
}
#endif /* WITH_STORY_G1R */