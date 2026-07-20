#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_123551"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Entrance : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_124600"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Fanatic : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154103"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Crazy : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154214"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Forgive : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154300"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154420"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_NYRAS_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_NYRAS;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_NYRAS_1303");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_NYRAS_1303") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_NYRAS_1303").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_154442"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_NYRAS : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_NYRAS_1303");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_NYRAS_1303");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Nyras_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Nyras_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_NYRAS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_NYRAS;
        }
    }
}
#endif /* WITH_STORY_G1R */