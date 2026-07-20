#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_CONVOY_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_104233"));
            }
        }
        
        
        class UDocumentSegment_CH1_CONVOY_Nokills : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105558"));
            }
        }
        
        
        class UDocumentSegment_CH1_CONVOY_WedgeLeads : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105616"));
            }
        }
        
        
        class UDocumentSegment_CH1_CONVOY_GornWeapon : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105632"));
            }
        }
        
        
        class UDocumentSegment_CH1_CONVOY_Decoy : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105646"));
            }
        }
        
        
        class UDocumentSegment_CH1_CONVOY_End : UDocumentSegment
        {
            default InDocument = UDocument_CH1_CONVOY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105705"));
                AddParagraph(LocText("TEXT_WIP_ZXAISVL_20250610_105714"));
            }
        }
        
        
        class UDocument_CH1_CONVOY : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_CONVOY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_CONVOY;
        }
    }
}
#endif /* WITH_STORY_G1R */