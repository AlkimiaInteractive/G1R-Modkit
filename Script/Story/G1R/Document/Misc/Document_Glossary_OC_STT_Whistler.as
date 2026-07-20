#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_Whistler_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_Whistler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_120524"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_133503"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_133527"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_Whistler_Quest : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_Whistler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_133546"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_144957"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_Whistler_AfterQuest : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_Whistler;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_155840"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_160114"));
                AddParagraph(LocText("TEXT_WIP_BXNCAVK_20250414_160120"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_Whistler_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_Whistler;
            default AutoEvaluateUnlockFor.Add(n"OC_STT_WHISTLER_309");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_STT_WHISTLER_309") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_STT_WHISTLER_309").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_093339"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_Whistler : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_WHISTLER_309");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_WHISTLER_309");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Whistler_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Whistler_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_Whistler : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_Whistler;
        }
    }
}
#endif /* WITH_STORY_G1R */