#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_FINDHERBS_Entry0 : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FINDHERBS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FINDHERBS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH3_FINDHERBS_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FINDHERBS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FINDHERBS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_FINDHERBS_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FINDHERBS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FINDHERBS_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH3_FINDHERBS_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FINDHERBS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FINDHERBS_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_FINDHERBS_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FINDHERBS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_FINDHERBS_ENTRY_4"));
            }
        }
        
        
        class UDocument_CH3_FINDHERBS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_FINDHERBS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_FINDHERBS;
        }
    }
}
#endif /* WITH_STORY_G1R */