#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_TALAS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_132520"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_TALAS_Help : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_135809"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_TALAS_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_145519"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_TALAS_Camp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_154358"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_TALAS_OrcGraveyard : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_154631"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_TALAS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_TALAS;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_TALAS_1300");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_TALAS_1300") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_TALAS_1300").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_154649"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_TALAS : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_TALAS_1300");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_TALAS_1300");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Talas_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Talas_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_TALAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_TALAS;
        }
    }
}
#endif /* WITH_STORY_G1R */