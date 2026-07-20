#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_InExtremo_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_InExtremo;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_ORYTNQJ_20260609_022033"));
                AddSectionHeading(LocText("TEXT_WIP_AEZXDVB_20260520_112653"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112709"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112711_2083"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112711_41"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112711"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112713"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112714_2238"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112714"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112746"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112747"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112748"));
                AddBulletListEntry(LocText("TEXT_WIP_AEZXDVB_20260520_112749"));
                AddSectionHeading(LocText("TEXT_WIP_AEZXDVB_20260520_112807"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184416"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184436"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184435_2238"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184435_2083"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184435_41"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184435"));
                AddBulletListEntry(LocText("TEXT_WIP_DRYTNQJ_20260604_184434"));
                AddSectionHeading(LocText("TEXT_WIP_DRYTNQJ_20260604_184534"));
                AddParagraph(LocText("TEXT_WIP_DRYTNQJ_20260604_184549"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_InExtremo : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_InExtremo_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_InExtremo : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_InExtremo;
        }
    }
}
#endif /* WITH_STORY_G1R */