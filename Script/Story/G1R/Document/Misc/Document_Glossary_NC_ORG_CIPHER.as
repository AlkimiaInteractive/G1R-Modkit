#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_NC_ORG_CIPHER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_CIPHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_112719"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_CIPHER_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_CIPHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_112925"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_CIPHER_Contact : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_CIPHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_115847"));
            }
        }
        
        
        class UDocumentSegment_Glossary_NC_ORG_CIPHER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_NC_ORG_CIPHER;
            default AutoEvaluateUnlockFor.Add(n"NC_ORG_CIPHER_873");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"NC_ORG_CIPHER_873") != nullptr && AGothicCharacterState::FindByUniqueName(n"NC_ORG_CIPHER_873").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LKCBYML_20250506_112931"));
            }
        }
        
        
        class UDocument_Glossary_NC_ORG_CIPHER : UGlossaryNewCampDocument
        {
            default Title = LocText("NC_ORG_CIPHER_873");
            default Metadata.Add(n"GlossaryForCharacter", "NC_ORG_CIPHER_873");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cipher_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cipher_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_NC_ORG_CIPHER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_NC_ORG_CIPHER;
        }
    }
}
#endif /* WITH_STORY_G1R */