#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_BAALORUN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALORUN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_114023"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALORUN_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALORUN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_114453"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALORUN_NewLeader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALORUN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_114858"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALORUN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALORUN;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_BAALORUN_1209");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALORUN_1209") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALORUN_1209").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_115039"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_BAALORUN : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_BAALORUN_1209");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_BAALORUN_1209");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalOrun_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalOrun_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_BAALORUN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_BAALORUN;
        }
    }
}
#endif /* WITH_STORY_G1R */