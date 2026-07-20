#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_UL_STT_COHSEL_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_COHSEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_100842"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_COHSEL_Pet : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_COHSEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_112645"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_COHSEL_RideScavenger : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_COHSEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_113330"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_COHSEL_GotScavenger : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_COHSEL;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_124801"));
            }
        }
        
        
        class UDocumentSegment_Glossary_UL_STT_COHSEL_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_UL_STT_COHSEL;
            default AutoEvaluateUnlockFor.Add(n"UL_STT_COHSEL_337");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"UL_STT_COHSEL_337") != nullptr && AGothicCharacterState::FindByUniqueName(n"UL_STT_COHSEL_337").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_124920"));
            }
        }
        
        
        class UDocument_Glossary_UL_STT_COHSEL : UGlossaryOutsidersDocument
        {
            default Title = LocText("UL_STT_COHSEL_337");
            default Metadata.Add(n"GlossaryForCharacter", "UL_STT_COHSEL_337");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cohsel_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Cohsel_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_UL_STT_COHSEL : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_UL_STT_COHSEL;
        }
    }
}
#endif /* WITH_STORY_G1R */