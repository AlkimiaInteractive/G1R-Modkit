#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_FORTUNO_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_FORTUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_154912"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_FORTUNO_DailyRation_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_FORTUNO;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_155529"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_FORTUNO_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_FORTUNO;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_FORTUNO_1357");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_FORTUNO_1357") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_FORTUNO_1357").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_155649"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_FORTUNO : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_FORTUNO_1357");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_FORTUNO_1357");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fortuno_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fortuno_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_FORTUNO : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_FORTUNO;
        }
    }
}
#endif /* WITH_STORY_G1R */