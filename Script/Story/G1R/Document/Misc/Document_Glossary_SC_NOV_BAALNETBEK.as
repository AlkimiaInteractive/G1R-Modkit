#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_BAALNETBEK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BAALNETBEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_115240"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_BAALNETBEK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_BAALNETBEK;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_BAALNETBEK_1371");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_BAALNETBEK_1371") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_BAALNETBEK_1371").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_115318"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_BAALNETBEK : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_BAALNETBEK_1371");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_BAALNETBEK_1371");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalNetbek_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalNetbek_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_BAALNETBEK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_BAALNETBEK;
        }
    }
}
#endif /* WITH_STORY_G1R */