#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_BRINGLIST_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH1_BRINGLIST_Password : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_BRINGLIST_Map : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_BRINGLIST_Ian : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_BRINGLIST_CompletedOC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_BRINGLIST_CompletedNC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_BRINGLIST;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_BRINGLIST_ENTRY_4"));
            }
        }
        
        
        class UDocument_CH1_BRINGLIST : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_BRINGLIST : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_BRINGLIST;
        }
    }
}
#endif /* WITH_STORY_G1R */