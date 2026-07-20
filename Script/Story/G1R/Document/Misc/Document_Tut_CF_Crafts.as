#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_CF_Crafts_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_CF_Crafts;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163947"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163951"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/station_recipe_ui"), LocText("TEXT_WIP_DABMKKF_20260223_153857"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_163958"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164005"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164012"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164017"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164026"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164039"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164049"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164055"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164101"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_164106"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164115"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Tutorials/recipe_tooltip"), LocText("TEXT_WIP_DABMKKF_20260223_153908"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_164122"));
            }
        }
        
        
        class UDocument_Tut_CF_Crafts : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_CF_Crafts_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_163838";
            default m_SortOrder = 703;
            default Metadata.Add(n"SortOrder", "703");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_CF_Crafts : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_CF_Crafts;
        }
    }
}
#endif /* WITH_STORY_G1R */