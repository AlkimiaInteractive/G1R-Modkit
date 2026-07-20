#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_DAMAROK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DAMAROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_095540"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_DAMAROK_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DAMAROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_095603"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_DAMAROK_Healing : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DAMAROK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_102418"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_DAMAROK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_DAMAROK;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_DAMAROK_401");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_KDF_DAMAROK_401") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_DAMAROK_401").IsEveryoneOfThisKindDead()) || (!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_KDF_DAMAROK_401")));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_142936"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_DAMAROK : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_DAMAROK_401");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_DAMAROK_401");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Damarok_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Damarok_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_DAMAROK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_DAMAROK;
        }
    }
}
#endif /* WITH_STORY_G1R */