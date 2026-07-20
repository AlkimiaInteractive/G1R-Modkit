#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH4_INNOSAMULET_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RPNNHIJ_20241121_144018"));
            }
        }
        
        
        class UDocumentSegment_CH4_INNOSAMULET_Location : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QKWAAOH_20241122_124822"));
            }
        }
        
        
        class UDocumentSegment_CH4_INNOSAMULET_TempleFound : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return (AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Innos, 1, 0)) || (AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItMs_Book_Innos, 1, 0));
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RPNNHIJ_20241121_144131"));
            }
        }
        
        
        class UDocumentSegment_CH4_INNOSAMULET_BookFound : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItMs_Book_Innos, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RPNNHIJ_20241121_144201"));
            }
        }
        
        
        class UDocumentSegment_CH4_INNOSAMULET_AmuletFound : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Innos, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RPNNHIJ_20241121_144255"));
            }
        }
        
        
        class UDocumentSegment_CH4_INNOSAMULET_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH4_INNOSAMULET;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RPNNHIJ_20241121_144352"));
            }
        }
        
        
        class UDocument_CH4_INNOSAMULET : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH4_INNOSAMULET : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH4_INNOSAMULET;
        }
    }
}
#endif /* WITH_STORY_G1R */