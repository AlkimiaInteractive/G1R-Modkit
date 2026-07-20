#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_BESTIARY_5_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_BESTIARY_5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_104507"));
            }
        }
        
        
        class UDocumentSegment_CH5_BESTIARY_5_AnotherBook : UDocumentSegment
        {
            default InDocument = UDocument_CH5_BESTIARY_5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_104520"));
            }
        }
        
        
        class UDocumentSegment_CH5_BESTIARY_5_Collect : UDocumentSegment
        {
            default InDocument = UDocument_CH5_BESTIARY_5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_104532"));
            }
        }
        
        
        class UDocumentSegment_CH5_BESTIARY_5_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH5_BESTIARY_5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_111902"));
            }
        }
        
        
        class UDocumentSegment_CH5_BESTIARY_5_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH5_BESTIARY_5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XRHKDTK_20250728_104539"));
            }
        }
        
        
        class UDocument_CH5_BESTIARY_5 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_BESTIARY_5 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_BESTIARY_5;
        }
    }
}
#endif /* WITH_STORY_G1R */