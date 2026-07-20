#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_FORGOTENRECIPE_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FORGOTENRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QNGRNMJ_20241119_141000"));
            }
        }
        
        
        class UDocumentSegment_CH1_FORGOTENRECIPE_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FORGOTENRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QNGRNMJ_20241119_141309"));
            }
        }
        
        
        class UDocumentSegment_CH1_FORGOTENRECIPE_Entry3 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FORGOTENRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QNGRNMJ_20241119_141440"));
            }
        }
        
        
        class UDocumentSegment_CH1_FORGOTENRECIPE_Entry4 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FORGOTENRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QNGRNMJ_20241119_141535"));
            }
        }
        
        
        class UDocumentSegment_CH1_FORGOTENRECIPE_Entry5 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_FORGOTENRECIPE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QNGRNMJ_20241119_141636"));
            }
        }
        
        
        class UDocument_CH1_FORGOTENRECIPE : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_FORGOTENRECIPE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_FORGOTENRECIPE;
        }
    }
}
#endif /* WITH_STORY_G1R */