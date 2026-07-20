#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_BC_BAN_TORIK_Introduction_Trader : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_TORIK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_165542"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_TORIK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_TORIK;
            default AutoEvaluateUnlockFor.Add(n"BC_BAN_TORIK_864");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"BC_BAN_TORIK_864") != nullptr && AGothicCharacterState::FindByUniqueName(n"BC_BAN_TORIK_864").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_165732"));
            }
        }
        
        
        class UDocument_Glossary_BC_BAN_TORIK : UGlossaryOutsidersDocument
        {
            default Title = LocText("BC_BAN_TORIK_864");
            default Metadata.Add(n"GlossaryForCharacter", "BC_BAN_TORIK_864");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torik_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Torik_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_BC_BAN_TORIK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_BC_BAN_TORIK;
        }
    }
}
#endif /* WITH_STORY_G1R */