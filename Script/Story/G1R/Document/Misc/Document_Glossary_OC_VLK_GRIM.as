#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_GRIM_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_144732"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRIM_Extended : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_161012"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRIM_Bully : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_161115"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRIM_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRIM;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_GRIM_580");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRIM_580") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRIM_580").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093812"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_GRIM : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_GRIM_580");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_GRIM_580");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grim_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Grim_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_GRIM : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_GRIM;
        }
    }
}
#endif /* WITH_STORY_G1R */