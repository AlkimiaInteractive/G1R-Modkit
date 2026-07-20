#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_GRAHAM_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRAHAM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_111707"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRAHAM_MapMaker : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRAHAM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_DXNCAVK_20250416_122010"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_GRAHAM_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_GRAHAM;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_GRAHAM_573");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRAHAM_573") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_GRAHAM_573").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093458"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_GRAHAM : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_GRAHAM_573");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_GRAHAM_573");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Graham_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Graham_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_GRAHAM : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_GRAHAM;
        }
    }
}
#endif /* WITH_STORY_G1R */