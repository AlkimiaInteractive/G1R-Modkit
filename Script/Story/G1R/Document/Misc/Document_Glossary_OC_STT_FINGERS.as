#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_STT_FINGERS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FINGERS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_110354"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FINGERS_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FINGERS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GYVDWFL_20250415_113139"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_STT_FINGERS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_STT_FINGERS;
            default AutoEvaluateUnlockFor.Add(n"OC_STT_FINGERS_331");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_STT_FINGERS_331") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_STT_FINGERS_331").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_162254"));
            }
        }
        
        
        class UDocument_Glossary_OC_STT_FINGERS : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_STT_FINGERS_331");
            default Metadata.Add(n"GlossaryForCharacter", "OC_STT_FINGERS_331");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fingers_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fingers_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_STT_FINGERS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_STT_FINGERS;
        }
    }
}
#endif /* WITH_STORY_G1R */