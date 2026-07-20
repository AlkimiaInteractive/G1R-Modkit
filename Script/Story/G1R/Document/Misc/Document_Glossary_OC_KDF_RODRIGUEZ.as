#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_RODRIGUEZ_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_RODRIGUEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_120657"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_RODRIGUEZ_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_RODRIGUEZ;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_RODRIGUEZ_400");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_KDF_RODRIGUEZ_400") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_RODRIGUEZ_400").IsEveryoneOfThisKindDead()) || (!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_KDF_RODRIGUEZ_400")));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_142817"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_RODRIGUEZ : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_RODRIGUEZ_400");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_RODRIGUEZ_400");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rodriguez_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Rodriguez_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_RODRIGUEZ : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_RODRIGUEZ;
        }
    }
}
#endif /* WITH_STORY_G1R */