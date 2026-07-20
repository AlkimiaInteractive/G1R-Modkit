#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_VIRAN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_VIRAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_161615"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_VIRAN_CampDivided : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_VIRAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_170124"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_VIRAN_ReturnToSC : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_VIRAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_170244"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_VIRAN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_VIRAN;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_VIRAN_1302");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_VIRAN_1302") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_VIRAN_1302").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KPJDXIJ_20250509_170728"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_VIRAN : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_VIRAN_1302");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_VIRAN_1302");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Viran_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Viran_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_VIRAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_VIRAN;
        }
    }
}
#endif /* WITH_STORY_G1R */