#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_MONASTERYRUIN_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_1"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_CaveLoot : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_DoorClosed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_Meatbug : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_DoorOpened : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_6"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_Focus : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItMs_Focus_04, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_7"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_Troll : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_8"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_GornStay : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_9"));
            }
        }
        
        
        class UDocumentSegment_CH3_MONASTERYRUIN_End : UDocumentSegment
        {
            default InDocument = UDocument_CH3_MONASTERYRUIN;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH3_MONASTERYRUIN_ENTRY_0"));
            }
        }
        
        
        class UDocument_CH3_MONASTERYRUIN : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_MONASTERYRUIN : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_MONASTERYRUIN;
        }
    }
}
#endif /* WITH_STORY_G1R */