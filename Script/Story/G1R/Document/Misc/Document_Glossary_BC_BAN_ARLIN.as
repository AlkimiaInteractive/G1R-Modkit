#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_BC_BAN_ARLIN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_ARLIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_140847"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_ARLIN_Lockpick : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_ARLIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_170039"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_ARLIN_Forgave : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_ARLIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_170147"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_ARLIN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_ARLIN;
            default AutoEvaluateUnlockFor.Add(n"BC_BAN_Arlin_852");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"BC_BAN_Arlin_852") != nullptr && AGothicCharacterState::FindByUniqueName(n"BC_BAN_Arlin_852").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_161410"));
            }
        }
        
        
        class UDocument_Glossary_BC_BAN_ARLIN : UGlossaryOutsidersDocument
        {
            default Title = LocText("BC_BAN_Arlin_852");
            default Metadata.Add(n"GlossaryForCharacter", "BC_BAN_Arlin_852");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Arlin_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Arlin_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_BC_BAN_ARLIN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_BC_BAN_ARLIN;
        }
    }
}
#endif /* WITH_STORY_G1R */