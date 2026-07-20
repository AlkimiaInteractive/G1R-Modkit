#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_VLK_GLEN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GLEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_125646"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_GLEN_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GLEN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_130407"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_GLEN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_GLEN;
            default AutoEvaluateUnlockFor.Add(n"OM_VLK_GLEN_583");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_VLK_GLEN_583") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_VLK_GLEN_583").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_130429"));
            }
        }
        
        
        class UDocument_Glossary_OM_VLK_GLEN : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_VLK_GLEN_583");
            default Metadata.Add(n"GlossaryForCharacter", "OM_VLK_GLEN_583");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Glen_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Glen_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_VLK_GLEN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_VLK_GLEN;
        }
    }
}
#endif /* WITH_STORY_G1R */