#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_123343"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_CareOfMessengers : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_140046"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_Help : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_143646"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_134202"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_Trial : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_143926"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_Unexperienced : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_160051"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_TrollCanyon : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_160236"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_FireMagesEscape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_161639"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_KDF_MILTEN_Uriziel : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_KDF_MILTEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DEVYTQK_20250429_173926"));
            }
        }
        
        
        class UDocument_Glossary_OC_KDF_MILTEN : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_KDF_MILTEN");
            default Metadata.Add(n"GlossaryForCharacter", "OC_KDF_MILTEN");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Milten_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Milten_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_KDF_MILTEN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_KDF_MILTEN;
        }
    }
}
#endif /* WITH_STORY_G1R */