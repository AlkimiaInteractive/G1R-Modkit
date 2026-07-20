#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_PACHO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_PACHO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_093051"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_PACHO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_PACHO;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_PACHO_224");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_PACHO_224") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_PACHO_224").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_110546"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_PACHO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_PACHO_224");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_PACHO_224");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Pacho_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Pacho_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_PACHO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_PACHO;
        }
    }
}
#endif /* WITH_STORY_G1R */