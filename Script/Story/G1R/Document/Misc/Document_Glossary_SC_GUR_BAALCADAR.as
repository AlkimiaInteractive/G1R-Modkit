#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_105840"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Ignore : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_111753"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Impress : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_161522"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_TeacherInscription : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_110055"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_TeacherMana : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_110543"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Dealer : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_110440"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
            default AutoEvaluateUnlockFor.Add(n"SC_GUR_BAALCADAR_1208");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALCADAR_1208") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_GUR_BAALCADAR_1208").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_BKCBYML_20250508_112354"));
            }
        }
        
        
        class UDocument_Glossary_SC_GUR_BAALCADAR : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_GUR_BAALCADAR_1208");
            default Metadata.Add(n"GlossaryForCharacter", "SC_GUR_BAALCADAR_1208");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalCadar_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_BaalCadar_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_GUR_BAALCADAR : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_GUR_BAALCADAR;
        }
    }
}
#endif /* WITH_STORY_G1R */