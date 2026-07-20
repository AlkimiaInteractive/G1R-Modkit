#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Initial : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_TPDUCLK_20250702_152736"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Orcish : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_091924"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Duel : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_103859"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_DuelFinished : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_104604"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Explore : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_114401"));
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_114703"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Umakhal : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_115753"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Muk : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_141444"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_UmakhalTip : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VPDUCLK_20250704_160545"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_HelpMuk : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ESLVYVK_20250703_153942"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_SecretPath : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VPDUCLK_20250704_142826"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Urnazkrog : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VPDUCLK_20250704_161435"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Burial : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VPDUCLK_20250704_174529"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_BurialCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_134901"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_StealthCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_155042"));
            }
        }
        
        
        class UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_IntelligenceCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_155058"));
            }
        }
        
        
        class UDocument_CH5_ACCESSSLEEPERTEMPLE : UQuestLogDocument
        {
            default AddedSegments.Add(UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_ACCESSSLEEPERTEMPLE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_ACCESSSLEEPERTEMPLE;
        }
    }
}
#endif /* WITH_STORY_G1R */