#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_160155"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Armor : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_160653"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNATOTH_TeachStats : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_160825"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNATOTH_TeachWeapon : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_160908"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
            default AutoEvaluateUnlockFor.Add(n"SC_TPL_GORNATOTH_1402");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNATOTH_1402") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_TPL_GORNATOTH_1402").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_161005"));
            }
        }
        
        
        class UDocument_Glossary_SC_TPL_GORNATOTH : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_TPL_GORNATOTH_1402");
            default Metadata.Add(n"GlossaryForCharacter", "SC_TPL_GORNATOTH_1402");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNaToth_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_GorNaToth_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_TPL_GORNATOTH : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_TPL_GORNATOTH;
        }
    }
}
#endif /* WITH_STORY_G1R */