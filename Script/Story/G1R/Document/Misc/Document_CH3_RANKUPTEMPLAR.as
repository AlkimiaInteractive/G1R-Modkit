#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_RANKUPTEMPLAR_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPTEMPLAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_125702"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPTEMPLAR_Fight : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPTEMPLAR;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_NOVICE46_1358N");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_NOVICE46_1358N") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_NOVICE46_1358N").IsEveryoneOfThisKindDead() && AGothicCharacterState::FindByUniqueName(n"SC_NOV_NOVICE46_1358N") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_NOVICE46_1358N").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_130453"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPTEMPLAR_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPTEMPLAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_130344"));
            }
        }
        
        
        class UDocumentSegment_CH3_RANKUPTEMPLAR_Armor : UDocumentSegment
        {
            default InDocument = UDocument_CH3_RANKUPTEMPLAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GQZIHIK_20250723_130653"));
            }
        }
        
        
        class UDocument_CH3_RANKUPTEMPLAR : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_RANKUPTEMPLAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_RANKUPTEMPLAR;
        }
    }
}
#endif /* WITH_STORY_G1R */