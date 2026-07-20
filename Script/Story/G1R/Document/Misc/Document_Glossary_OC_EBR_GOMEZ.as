#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_095653"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_DontTalk : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_110209"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_FireMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_095817"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_Deal : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_112018"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_Escape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_110705"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_OreArmor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_153735"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_EBR_GOMEZ_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_EBR_GOMEZ;
            default AutoEvaluateUnlockFor.Add(n"OC_EBR_GOMEZ_100");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_EBR_GOMEZ_100") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_EBR_GOMEZ_100").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_110036"));
            }
        }
        
        
        class UDocument_Glossary_OC_EBR_GOMEZ : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_EBR_GOMEZ_100");
            default Metadata.Add(n"GlossaryForCharacter", "OC_EBR_GOMEZ_100");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gomez_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Gomez_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_EBR_GOMEZ : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_EBR_GOMEZ;
        }
    }
}
#endif /* WITH_STORY_G1R */