#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_BANDITSTRUST_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161032"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Found : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161440"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Forgive : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161507"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Coerce : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161705"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Left : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161733"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Key : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161801"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Out : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_161844"));
            }
        }
        
        
        class UDocumentSegment_CH3_BANDITSTRUST_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BANDITSTRUST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_162017"));
            }
        }
        
        
        class UDocument_CH3_BANDITSTRUST : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_BANDITSTRUST : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_BANDITSTRUST;
        }
    }
}
#endif /* WITH_STORY_G1R */