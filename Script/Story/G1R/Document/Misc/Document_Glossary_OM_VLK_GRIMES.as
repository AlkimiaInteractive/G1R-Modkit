#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_VLK_GRIMES_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GRIMES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_130620"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_GRIMES_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GRIMES;
            default AutoEvaluateUnlockFor.Add(n"OM_VLK_GRIMES_586");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_VLK_GRIMES_586") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_VLK_GRIMES_586").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_130719"));
            }
        }
        
        
        class UDocument_Glossary_OM_VLK_GRIMES : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_VLK_GRIMES_586");
            default Metadata.Add(n"GlossaryForCharacter", "OM_VLK_GRIMES_586");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grimes_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grimes_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_VLK_GRIMES : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_VLK_GRIMES;
        }
    }
}
#endif /* WITH_STORY_G1R */