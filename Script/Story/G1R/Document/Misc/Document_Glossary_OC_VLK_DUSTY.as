#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_DUSTY_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_DUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_134213"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_DUSTY_Escape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_DUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_141647"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_DUSTY_SwampCamp : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_DUSTY;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_141705"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_DUSTY_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_DUSTY;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_DUSTY_524");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_DUSTY_524") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_DUSTY_524").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093411"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_DUSTY : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_DUSTY_524");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_DUSTY_524");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Dusty_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Dusty_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_DUSTY : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_DUSTY;
        }
    }
}
#endif /* WITH_STORY_G1R */