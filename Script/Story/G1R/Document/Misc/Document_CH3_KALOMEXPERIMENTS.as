#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_120050"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_RecruitBalor : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124412"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_RecruitJoru : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124508"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_MeetViran : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124518"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_Distract : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124557"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_Guide : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124706"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_Fight : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_TEMPLAR27_1444N");
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_TEMPLAR26_1443N");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_TEMPLAR27_1444N") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_TEMPLAR27_1444N").IsEveryoneOfThisKindDead() && AGothicCharacterState::FindByUniqueName(n"SC_TPL_TEMPLAR26_1443N") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_TEMPLAR26_1443N").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124744"));
            }
        }
        
        
        class UDocumentSegment_CH3_KALOMEXPERIMENTS_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_KALOMEXPERIMENTS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_124823"));
            }
        }
        
        
        class UDocument_CH3_KALOMEXPERIMENTS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_KALOMEXPERIMENTS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_KALOMEXPERIMENTS;
        }
    }
}
#endif /* WITH_STORY_G1R */