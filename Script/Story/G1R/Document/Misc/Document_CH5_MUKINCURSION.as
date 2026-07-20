#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_MUKINCURSION_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_MUKINCURSION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_144302"));
            }
        }
        
        
        class UDocumentSegment_CH5_MUKINCURSION_End : UDocumentSegment
        {
            default InDocument = UDocument_CH5_MUKINCURSION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VPDUCLK_20250704_135713"));
            }
        }
        
        
        class UDocument_CH5_MUKINCURSION : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_MUKINCURSION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_MUKINCURSION;
        }
    }
}
#endif /* WITH_STORY_G1R */