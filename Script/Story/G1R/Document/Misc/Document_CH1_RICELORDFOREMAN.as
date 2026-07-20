#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_RICELORDFOREMAN_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_121826"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_AskFarmers : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_122237"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_WeedCave : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_122741"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BranDrunk : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_123347"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BranFriends : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_123606"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BranDebt : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_125541"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BranDesc : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_125608"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_SecretEntry : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_130956"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_CorpseID : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_131053"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_SilasConfess : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_131203"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_SilasBribe : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_RMNDECM_20250604_131228"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BodyFound : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_105238"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_BrandFound : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_JAMPHUL_20250605_105925"));
            }
        }
        
        
        class UDocumentSegment_CH1_RICELORDFOREMAN_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH1_RICELORDFOREMAN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QKSPTUH_20250714_093428"));
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReader(AGothicCharacterState Reader)
            {
                Log("Unknown function: ");
            }
            
            UFUNCTION(BlueprintOverride)
            void NotifyShownToReaderFirstTime(AGothicCharacterState Reader)
            {
                Log("Unknown function: ");
            }
        }
        
        
        class UDocument_CH1_RICELORDFOREMAN : UDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_RICELORDFOREMAN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_RICELORDFOREMAN;
        }
    }
}
#endif /* WITH_STORY_G1R */