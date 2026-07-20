#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_THERON_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_THERON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_154920"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_THERON_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_THERON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_160359"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_THERON_Extra : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_THERON;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_160536"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_THERON_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_THERON;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_THERON_1372N");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_THERON_1372N") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_THERON_1372N").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_160611"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_THERON : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_THERON_1372N");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_THERON_1372N");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Theron_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Theron_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_THERON : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_THERON;
        }
    }
}
#endif /* WITH_STORY_G1R */