#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_STT_VIPER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_VIPER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_113803"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_VIPER_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_VIPER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_114059"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_STT_VIPER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_STT_VIPER;
            default AutoEvaluateUnlockFor.Add(n"OM_STT_VIPER_302");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_STT_VIPER_302") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_STT_VIPER_302").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_114125"));
            }
        }
        
        
        class UDocument_Glossary_OM_STT_VIPER : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_STT_VIPER_302");
            default Metadata.Add(n"GlossaryForCharacter", "OM_STT_VIPER_302");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Viper_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Viper_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_STT_VIPER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_STT_VIPER;
        }
    }
}
#endif /* WITH_STORY_G1R */