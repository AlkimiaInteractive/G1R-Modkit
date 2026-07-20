#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_FINDINGCAINE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBZTSOD_20250603_142428"));
            }
        }
        
        
        class UDocumentSegment_CH2_FINDINGCAINE_Hut : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_115837"));
            }
        }
        
        
        class UDocumentSegment_CH2_FINDINGCAINE_Drawing : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_115557"));
            }
        }
        
        
        class UDocumentSegment_CH2_FINDINGCAINE_Lester : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_115459"));
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_143915"));
            }
        }
        
        
        class UDocumentSegment_CH2_FINDINGCAINE_Caine : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_151839"));
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_152130"));
            }
        }
        
        
        class UDocumentSegment_CH2_FINDINGCAINE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_FINDINGCAINE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RBZTSOD_20250605_152751"));
            }
        }
        
        
        class UDocument_CH2_FINDINGCAINE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_FINDINGCAINE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_FINDINGCAINE;
        }
    }
}
#endif /* WITH_STORY_G1R */