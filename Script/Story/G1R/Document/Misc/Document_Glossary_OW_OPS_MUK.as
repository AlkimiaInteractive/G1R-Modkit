#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_OW_OPS_MUK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_MUK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_094908"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_MUK_Alone : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_MUK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_095616"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_MUK_Food : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_MUK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_104147"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_MUK_SecretPath : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_MUK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_104530"));
            }
        }
        
        
        class UDocumentSegment_Glossary_OW_OPS_MUK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_OW_OPS_MUK;
            default AutoEvaluateUnlockFor.Add(n"OW_OPS_MUK_2404");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"OW_OPS_MUK_2404") != nullptr && AGothicCharacterState::FindByUniqueName(n"OW_OPS_MUK_2404").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RRUKMHJ_20250519_104605"));
            }
        }
        
        
        class UDocument_Glossary_OW_OPS_MUK : UGlossaryOutsidersDocument
        {
            default Title = LocText("OW_OPS_MUK_2404");
            default Metadata.Add(n"GlossaryForCharacter", "OW_OPS_MUK_2404");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Muk_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Muk_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_OW_OPS_MUK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_OW_OPS_MUK;
        }
    }
}
#endif /* WITH_STORY_G1R */