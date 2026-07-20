#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_GUY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GUY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_162229"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GUY_FreeHut : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GUY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_162553"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GUY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GUY;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_GUY_530");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_GUY_530") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_GUY_530").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093839"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_GUY : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_GUY_530");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_GUY_530");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Guy_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Guy_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_GUY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_GUY;
        }
    }
}
#endif /* WITH_STORY_G1R */