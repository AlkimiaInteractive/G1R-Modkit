#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_STT_CAVALORN_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_CAVALORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_122714"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_CAVALORN_Teacher2 : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_CAVALORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_123340"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_CAVALORN_Bestiary : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_CAVALORN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_133336"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_CAVALORN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_CAVALORN;
            default AutoEvaluateUnlockFor.Add(n"UL_STT_CAVALORN_336");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_STT_CAVALORN_336") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_STT_CAVALORN_336").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094650"));
            }
        }
        
        
        class UDocument_Glossary_UL_STT_CAVALORN : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_STT_CAVALORN_336");
            default Metadata.Add(n"GlossaryForCharacter", "UL_STT_CAVALORN_336");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cavalorn_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cavalorn_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_STT_CAVALORN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_STT_CAVALORN;
        }
    }
}
#endif /* WITH_STORY_G1R */