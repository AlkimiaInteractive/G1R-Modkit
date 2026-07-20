#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_BC_BAN_BRANNOK_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_BRANNOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_170528"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_BRANNOK_Access : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_BRANNOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_170857"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_BRANNOK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_BRANNOK;
            default AutoEvaluateUnlockFor.Add(n"BC_BAN_BRANNOK_863");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"BC_BAN_BRANNOK_863") != nullptr && AGothicCharacterState::FindByUniqueName(n"BC_BAN_BRANNOK_863").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_170948"));
            }
        }
        
        
        class UDocument_Glossary_BC_BAN_BRANNOK : UGlossaryOutsidersDocument
        {
            default Title = LocText("BC_BAN_BRANNOK_863");
            default Metadata.Add(n"GlossaryForCharacter", "BC_BAN_BRANNOK_863");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Brannok_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Brannok_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_BC_BAN_BRANNOK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_BC_BAN_BRANNOK;
        }
    }
}
#endif /* WITH_STORY_G1R */