#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_GRD_FLETCHER_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_FLETCHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_162706"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_FLETCHER_NightPatrol : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_FLETCHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_173719"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_FLETCHER_AfterFireMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_FLETCHER;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_175416"));
                AddParagraph(LocText("TEXT_WIP_TMNINLL_20250515_105932"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_GRD_FLETCHER_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_GRD_FLETCHER;
            default AutoEvaluateUnlockFor.Add(n"OC_GRD_FLETCHER_255");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_GRD_FLETCHER_255") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_GRD_FLETCHER_255").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_KARSWDD_20250604_094003"));
            }
        }
        
        
        class UDocument_Glossary_OC_GRD_FLETCHER : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_GRD_FLETCHER_255");
            default Metadata.Add(n"GlossaryForCharacter", "OC_GRD_FLETCHER_255");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fletcher_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Fletcher_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_GRD_FLETCHER : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_GRD_FLETCHER;
        }
    }
}
#endif /* WITH_STORY_G1R */