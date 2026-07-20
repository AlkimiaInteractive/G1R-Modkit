#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_ORG_JACKO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_JACKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_163046"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_JACKO_Realocated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_JACKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_164522"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_JACKO_Beated : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_JACKO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_165222"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_ORG_JACKO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_ORG_JACKO;
            default AutoEvaluateUnlockFor.Add(n"UL_ORG_JACKO_862");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_ORG_JACKO_862") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_ORG_JACKO_862").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_165309"));
            }
        }
        
        
        class UDocument_Glossary_UL_ORG_JACKO : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_ORG_JACKO_862");
            default Metadata.Add(n"GlossaryForCharacter", "UL_ORG_JACKO_862");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jacko_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Jacko_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_ORG_JACKO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_ORG_JACKO;
        }
    }
}
#endif /* WITH_STORY_G1R */