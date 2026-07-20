#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_BC_BAN_QUENTIN_SmallInfo : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_QUENTIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_171525"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_QUENTIN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_QUENTIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_171135"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_QUENTIN_HateMages : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_QUENTIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_171355"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_QUENTIN_HateMagesExplanation : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_QUENTIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_172045"));
            }
        }
        
        
        class UDocumentSegment_Glossary_BC_BAN_QUENTIN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_BC_BAN_QUENTIN;
            default AutoEvaluateUnlockFor.Add(n"BC_BAN_QUENTIN_858");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"BC_BAN_QUENTIN_858") != nullptr && AGothicCharacterState::FindByUniqueName(n"BC_BAN_QUENTIN_858").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MRUKMHJ_20250514_172118"));
            }
        }
        
        
        class UDocument_Glossary_BC_BAN_QUENTIN : UGlossaryOutsidersDocument
        {
            default Title = LocText("BC_BAN_QUENTIN_858");
            default Metadata.Add(n"GlossaryForCharacter", "BC_BAN_QUENTIN_858");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Quentin_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Quentin_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_BC_BAN_QUENTIN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_BC_BAN_QUENTIN;
        }
    }
}
#endif /* WITH_STORY_G1R */