#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_ISLVYVK_20250707_161642"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Hashor : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103345"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Kasorg : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103413"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Unhilqt : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103424"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Ruuushk : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103450"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Arushat : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103611"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Sword : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_104426"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Barrier : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_104455"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Xardas : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_103314"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Gems : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_110539"));
            }
        }
        
        
        class UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_VRLVYVK_20250708_110825"));
            }
        }
        
        
        class UDocument_CH5_EXPLORESLEEPERTEMPLE : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH5_EXPLORESLEEPERTEMPLE : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH5_EXPLORESLEEPERTEMPLE;
        }
    }
}
#endif /* WITH_STORY_G1R */