#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_RANKUPMERCENARY_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_153715"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPMERCENARY_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_163034"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPMERCENARY_Meet : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_161942"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPMERCENARY_BookOwn : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_163302"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPMERCENARY_BookShip : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_163514"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPMERCENARY_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPMERCENARY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORHKDTK_20250721_163558"));
            }
        }
        
        
        class UDocument_CH3_RANKUPMERCENARY : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_RANKUPMERCENARY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_RANKUPMERCENARY;
        }
    }
}
#endif /* WITH_STORY_G1R */