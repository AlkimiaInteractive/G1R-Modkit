#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_TPL_GORHANIS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORHANIS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_150500"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORHANIS_Duel : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORHANIS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_151754"));
                AddParagraph(LocText("TEXT_WIP_EXNCAVK_20250411_151956"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORHANIS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORHANIS;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_GORHANIS_1422");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORHANIS_1422") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORHANIS_1422").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094551"));
            }
        }
        
        
        class UDocument_Glossary_SC_TPL_GORHANIS : UGlossaryOldCampDocument
        {
            default Title = LocText("SC_TPL_GORHANIS_1422");
            default Metadata.Add(n"GlossaryForCharacter", "SC_TPL_GORHANIS_1422");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorHanis_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorHanis_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_TPL_GORHANIS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_TPL_GORHANIS;
        }
    }
}
#endif /* WITH_STORY_G1R */