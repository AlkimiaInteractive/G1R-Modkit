#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_SCBANDITSCAMP_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113259"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113332"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_FoundCamp : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113350"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_Trust : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113412"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_TrustProved : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113431"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_Mages : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113447"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_Quentin : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113506"));
            }
        }
        
        
        class UDocumentSegment_CH3_SCBANDITSCAMP_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_SCBANDITSCAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_113529"));
            }
        }
        
        
        class UDocument_CH3_SCBANDITSCAMP : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_SCBANDITSCAMP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_SCBANDITSCAMP;
        }
    }
}
#endif /* WITH_STORY_G1R */