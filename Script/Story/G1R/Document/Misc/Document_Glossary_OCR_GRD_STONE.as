#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OCR_GRD_STONE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_111422"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_STONE_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_113030"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_STONE_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_114148"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_STONE_OreArmor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_115330"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_STONE_GRDArmor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_LEKGWP_20251022_151835"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OCR_GRD_STONE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OCR_GRD_STONE;
            default AutoEvaluateUnlockFor.Add(n"OCR_GRD_STONE_219");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OCR_GRD_STONE_219") != nullptr && AGothicCharacterState::FindByUniqueName(n"OCR_GRD_STONE_219").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_142655"));
            }
        }
        
        
        class UDocument_Glossary_OCR_GRD_STONE : UGlossaryOldCampDocument
        {
            default Title = LocText("OCR_GRD_STONE_219");
            default Metadata.Add(n"GlossaryForCharacter", "OCR_GRD_STONE_219");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Stone_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Stone_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OCR_GRD_STONE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OCR_GRD_STONE;
        }
    }
}
#endif /* WITH_STORY_G1R */