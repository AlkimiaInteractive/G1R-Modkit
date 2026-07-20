#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_SILAS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SILAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_092908"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_SILAS_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SILAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_095512"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_SILAS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_SILAS;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_SILAS_841");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"NC_ORG_SILAS_841") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_SILAS_841").IsEveryoneOfThisKindDead()) || (G1R::UStoryG1R::Get().SilasFound != 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_YWSGGXH_20250507_104917"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_SILAS : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_SILAS_841");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_SILAS_841");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Silas_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Silas_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_SILAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_SILAS;
        }
    }
}
#endif /* WITH_STORY_G1R */