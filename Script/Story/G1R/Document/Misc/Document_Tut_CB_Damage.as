#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CB_Damage_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CB_Damage;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_115717"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_115727"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115738"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115749"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115757"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_115819"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_115833"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120016"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120028"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120035"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120044"));
            }
        }
        
        
        class UDocument_Tut_CB_Damage : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CB_Damage_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_115538";
            default m_SortOrder = 301;
            default Metadata.Add(n"SortOrder", "301");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CB_Damage : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CB_Damage;
        }
    }
}
#endif /* WITH_STORY_G1R */