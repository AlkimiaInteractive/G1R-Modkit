#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_DEXTER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DEXTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_133653"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DEXTER_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DEXTER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_133947"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_DEXTER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_DEXTER;
            default AutoEvaluateUnlockFor.Add(n"OC_STT_DEXTER_329");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_STT_DEXTER_329") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_STT_DEXTER_329").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162226"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_DEXTER : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_DEXTER_329");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_DEXTER_329");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Dexter_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Dexter_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_DEXTER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_DEXTER;
        }
    }
}
#endif /* WITH_STORY_G1R */