#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_TORREZ_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_TORREZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_180056"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_TORREZ_BasicMagic : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_TORREZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_112012"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_TORREZ_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_TORREZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_095046"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_TORREZ_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_TORREZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_110241"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_TORREZ_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_TORREZ;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_TORREZ_405");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_KDF_TORREZ_405") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_TORREZ_405").IsEveryoneOfThisKindDead()) || (!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_KDF_TORREZ_405")));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_PBKRESK_20250430_112647"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_TORREZ : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_TORREZ_405");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_TORREZ_405");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torrez_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torrez_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_TORREZ : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_TORREZ;
        }
    }
}
#endif /* WITH_STORY_G1R */