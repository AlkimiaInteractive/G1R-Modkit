#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_LOSTAMULET_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_134118"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTAMULET_Join : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_135454"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTAMULET_Ambush : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_135627"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTAMULET_Forgive : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_141853"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTAMULET_Dead : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_141822"));
            }
        }
        
        
        class UDocument_CH1_LOSTAMULET : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_LOSTAMULET : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_LOSTAMULET;
        }
    }
}
#endif /* WITH_STORY_G1R */