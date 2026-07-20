#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_FINDXARDAS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDXARDAS_DiscoverXardas : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDXARDAS_Golems : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDXARDAS_Demon : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_7"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDXARDAS_MeetXardas : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH4_FINDXARDAS_Lie : UDocumentSegment
        {
            default InDocument = UDocument_CH4_FINDXARDAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_FINDXARDAS_ENTRY_6"));
            }
        }
        
        
        class UDocument_CH4_FINDXARDAS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_FINDXARDAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_FINDXARDAS;
        }
    }
}
#endif /* WITH_STORY_G1R */