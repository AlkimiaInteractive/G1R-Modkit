#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_Start : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_GPWCOUK_20250714_184525"));
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_113415"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsNothing : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_115532"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsGomezDesign : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_115405"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_StoneKnowsDarrionPlan : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_115755"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_DesignFound : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_113532"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_DeliverGomez : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_124637"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_DeliverPlan : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_125111"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_Materials : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_123244"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_CraftPayed : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_123742"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_CraftWithMaterials : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_123924"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_TeachRecipe : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_124146"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_ReturnDarrion : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_124311"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_CompletedTrue : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_132338"));
            }
        }
        
        
        class UDocumentSegment_CH3_FORGEDRIVALRIES_2_CompletedLie : UDocumentSegment
        {
            default InDocument = UDocument_CH3_FORGEDRIVALRIES_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_HPWCOUK_20250715_132405"));
            }
        }
        
        
        class UDocument_CH3_FORGEDRIVALRIES_2 : UQuestLogDocument
        {
            
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_CH3_FORGEDRIVALRIES_2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_CH3_FORGEDRIVALRIES_2;
        }
    }
}
#endif /* WITH_STORY_G1R */