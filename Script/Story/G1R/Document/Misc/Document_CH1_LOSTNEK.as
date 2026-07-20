#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH1_LOSTNEK_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_LOSTNEK_ENTRY_2"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_StartJoinOC : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_LOSTNEK_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_Guy : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_UKNOSLJ_20250523_180025"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_AskSnaf : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_UKNOSLJ_20250523_180344"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_Snaf : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_LOSTNEK_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_Dead : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItAt_Amulet_Neks, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_UKNOSLJ_20250523_172258"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_Amulet : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_LOSTNEK_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH1_LOSTNEK_End : UDocumentSegment
        {
            default InDocument = UDocument_CH1_LOSTNEK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH1_LOSTNEK_ENTRY_4"));
            }
        }
        
        
        class UDocument_CH1_LOSTNEK : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH1_LOSTNEK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH1_LOSTNEK;
        }
    }
}
#endif /* WITH_STORY_G1R */