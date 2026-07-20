#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Glossary_SC_VLK_MELVIN_Introduction : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_VLK_MELVIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_161140"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_VLK_MELVIN_SleeperTemple : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_VLK_MELVIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_161727"));
            }
        }
        
        
        class UDocumentSegment_Glossary_SC_VLK_MELVIN_Dead : UDocumentSegment
        {
            default InDocument = UDocument_Glossary_SC_VLK_MELVIN;
            default AutoEvaluateUnlockFor.Add(n"SC_VLK_MELVIN_582");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"SC_VLK_MELVIN_582") != nullptr && AGothicCharacterState::FindByUniqueName(n"SC_VLK_MELVIN_582").IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNINLL_20250513_161808"));
            }
        }
        
        
        class UDocument_Glossary_SC_VLK_MELVIN : UGlossarySwampCampDocument
        {
            default Title = LocText("SC_VLK_MELVIN_582");
            default Metadata.Add(n"GlossaryForCharacter", "SC_VLK_MELVIN_582");
            default m_BannerImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Melvin_M");
            default m_ThumbnailImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Glossary/Characters/T_GlossaryImage_Melvin_S");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Glossary_SC_VLK_MELVIN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Glossary_SC_VLK_MELVIN;
        }
    }
}
#endif /* WITH_STORY_G1R */