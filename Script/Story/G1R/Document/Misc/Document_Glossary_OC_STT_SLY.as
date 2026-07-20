#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_SLY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_SLY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_111220"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_SLY_Nek : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_SLY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_113154"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_SLY_AfterNek : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_SLY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_112508"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_112719"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_SLY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_SLY;
            default AutoEvaluateUnlockFor.Add(n"OC_STT_SLY_315");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_STT_SLY_315") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_STT_SLY_315").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093305"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_SLY : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_SLY_315");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_SLY_315");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Sly_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Sly_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_SLY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_SLY;
        }
    }
}
#endif /* WITH_STORY_G1R */