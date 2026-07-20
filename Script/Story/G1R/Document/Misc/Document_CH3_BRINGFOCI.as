#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_BRINGFOCI_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_171000"));
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_175424"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_HelpNC : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_172728"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_HelpOC : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_172902"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_HelpSC : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_173024"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_BRINGFOCI_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_185051"));
                AddParagraph(LocText("TEXT_WIP_JZNMDQD_20250616_185227"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_CronosReward : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_BRINGFOCI_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_BRINGFOCI_RiordianReward : UDocumentSegment
        {
            default InDocument = UDocument_CH3_BRINGFOCI;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_BRINGFOCI_ENTRY_4"));
            }
        }
        
        
        class UDocument_CH3_BRINGFOCI : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_BRINGFOCI : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_BRINGFOCI;
        }
    }
}
#endif /* WITH_STORY_G1R */