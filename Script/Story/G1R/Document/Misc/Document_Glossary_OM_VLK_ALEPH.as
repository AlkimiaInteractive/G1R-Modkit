#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OM_VLK_ALEPH_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_ALEPH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_120102"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_ALEPH_Gossip : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_ALEPH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_120412"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_ALEPH_SecretLocation : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_ALEPH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_121908"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_ALEPH_Lock : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_ALEPH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_125032"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OM_VLK_ALEPH_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OM_VLK_ALEPH;
            default AutoEvaluateUnlockFor.Add(n"OM_VLK_ALEPH_585");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OM_VLK_ALEPH_585") != nullptr && AGothicCharacterState::FindByUniqueName(n"OM_VLK_ALEPH_585").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ORUKMHJ_20250516_124943"));
            }
        }
        
        
        class UDocument_Glossary_OM_VLK_ALEPH : UGlossaryOldCampDocument
        {
            default Title = LocText("OM_VLK_ALEPH_585");
            default Metadata.Add(n"GlossaryForCharacter", "OM_VLK_ALEPH_585");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aleph_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Aleph_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OM_VLK_ALEPH : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OM_VLK_ALEPH;
        }
    }
}
#endif /* WITH_STORY_G1R */