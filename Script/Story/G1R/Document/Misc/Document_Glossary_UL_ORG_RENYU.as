#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_ORG_RENYU_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_RENYU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_170027"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_RENYU_Beated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_RENYU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_100209"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_RENYU_GrantedAccess : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_RENYU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_100235"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_RENYU_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_RENYU;
            default AutoEvaluateUnlockFor.Add(n"UL_ORG_RENYU_860");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_ORG_RENYU_860") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_ORG_RENYU_860").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_100303"));
            }
        }
        
        
        class UDocument_Glossary_UL_ORG_RENYU : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_ORG_RENYU_860");
            default Metadata.Add(n"GlossaryForCharacter", "UL_ORG_RENYU_860");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Renyu_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Renyu_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_ORG_RENYU : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_ORG_RENYU;
        }
    }
}
#endif /* WITH_STORY_G1R */