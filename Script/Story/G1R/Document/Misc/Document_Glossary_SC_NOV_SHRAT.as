#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_SHRAT_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_SHRAT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_125712"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_SHRAT_Party : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_SHRAT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_132051"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_SHRAT_LeftParty : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_SHRAT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_132220"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_SHRAT_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_SHRAT;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_SHRAT_1356");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_SHRAT_1356") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_SHRAT_1356").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_132250"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_SHRAT : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_SHRAT_1356");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_SHRAT_1356");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Shrat_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Shrat_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_SHRAT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_SHRAT;
        }
    }
}
#endif /* WITH_STORY_G1R */