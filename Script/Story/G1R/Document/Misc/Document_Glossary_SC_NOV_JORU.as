#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_JORU_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_161014"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_Help : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_161911"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_Introduction_Shave : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MCIYDVF_20261014_154630"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_Razor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MCIYDVF_20261014_154731"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_162018"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_ReturnToSC : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_162043"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_JORU_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_JORU;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_JORU_1305");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_JORU_1305") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_JORU_1305").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_100322"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_JORU : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_JORU_1305");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_JORU_1305");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Joru_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Joru_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_JORU : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_JORU;
        }
    }
}
#endif /* WITH_STORY_G1R */