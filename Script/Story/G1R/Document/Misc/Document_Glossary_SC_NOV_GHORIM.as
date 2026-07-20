#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_GHORIM_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_GHORIM;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_155845"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_GHORIM_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_GHORIM;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_GHORIM_1310");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_GHORIM_1310") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_GHORIM_1310").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_160232"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_GHORIM : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_GHORIM_1310");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_GHORIM_1310");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ghorim_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Ghorim_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_GHORIM : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_GHORIM;
        }
    }
}
#endif /* WITH_STORY_G1R */