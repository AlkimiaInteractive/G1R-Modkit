#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_VLK_SNIPES_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_SNIPES;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_130855"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_SNIPES_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_SNIPES;
            default AutoEvaluateUnlockFor.Add(n"OM_VLK_SNIPES_584");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_VLK_SNIPES_584") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_VLK_SNIPES_584").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_131047"));
            }
        }
        
        
        class UDocument_Glossary_OM_VLK_SNIPES : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_VLK_SNIPES_584");
            default Metadata.Add(n"GlossaryForCharacter", "OM_VLK_SNIPES_584");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Snipes_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Snipes_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_VLK_SNIPES : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_VLK_SNIPES;
        }
    }
}
#endif /* WITH_STORY_G1R */