#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_TOCHURNAGG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_141515"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Discussion : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_TOCHURNAGG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_145447"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Fury : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_TOCHURNAGG;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_145601"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OWR_TOCHURNAGG;
            default AutoEvaluateUnlockFor.Add(n"OW_OWR_TOCHURNAGG_2403");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OWR_TOCHURNAGG_2403") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OWR_TOCHURNAGG_2403").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_145649"));
            }
        }
        
        
        class UDocument_Glossary_OW_OWR_TOCHURNAGG : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OWR_TOCHURNAGG_2403");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OWR_TOCHURNAGG_2403");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Tochurnagg_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Tochurnagg_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OWR_TOCHURNAGG : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OWR_TOCHURNAGG;
        }
    }
}
#endif /* WITH_STORY_G1R */