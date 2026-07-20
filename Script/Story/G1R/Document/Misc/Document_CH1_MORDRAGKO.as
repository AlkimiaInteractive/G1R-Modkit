#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_MORDRAGKO_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_MORDRAGKO_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_MORDRAGKO_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_MordragDead : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_MORDRAGKO_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_Failed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_MORDRAGKO_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_MordragBeated : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_MORDRAGKO_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_GuideToNC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RHVVZNB_20251008_165954"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_NCArrival : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RHVVZNB_20251008_170301"));
            }
        }
        
        
        class UDocumentSegment_CH1_MORDRAGKO_MordragDead2 : UDocumentSegment
        {
            default InDocument = UDocument_CH1_MORDRAGKO;
            default AutoEvaluateUnlockFor.Add(n"OC_ORG_MORDRAG_826");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_ORG_MORDRAG_826") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_ORG_MORDRAG_826").IsEveryoneOfThisKindDead() && Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DKGDPMB_20251013_110847"));
            }
        }
        
        
        class UDocument_CH1_MORDRAGKO : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_MORDRAGKO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_MORDRAGKO;
        }
    }
}
#endif /* WITH_STORY_G1R */