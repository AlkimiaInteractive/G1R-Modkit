#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FM_OSL_TARROK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_OSL_TARROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_104609"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_OSL_TARROK_Ulumulu : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_OSL_TARROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_112345"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_OSL_TARROK_Fight : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_OSL_TARROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_112523"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_OSL_TARROK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_OSL_TARROK;
            default AutoEvaluateUnlockFor.Add(n"FM_OSL_TARROK_2001");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"FM_OSL_TARROK_2001") != nullptr && AGothicCharacterState::FindByUniqueName(n"FM_OSL_TARROK_2001").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_115042"));
            }
        }
        
        
        class UDocument_Glossary_FM_OSL_TARROK : UGlossaryOutsidersDocument
        {
            default Title = LocText("FM_OSL_TARROK_2001");
            default Metadata.Add(n"GlossaryForCharacter", "FM_OSL_TARROK_2001");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Tarrok_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Tarrok_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FM_OSL_TARROK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FM_OSL_TARROK;
        }
    }
}
#endif /* WITH_STORY_G1R */