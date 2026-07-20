#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_110854"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_111026"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_DenyAccess : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_114253"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_RankUpFireMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_111107"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_RanUpFireMagesCompleted : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_121118"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_ImpressAlchemy : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_115520"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_ImpressInscription : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_115552"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_CORRISTO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_CORRISTO;
            default AutoEvaluateUnlockFor.Add(n"OC_KDF_CORRISTO_402");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"OC_KDF_CORRISTO_402") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_KDF_CORRISTO_402").IsEveryoneOfThisKindDead()) || (!IsCharacterInWorld(AGothicCharacterState::FindByUniqueName(n"OC_KDF_CORRISTO_402")));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ABDAQBL_20250428_115125"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_CORRISTO : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_CORRISTO_402");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_CORRISTO_402");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Corristo_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Corristo_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_CORRISTO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_CORRISTO;
        }
    }
}
#endif /* WITH_STORY_G1R */