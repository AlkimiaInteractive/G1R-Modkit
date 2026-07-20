#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_Introduction_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_115225"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_TheMysteriousOrc : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_115254"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_FindUlumulu : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_125303"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_OrcEnclaveEntrance : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_133252"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_LearnOrcish : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_133608"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_Helper : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_142800"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_OLS_URSHAK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_OLS_URSHAK;
            default AutoEvaluateUnlockFor.Add(n"UL_OSL_URSHAK_2200");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_OSL_URSHAK_2200") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_OSL_URSHAK_2200").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_WSOBSJK_20250716_143356"));
            }
        }
        
        
        class UDocument_Glossary_UL_OLS_URSHAK : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_OSL_URSHAK_2200");
            default Metadata.Add(n"GlossaryForCharacter", "UL_OSL_URSHAK_2200");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_UrShak_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_UrShak_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_OLS_URSHAK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_OLS_URSHAK;
        }
    }
}
#endif /* WITH_STORY_G1R */