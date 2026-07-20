#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_4FRIENDS_Entry0 : UDocumentSegment
        {
            default InDocument = UDocument_CH4_4FRIENDS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_4FRIENDS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH4_4FRIENDS_Entry1 : UDocumentSegment
        {
            default InDocument = UDocument_CH4_4FRIENDS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_4FRIENDS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH4_4FRIENDS_Entry2 : UDocumentSegment
        {
            default InDocument = UDocument_CH4_4FRIENDS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH4_4FRIENDS_ENTRY_2"));
            }
        }
        
        
        class UDocument_CH4_4FRIENDS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_4FRIENDS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_4FRIENDS;
        }
    }
}
#endif /* WITH_STORY_G1R */