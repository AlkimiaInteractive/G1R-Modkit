#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH2_BOOK_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_BOOK_ENTRY_0"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_TalasRequest : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_112921"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_AcceptHelpPay : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_120636"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_AcceptHelpFree : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_120723"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_RejectHelp : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_120903"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_Goblin : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_142834"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_AcceptGuide : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_145646"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_RejectGuide : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HZNMDQD_20250610_150014"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_Coward : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_BOOK_ENTRY_3"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_Return : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            default AutoEvaluateUnlockFor.Add(n"HERO");
            
            UFUNCTION(BlueprintOverride)
            bool PassesUnlockConditions(const AGothicCharacterState Reader) const
            {
                return AGothicCharacterState::FindByUniqueName(n"Hero") != nullptr && AGothicCharacterState::FindByUniqueName(n"Hero").HasItem(UItWr_Book_Focus, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_BOOK_ENTRY_4"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_Back : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_BOOK_ENTRY_5"));
            }
        }
        
        
        class UDocumentSegment_CH2_BOOK_Completed : UDocumentSegment
        {
            default InDocument = UDocument_CH2_BOOK;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("CH2_BOOK_ENTRY_1"));
            }
        }
        
        
        class UDocument_CH2_BOOK : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH2_BOOK : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH2_BOOK;
        }
    }
}
#endif /* WITH_STORY_G1R */