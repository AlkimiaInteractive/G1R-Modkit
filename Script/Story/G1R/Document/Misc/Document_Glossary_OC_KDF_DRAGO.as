#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_DRAGO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DRAGO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_115400"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_DRAGO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DRAGO;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_DRAGO_403");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_KDF_DRAGO_403") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_DRAGO_403").IsEveryoneOfThisKindDead()) || (!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_KDF_DRAGO_403")));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_142916"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_DRAGO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_DRAGO_403");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_DRAGO_403");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drago_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Drago_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_DRAGO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_DRAGO;
        }
    }
}
#endif /* WITH_STORY_G1R */