#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CF_Stations_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CF_Stations;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164331"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/crafting_stations"), LocText("TEXT_WIP_DABMKKF_20260223_153937"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164347"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111330"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164418"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111336"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164436"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111345"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164456"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164504"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164513"));
                AddSectionHeading(LocText("TEXT_WIP_HBBFEBC_20260206_111352"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164536"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/forge_stations_overview"), LocText("TEXT_WIP_DABMKKF_20260223_153953"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164556"));
                AddEnumeratedListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164606"));
                AddEnumeratedListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164613"));
                AddEnumeratedListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164620"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164634"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164637"));
            }
        }
        
        
        class UDocument_Tut_CF_Stations : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CF_Stations_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_164242";
            default m_SortOrder = 701;
            default Metadata.Add(n"SortOrder", "701");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CF_Stations : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CF_Stations;
        }
    }
}
#endif /* WITH_STORY_G1R */