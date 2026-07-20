#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_144319"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Discussion : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_155437"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Traitor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_155644"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Escape : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_155300"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Safe : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_EBDAQBL_20250424_155254"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OC_WOC_VELAYA_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OC_WOC_VELAYA;
            default AutoEvaluateUnlockFor.Add(n"OC_WOC_VELAYA_108");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OC_WOC_VELAYA_108") != nullptr && AGothicCharacterState::FindByUniqueName(n"OC_WOC_VELAYA_108").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RDVYTQK_20250425_094435"));
            }
        }
        
        
        class UDocument_Glossary_OC_WOC_VELAYA : UGlossaryOldCampDocument
        {
            default Title = LocText("OC_WOC_VELAYA_108");
            default Metadata.Add(n"GlossaryForCharacter", "OC_WOC_VELAYA_108");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Velaya_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Velaya_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OC_WOC_VELAYA : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OC_WOC_VELAYA;
        }
    }
}
#endif /* WITH_STORY_G1R */