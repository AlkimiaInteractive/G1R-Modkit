#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_NOV_DARRION_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_DARRION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_144324"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_DARRION_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_DARRION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_144626"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_DARRION_Teacher : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_DARRION;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_154633"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_NOV_DARRION_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_NOV_DARRION;
            default AutoEvaluateUnlockFor.Add(n"SC_NOV_DARRION_1312");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_NOV_DARRION_1312") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_NOV_DARRION_1312").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_155422"));
            }
        }
        
        
        class UDocument_Glossary_SC_NOV_DARRION : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_NOV_DARRION_1312");
            default Metadata.Add(n"GlossaryForCharacter", "SC_NOV_DARRION_1312");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Darrion_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Darrion_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_NOV_DARRION : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_NOV_DARRION;
        }
    }
}
#endif /* WITH_STORY_G1R */