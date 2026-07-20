#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CB_AlteredStates_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CB_AlteredStates;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120201"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110338"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120246"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110347"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120309"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110359"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120334"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110407"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120352"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110425"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120411"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110431"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120429"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110437"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120446"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_110442"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120652"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120702"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120714"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_120721"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_120733"));
            }
        }
        
        
        class UDocument_Tut_CB_AlteredStates : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CB_AlteredStates_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_120132";
            default m_SortOrder = 303;
            default Metadata.Add(n"SortOrder", "303");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CB_AlteredStates : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CB_AlteredStates;
        }
    }
}
#endif /* WITH_STORY_G1R */