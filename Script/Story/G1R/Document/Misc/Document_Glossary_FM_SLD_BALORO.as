#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_FM_SLD_BALORO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_BALORO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_182532"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SLD_BALORO_Lie : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_BALORO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_183716"));
            }
        }
        
        
        class UDocumentSegment_Glossary_FM_SLD_BALORO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_FM_SLD_BALORO;
            default AutoEvaluateUnlockFor.Add(n"FM_SLD_BALORO_753");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"FM_SLD_BALORO_753") != nullptr && AGothicCharacterState::FindByUniqueName(n"FM_SLD_BALORO_753").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_183741"));
            }
        }
        
        
        class UDocument_Glossary_FM_SLD_BALORO : UGlossaryNewCampDocument
        {
            default Title = LocText("FM_SLD_BALORO_753");
            default Metadata.Add(n"GlossaryForCharacter", "FM_SLD_BALORO_753");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Baloro_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Baloro_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_FM_SLD_BALORO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_FM_SLD_BALORO;
        }
    }
}
#endif /* WITH_STORY_G1R */