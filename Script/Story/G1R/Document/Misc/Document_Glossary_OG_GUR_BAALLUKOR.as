#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_GUR_BAALLUKOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_184857"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_OrcGraveyard : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_GUR_BAALLUKOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_185915"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_Mad : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_GUR_BAALLUKOR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_190158"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OG_GUR_BAALLUKOR;
            default AutoEvaluateUnlockFor.Add(n"OG_GUR_BAALLUKOR_1211");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OG_GUR_BAALLUKOR_1211") != nullptr && AGothicCharacterState::FindByUniqueName(n"OG_GUR_BAALLUKOR_1211").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_190205"));
            }
        }
        
        
        class UDocument_Glossary_OG_GUR_BAALLUKOR : UGlossarySwampCampDocument
        {
            default Title = LocText("OG_GUR_BAALLUKOR_1211");
            default Metadata.Add(n"GlossaryForCharacter", "OG_GUR_BAALLUKOR_1211");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalLukor_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalLukor_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OG_GUR_BAALLUKOR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OG_GUR_BAALLUKOR;
        }
    }
}
#endif /* WITH_STORY_G1R */