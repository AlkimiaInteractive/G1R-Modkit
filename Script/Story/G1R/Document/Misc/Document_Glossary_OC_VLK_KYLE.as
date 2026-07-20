#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_VLK_KYLE_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_KYLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_140900"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_KYLE_HutStory : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_KYLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_IYVDWFL_20250417_142717"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_VLK_KYLE_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_VLK_KYLE;
            default AutoEvaluateUnlockFor.Add(n"OC_VLK_KYLE_536");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_VLK_KYLE_536") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_VLK_KYLE_536").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094057"));
            }
        }
        
        
        class UDocument_Glossary_OC_VLK_KYLE : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_VLK_KYLE_536");
            default Metadata.Add(n"GlossaryForCharacter", "OC_VLK_KYLE_536");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kyle_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Kyle_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_VLK_KYLE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_VLK_KYLE;
        }
    }
}
#endif /* WITH_STORY_G1R */