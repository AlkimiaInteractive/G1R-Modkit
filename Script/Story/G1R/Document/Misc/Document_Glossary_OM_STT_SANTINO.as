#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_STT_SANTINO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_SANTINO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_105337"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_SANTINO_OldCamp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_SANTINO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_110904"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_SANTINO_SecretPassage : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_SANTINO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_112636"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_SANTINO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_SANTINO;
            default AutoEvaluateUnlockFor.Add(n"OM_STT_SANTINO_335");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_STT_SANTINO_335") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_STT_SANTINO_335").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_113611"));
            }
        }
        
        
        class UDocument_Glossary_OM_STT_SANTINO : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_STT_SANTINO_335");
            default Metadata.Add(n"GlossaryForCharacter", "OM_STT_SANTINO_335");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Santino_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Santino_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_STT_SANTINO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_STT_SANTINO;
        }
    }
}
#endif /* WITH_STORY_G1R */