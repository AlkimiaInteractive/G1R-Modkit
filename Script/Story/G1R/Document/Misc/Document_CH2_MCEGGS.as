#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_MCEGGS_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_114714"));
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_121323"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_Fight : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_122553"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_AfterFight : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_130252"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_AvailableTemplars : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_11"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_Lester : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_141446"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GorNaBarQuest : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XHANXMC_20250805_125537"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GorNaBar : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XHANXMC_20250805_111841"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GorNaKosh : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XHANXMC_20250805_112100"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GorNaVidQuest : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XHANXMC_20250805_125753"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GorNaVid : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_XHANXMC_20250805_112156"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_TemplarsGathered : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_GatherLeft : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_AsghanBlock : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_Ian : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_IanCompleted : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_InformLester : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_172230"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_FourFriends : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_172558"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_IanPermission : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_AYFLHFD_20250611_170926"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH2_MCEGGS_KalomEggs : UDocumentSegment
        {
            default InDocument = UDocument_CH2_MCEGGS;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_MCEGGS_ENTRY_3"));
            }
        }
        
        
        class UDocument_CH2_MCEGGS : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_MCEGGS : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_MCEGGS;
        }
    }
}
#endif /* WITH_STORY_G1R */