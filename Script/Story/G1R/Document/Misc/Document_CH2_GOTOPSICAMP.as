#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_GOTOPSICAMP_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_141158"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSICAMP_BaalParvez : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_141718"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSICAMP_CaineDead : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_141832"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSICAMP_AfterReport : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BYAISVL_20250612_141913"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSICAMP_AfterInvocation : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YXFLHFD_20250613_165313"));
            }
        }
        
        
        class UDocumentSegment_CH2_GOTOPSICAMP_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_GOTOPSICAMP;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YXFLHFD_20250613_170050"));
            }
        }
        
        
        class UDocument_CH2_GOTOPSICAMP : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_GOTOPSICAMP : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_GOTOPSICAMP;
        }
    }
}
#endif /* WITH_STORY_G1R */