
UCLASS()
class UItMs_Book_Innos: UWritingDefinition
{
    default m_Name = "ItMs_Book_Innos";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Book_Innos::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Book_Innos::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 160;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Book_Innos_Visual.BP_ItMs_Book_Innos_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Book_Innos_World.BP_ItMs_Book_Innos_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Book_Innos.T_ItemIcon_ItMs_Book_Innos";
    default m_MaxStack = 1;
    default m_Description = "ItMs_Book_Innos_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItMs_Scroll_OldRecipe: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_OldRecipe";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_OldRecipe::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_OldRecipe::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_OldRecipe_Visual.BP_ItMs_Scroll_OldRecipe_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_OldRecipe_World.BP_ItMs_Scroll_OldRecipe_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_OldRecipe.T_ItemIcon_ItMs_Scroll_OldRecipe";
    default m_MaxStack = 1;
    default m_Description = "ItMs_Scroll_OldRecipe_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_SyraRecipe: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_SyraRecipe";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_SyraRecipe::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_SyraRecipe::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_SyraRecipe_Visual.BP_ItMs_Scroll_SyraRecipe_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_SyraRecipe_World.BP_ItMs_Scroll_SyraRecipe_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_SyraRecipe.T_ItemIcon_ItMs_Scroll_SyraRecipe";
    default m_MaxStack = 1;
    default m_Description = "ItMs_Scroll_SyraRecipe_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_WeaponDesign: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_WeaponDesign";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_WeaponDesign::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_WeaponDesign::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 200;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_WeaponDesign_Visual.BP_ItMs_Scroll_WeaponDesign_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_WeaponDesign_World.BP_ItMs_Scroll_WeaponDesign_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_WeaponDesign.T_ItemIcon_ItMs_Scroll_WeaponDesign";
    default m_MaxStack = 1;
    default m_Description = "ItMs_Scroll_WeaponDesign_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_StoneSketch: UWritingDefinition
{
    default m_Name = "ItMs_StoneSketch";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_StoneSketch::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_StoneSketch::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 5;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_StoneSketch_Visual.BP_ItMs_StoneSketch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_StoneSketch_World.BP_ItMs_StoneSketch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_StoneSketch.T_ItemIcon_ItMs_StoneSketch";
    default m_MaxStack = 1;
    default m_Description = "ItMs_StoneSketch_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItWr_Book_Arcanum: UWritingDefinition
{
    default m_Name = "ItWr_Book_Arcanum";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Arcanum::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Arcanum::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Arcanum_Visual.BP_ItWr_Book_Arcanum_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Arcanum_World.BP_ItWr_Book_Arcanum_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Arcanum.T_ItemIcon_ItWr_Book_Arcanum";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Artfighting: UWritingDefinition
{
    default m_Name = "ItWr_Book_Artfighting";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Artfighting::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Artfighting::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Artfighting_Visual.BP_ItWr_Book_Artfighting_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Artfighting_World.BP_ItWr_Book_Artfighting_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Artfighting.T_ItemIcon_ItWr_Book_Artfighting";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Astronomy: UWritingDefinition
{
    default m_Name = "ItWr_Book_Astronomy";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Astronomy::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Astronomy::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Astronomy_Visual.BP_ItWr_Book_Astronomy_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Astronomy_World.BP_ItWr_Book_Astronomy_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Astronomy.T_ItemIcon_ItWr_Book_Astronomy";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Battle_Varant_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Battle_Varant_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Battle_Varant_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Battle_Varant_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Battle_Varant_01_Visual.BP_ItWr_Book_Battle_Varant_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Battle_Varant_01_World.BP_ItWr_Book_Battle_Varant_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Battle_Varant_01.T_ItemIcon_ItWr_Book_Battle_Varant_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Battle_Varant_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Battle_Varant_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Battle_Varant_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Battle_Varant_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Battle_Varant_02_Visual.BP_ItWr_Book_Battle_Varant_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Battle_Varant_02_World.BP_ItWr_Book_Battle_Varant_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Battle_Varant_02.T_ItemIcon_ItWr_Book_Battle_Varant_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Bestiary_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bestiary_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bestiary_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bestiary_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_01_Visual.BP_ItWr_Book_Bestiary_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_01_World.BP_ItWr_Book_Bestiary_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bestiary_01.T_ItemIcon_ItWr_Book_Bestiary_01";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Bestiary_01_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Bestiary_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bestiary_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bestiary_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bestiary_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_02_Visual.BP_ItWr_Book_Bestiary_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_02_World.BP_ItWr_Book_Bestiary_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bestiary_02.T_ItemIcon_ItWr_Book_Bestiary_02";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Bestiary_02_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Bestiary_03: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bestiary_03";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bestiary_03::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bestiary_03::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_03_Visual.BP_ItWr_Book_Bestiary_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_03_World.BP_ItWr_Book_Bestiary_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bestiary_03.T_ItemIcon_ItWr_Book_Bestiary_03";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Bestiary_03_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Bestiary_04: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bestiary_04";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bestiary_04::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bestiary_04::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_04_Visual.BP_ItWr_Book_Bestiary_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_04_World.BP_ItWr_Book_Bestiary_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bestiary_04.T_ItemIcon_ItWr_Book_Bestiary_04";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Bestiary_04_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Bestiary_05: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bestiary_05";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bestiary_05::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bestiary_05::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_05_Visual.BP_ItWr_Book_Bestiary_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bestiary_05_World.BP_ItWr_Book_Bestiary_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bestiary_05.T_ItemIcon_ItWr_Book_Bestiary_05";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Bestiary_05_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Bloodfly_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Bloodfly_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Bloodfly_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Bloodfly_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bloodfly_01_Visual.BP_ItWr_Book_Bloodfly_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Bloodfly_01_World.BP_ItWr_Book_Bloodfly_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Bloodfly_01.T_ItemIcon_ItWr_Book_Bloodfly_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_01_Visual.BP_ItWr_Book_Chromanin_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_01_World.BP_ItWr_Book_Chromanin_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_01.T_ItemIcon_ItWr_Book_Chromanin_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_02_Visual.BP_ItWr_Book_Chromanin_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_02_World.BP_ItWr_Book_Chromanin_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_02.T_ItemIcon_ItWr_Book_Chromanin_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_03: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_03";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_03::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_03::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_03_Visual.BP_ItWr_Book_Chromanin_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_03_World.BP_ItWr_Book_Chromanin_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_03.T_ItemIcon_ItWr_Book_Chromanin_03";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_04: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_04";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_04::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_04::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_04_Visual.BP_ItWr_Book_Chromanin_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_04_World.BP_ItWr_Book_Chromanin_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_04.T_ItemIcon_ItWr_Book_Chromanin_04";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_05: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_05";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_05::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_05::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_05_Visual.BP_ItWr_Book_Chromanin_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_05_World.BP_ItWr_Book_Chromanin_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_05.T_ItemIcon_ItWr_Book_Chromanin_05";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Chromanin_06: UWritingDefinition
{
    default m_Name = "ItWr_Book_Chromanin_06";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Chromanin_06::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Chromanin_06::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_06_Visual.BP_ItWr_Book_Chromanin_06_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Chromanin_06_World.BP_ItWr_Book_Chromanin_06_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Chromanin_06.T_ItemIcon_ItWr_Book_Chromanin_06";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_00: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_00";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_00::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_00::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 25;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_00_Visual.BP_ItWr_Book_Circle_00_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_00_World.BP_ItWr_Book_Circle_00_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_00.T_ItemIcon_ItWr_Book_Circle_00";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_01_Visual.BP_ItWr_Book_Circle_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_01_World.BP_ItWr_Book_Circle_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_01.T_ItemIcon_ItWr_Book_Circle_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_02_Visual.BP_ItWr_Book_Circle_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_02_World.BP_ItWr_Book_Circle_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_02.T_ItemIcon_ItWr_Book_Circle_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_03: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_03";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_03::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_03::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 150;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_03_Visual.BP_ItWr_Book_Circle_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_03_World.BP_ItWr_Book_Circle_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_03.T_ItemIcon_ItWr_Book_Circle_03";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_04: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_04";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_04::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_04::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 200;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_04_Visual.BP_ItWr_Book_Circle_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_04_World.BP_ItWr_Book_Circle_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_04.T_ItemIcon_ItWr_Book_Circle_04";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_05: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_05";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_05::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_05::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 250;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_05_Visual.BP_ItWr_Book_Circle_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_05_World.BP_ItWr_Book_Circle_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_05.T_ItemIcon_ItWr_Book_Circle_05";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Circle_06: UWritingDefinition
{
    default m_Name = "ItWr_Book_Circle_06";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Circle_06::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Circle_06::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 300;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_06_Visual.BP_ItWr_Book_Circle_06_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Circle_06_World.BP_ItWr_Book_Circle_06_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Circle_06.T_ItemIcon_ItWr_Book_Circle_06";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Demon: UWritingDefinition
{
    default m_Name = "ItWr_Book_Demon";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Demon::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Demon::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Demon_Visual.BP_ItWr_Book_Demon_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Demon_World.BP_ItWr_Book_Demon_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Demon.T_ItemIcon_ItWr_Book_Demon";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_FireLizards: UWritingDefinition
{
    default m_Name = "ItWr_Book_FireLizards";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_FireLizards::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_FireLizards::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 400;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_FireLizards_Visual.BP_ItWr_Book_FireLizards_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_FireLizards_World.BP_ItWr_Book_FireLizards_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_FireLizards.T_ItemIcon_ItWr_Book_FireLizards";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_FireMages: UWritingDefinition
{
    default m_Name = "ItWr_Book_FireMages";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_FireMages::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_FireMages::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_FireMages_Visual.BP_ItWr_Book_FireMages_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_FireMages_World.BP_ItWr_Book_FireMages_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_FireMages.T_ItemIcon_ItWr_Book_FireMages";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Focus: UWritingDefinition
{
    default m_Name = "ItWr_Book_Focus";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Focus::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Focus::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Focus_Visual.BP_ItWr_Book_Focus_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Focus_World.BP_ItWr_Book_Focus_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Focus.T_ItemIcon_ItWr_Book_Focus";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Book);
}

UCLASS()
class UItWr_Book_Gods_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Gods_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Gods_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Gods_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_01_Visual.BP_ItWr_Book_Gods_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_01_World.BP_ItWr_Book_Gods_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Gods_01.T_ItemIcon_ItWr_Book_Gods_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Gods_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Gods_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Gods_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Gods_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_02_Visual.BP_ItWr_Book_Gods_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_02_World.BP_ItWr_Book_Gods_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Gods_02.T_ItemIcon_ItWr_Book_Gods_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Gods_03: UWritingDefinition
{
    default m_Name = "ItWr_Book_Gods_03";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Gods_03::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Gods_03::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 100;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_03_Visual.BP_ItWr_Book_Gods_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Gods_03_World.BP_ItWr_Book_Gods_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Gods_03.T_ItemIcon_ItWr_Book_Gods_03";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Godsgift: UWritingDefinition
{
    default m_Name = "ItWr_Book_Godsgift";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Godsgift::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Godsgift::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Godsgift_Visual.BP_ItWr_Book_Godsgift_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Godsgift_World.BP_ItWr_Book_Godsgift_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Godsgift.T_ItemIcon_ItWr_Book_Godsgift";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Golem_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Golem_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Golem_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Golem_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Golem_01_Visual.BP_ItWr_Book_Golem_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Golem_01_World.BP_ItWr_Book_Golem_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Golem_01.T_ItemIcon_ItWr_Book_Golem_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Golem_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Golem_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Golem_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Golem_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Golem_02_Visual.BP_ItWr_Book_Golem_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Golem_02_World.BP_ItWr_Book_Golem_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Golem_02.T_ItemIcon_ItWr_Book_Golem_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Hunt: UWritingDefinition
{
    default m_Name = "ItWr_Book_Hunt";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Hunt::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Hunt::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Hunt_Visual.BP_ItWr_Book_Hunt_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Hunt_World.BP_ItWr_Book_Hunt_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Hunt.T_ItemIcon_ItWr_Book_Hunt";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Lyric: UWritingDefinition
{
    default m_Name = "ItWr_Book_Lyric";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Lyric::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Lyric::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Lyric_Visual.BP_ItWr_Book_Lyric_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Lyric_World.BP_ItWr_Book_Lyric_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Lyric.T_ItemIcon_ItWr_Book_Lyric";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Book_Lyric_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Magicore: UWritingDefinition
{
    default m_Name = "ItWr_Book_Magicore";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Magicore::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Magicore::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Magicore_Visual.BP_ItWr_Book_Magicore_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Magicore_World.BP_ItWr_Book_Magicore_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Magicore.T_ItemIcon_ItWr_Book_Magicore";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Powerfulart: UWritingDefinition
{
    default m_Name = "ItWr_Book_Powerfulart";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Powerfulart::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Powerfulart::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Powerfulart_Visual.BP_ItWr_Book_Powerfulart_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Powerfulart_World.BP_ItWr_Book_Powerfulart_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Powerfulart.T_ItemIcon_ItWr_Book_Powerfulart";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Recipes_01: UWritingDefinition
{
    default m_Name = "ItWr_Book_Recipes_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Recipes_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Recipes_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Recipes_01_Visual.BP_ItWr_Book_Recipes_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Recipes_01_World.BP_ItWr_Book_Recipes_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Recipes_01.T_ItemIcon_ItWr_Book_Recipes_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Recipes_02: UWritingDefinition
{
    default m_Name = "ItWr_Book_Recipes_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Recipes_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Recipes_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Recipes_02_Visual.BP_ItWr_Book_Recipes_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Recipes_02_World.BP_ItWr_Book_Recipes_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Recipes_02.T_ItemIcon_ItWr_Book_Recipes_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Secrets: UWritingDefinition
{
    default m_Name = "ItWr_Book_Secrets";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Secrets::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Secrets::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Secrets_Visual.BP_ItWr_Book_Secrets_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Secrets_World.BP_ItWr_Book_Secrets_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Secrets.T_ItemIcon_ItWr_Book_Secrets";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Slave: UWritingDefinition
{
    default m_Name = "ItWr_Book_Slave";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Slave::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Slave::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Slave_Visual.BP_ItWr_Book_Slave_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Slave_World.BP_ItWr_Book_Slave_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Slave.T_ItemIcon_ItWr_Book_Slave";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Troll: UWritingDefinition
{
    default m_Name = "ItWr_Book_Troll";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Troll::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Troll::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Troll_Visual.BP_ItWr_Book_Troll_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Troll_World.BP_ItWr_Book_Troll_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Troll.T_ItemIcon_ItWr_Book_Troll";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_True_Power: UWritingDefinition
{
    default m_Name = "ItWr_Book_True_Power";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_True_Power::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_True_Power::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_True_Power_Visual.BP_ItWr_Book_True_Power_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_True_Power_World.BP_ItWr_Book_True_Power_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_True_Power.T_ItemIcon_ItWr_Book_True_Power";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Book_Zombie: UWritingDefinition
{
    default m_Name = "ItWr_Book_Zombie";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Book_Zombie::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Book_Zombie::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Zombie_Visual.BP_ItWr_Book_Zombie_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Book_Zombie_World.BP_ItWr_Book_Zombie_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Book_Zombie.T_ItemIcon_ItWr_Book_Zombie";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Book);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Map_Cliff: UWritingDefinition
{
    default m_Name = "ItWr_Map_Cliff";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_Cliff::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Cliff_Visual.BP_ItWr_Map_Cliff_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Cliff_World.BP_ItWr_Map_Cliff_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_Cliff.T_ItemIcon_ItWr_Map_Cliff";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_Focus: UWritingDefinition
{
    default m_Name = "ItWr_Map_Focus";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_Focus::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Focus_Visual.BP_ItWr_Map_Focus_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Focus_World.BP_ItWr_Map_Focus_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_Focus.T_ItemIcon_ItWr_Map_Focus";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_NewCamp: UWritingDefinition
{
    default m_Name = "ItWr_Map_NewCamp";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_NewCamp::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_NewCamp_Visual.BP_ItWr_Map_NewCamp_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_NewCamp_World.BP_ItWr_Map_NewCamp_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_NewCamp.T_ItemIcon_ItWr_Map_NewCamp";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_OldCamp: UWritingDefinition
{
    default m_Name = "ItWr_Map_OldCamp";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_OldCamp::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldCamp_Visual.BP_ItWr_Map_OldCamp_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldCamp_World.BP_ItWr_Map_OldCamp_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_OldCamp.T_ItemIcon_ItWr_Map_OldCamp";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_OldMine: UWritingDefinition
{
    default m_Name = "ItWr_Map_OldMine";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_OldMine::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldMine_Visual.BP_ItWr_Map_OldMine_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldMine_World.BP_ItWr_Map_OldMine_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_OldMine.T_ItemIcon_ItWr_Map_OldMine";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_OldMineSC: UWritingDefinition
{
    default m_Name = "ItWr_Map_OldMineSC";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_OldMine::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 30;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldMineSC_Visual.BP_ItWr_Map_OldMineSC_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_OldMineSC_World.BP_ItWr_Map_OldMineSC_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_OldMine.T_ItemIcon_ItWr_Map_OldMine";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}


UCLASS()
class UItWr_Map_Orc: UWritingDefinition
{
    default m_Name = "ItWr_Map_Orc";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_Orc::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Orc_Visual.BP_ItWr_Map_Orc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Orc_World.BP_ItWr_Map_Orc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_Orc.T_ItemIcon_ItWr_Map_Orc";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_SwampCamp: UWritingDefinition
{
    default m_Name = "ItWr_Map_SwampCamp";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_SwampCamp::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 40;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_SwampCamp_Visual.BP_ItWr_Map_SwampCamp_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_SwampCamp_World.BP_ItWr_Map_SwampCamp_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_SwampCamp.T_ItemIcon_ItWr_Map_SwampCamp";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_Temple: UWritingDefinition
{
    default m_Name = "ItWr_Map_Temple";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_Temple::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Temple_Visual.BP_ItWr_Map_Temple_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Temple_World.BP_ItWr_Map_Temple_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_Temple.T_ItemIcon_ItWr_Map_Temple";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Map_Temple_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_World: UWritingDefinition
{
    default m_Name = "ItWr_Map_World";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_World::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_World_Visual.BP_ItWr_Map_World_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_World_World.BP_ItWr_Map_World_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_World.T_ItemIcon_ItWr_Map_World";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_WorldComplete: UWritingDefinition
{
    default m_Name = "ItWr_Map_WorldComplete";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_WorldComplete::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_WorldComplete_Visual.BP_ItWr_Map_WorldComplete_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_WorldComplete_World.BP_ItWr_Map_WorldComplete_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_WorldComplete.T_ItemIcon_ItWr_Map_WorldComplete";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Map_Lighthouse: UWritingDefinition
{
    default m_Name = "ItWr_Map_Lighthouse";
    #ifdef WITH_STORY_G1R
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Map_World::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 50;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Lighthouse_Visual.BP_ItWr_Map_Lighthouse_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Map_Lighthouse_World.BP_ItWr_Map_Lighthouse_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Map_World.T_ItemIcon_ItWr_Map_World"; // TODO
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_CreatesMemory);
    default AddItemSpec(GameplayTag::Item_Property_Map);
}

UCLASS()
class UItWr_Scroll_AbandonMineSketch: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_AbandonMineSketch";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_AbandonMineSketch::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_AbandonMineSketch::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_AbandonMineSketch_Visual.BP_ItWr_Scroll_AbandonMineSketch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_AbandonMineSketch_World.BP_ItWr_Scroll_AbandonMineSketch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_AbandonMineSketch.T_ItemIcon_ItWr_Scroll_AbandonMineSketch";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_AbandonMineSketch_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Bran_01: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Bran_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Bran_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Bran_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Bran_01.BP_ItWr_Scroll_Bran_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Bran_01_World.BP_ItWr_Scroll_Bran_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Bran_01.T_ItemIcon_ItWr_Scroll_Bran_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Certificate: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Certificate";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Certificate::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Certificate::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Certificate_Visual.BP_ItWr_Scroll_Certificate_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Certificate_World.BP_ItWr_Scroll_Certificate_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Certificate.T_ItemIcon_ItWr_Scroll_Certificate";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_Certificate_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Cronos: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Cronos";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Cronos::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Cronos::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Cronos_Visual.BP_ItWr_Scroll_Cronos_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Cronos_World.BP_ItWr_Scroll_Cronos_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Generic.T_ItemIcon_ItWr_Scroll_Generic";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_Cronos_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_DreamUniverse: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_DreamUniverse";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_DreamUniverse::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_DreamUniverse::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_DreamUniverse_Visual.BP_ItWr_Scroll_DreamUniverse_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_DreamUniverse_World.BP_ItWr_Scroll_DreamUniverse_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_DreamUniverse.T_ItemIcon_ItWr_Scroll_DreamUniverse";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_DreamWorld: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_DreamWorld";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_DreamWorld::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_DreamWorld::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_DreamWorld_Visual.BP_ItWr_Scroll_DreamWorld_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_DreamWorld_World.BP_ItWr_Scroll_DreamWorld_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_DreamWorld.T_ItemIcon_ItWr_Scroll_DreamWorld";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Jacko_01: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Jacko_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Jacko_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Jacko_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Jacko_01_Visual.BP_ItWr_Scroll_Jacko_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Jacko_01_World.BP_ItWr_Scroll_Jacko_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Jacko_01.T_ItemIcon_ItWr_Scroll_Jacko_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Kalom: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Kalom";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Kalom::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Kalom::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Kalom_Visual.BP_ItWr_Scroll_Kalom_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Kalom_World.BP_ItWr_Scroll_Kalom_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Kalom.T_ItemIcon_ItWr_Scroll_Kalom";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_Kalom_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Letter_01: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Letter_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Letter_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Letter_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Letter_01_Visual.BP_ItWr_Scroll_Letter_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Letter_01_World.BP_ItWr_Scroll_Letter_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Letter_01.T_ItemIcon_ItWr_Scroll_Letter_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItWr_Scroll_Letter_02: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Letter_02";
    default m_Description = "ItWr_Scroll_Letter_02_description";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Letter_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Letter_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Letter_02_Visual.BP_ItWr_Scroll_Letter_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Letter_02_World.BP_ItWr_Scroll_Letter_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Letter_02.T_ItemIcon_ItWr_Scroll_Letter_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItWr_Scroll_List: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_List";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_List::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_List::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_List_Visual.BP_ItWr_Scroll_List_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_List_World.BP_ItWr_Scroll_List_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_List.T_ItemIcon_ItWr_Scroll_List";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_List_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
}

UCLASS()
class UItWr_Scroll_Listnc: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Listnc";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Listnc::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Listnc::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Listnc_Visual.BP_ItWr_Scroll_Listnc_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Listnc_World.BP_ItWr_Scroll_Listnc_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Listnc.T_ItemIcon_ItWr_Scroll_Listnc";
    default m_MaxStack = 1;
    default m_Description = "ItWr_Scroll_Listnc_description";
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
}

UCLASS()
class UItWr_Scroll_Milten: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Milten";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Milten::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Milten::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Milten_Visual.BP_ItWr_Scroll_Milten_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Milten_World.BP_ItWr_Scroll_Milten_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Milten.T_ItemIcon_ItWr_Scroll_Milten";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Mysteriousnote: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Mysteriousnote";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Mysteriousnote::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Mysteriousnote::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Mysteriousnote_Visual.BP_ItWr_Scroll_Mysteriousnote_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Mysteriousnote_World.BP_ItWr_Scroll_Mysteriousnote_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Mysteriousnote.T_ItemIcon_ItWr_Scroll_Mysteriousnote";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItWr_Scroll_Orkparcment_01: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Orkparcment_01";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Orkparcment_01::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Orkparcment_01::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Orkparcment_01_Visual.BP_ItWr_Scroll_Orkparcment_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Orkparcment_01_World.BP_ItWr_Scroll_Orkparcment_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Orkparcment_01.T_ItemIcon_ItWr_Scroll_Orkparcment_01";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Orkparcment_02: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Orkparcment_02";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Orkparcment_02::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Orkparcment_02::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Orkparcment_02_Visual.BP_ItWr_Scroll_Orkparcment_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Orkparcment_02_World.BP_ItWr_Scroll_Orkparcment_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Orkparcment_02.T_ItemIcon_ItWr_Scroll_Orkparcment_02";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_RankWaterMages: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_RankWaterMages";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_RankWaterMages::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_RankWaterMages::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_RankWaterMages_Visual.BP_ItWr_Scroll_RankWaterMages_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_RankWaterMages_World.BP_ItWr_Scroll_RankWaterMages_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Generic.T_ItemIcon_ItWr_Scroll_Generic";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_Sketch: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_Sketch";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_Sketch::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_Sketch::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 60;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Sketch_Visual.BP_ItWr_Scroll_Sketch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_Sketch_World.BP_ItWr_Scroll_Sketch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Sketch.T_ItemIcon_ItWr_Scroll_Sketch";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItWr_Scroll_SyraNote: UWritingDefinition
{
    default m_Name = "ItWr_Scroll_SyraNote";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItWr_Scroll_SyraNote::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItWr_Scroll_SyraNote::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 10;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_SyraNote_Visual.BP_ItWr_Scroll_SyraNote_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItWr_Scroll_SyraNote_World.BP_ItWr_Scroll_SyraNote_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_SyraNote.T_ItemIcon_ItWr_Scroll_SyraNote";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_SerialKiller: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_SerialKiller";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_SerialKiller::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_SerialKiller::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_SerialKiller_Visual.BP_ItMs_Scroll_SerialKiller_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_SerialKiller_World.BP_ItMs_Scroll_SerialKiller_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_SerialKiller.T_ItemIcon_ItMs_Scroll_SerialKiller";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_ToyMaker: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_ToyMaker";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_ToyMaker::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_ToyMaker::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_ToyMaker_Visual.BP_ItMs_Scroll_ToyMaker_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_ToyMaker_World.BP_ItMs_Scroll_ToyMaker_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_ToyMaker.T_ItemIcon_ItMs_Scroll_ToyMaker";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_AbandonedGuy: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_AbandonedGuy";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_AbandonedGuy::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_AbandonedGuy::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_AbandonedGuy_Visual.BP_ItMs_Scroll_AbandonedGuy_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_AbandonedGuy_World.BP_ItMs_Scroll_AbandonedGuy_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_AbandonedGuy.T_ItemIcon_ItMs_Scroll_AbandonedGuy";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_LoveInterest: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_LoveInterest";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_LoveInterest::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_LoveInterest::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveInterest_Visual.BP_ItMs_Scroll_LoveInterest_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveInterest_World.BP_ItMs_Scroll_LoveInterest_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_LoveInterest.T_ItemIcon_ItMs_Scroll_LoveInterest";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_LoveInterest_2: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_LoveInterest_2";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_LoveInterest_2::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_LoveInterest_2::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveInterest_2_Visual.BP_ItMs_Scroll_LoveInterest_2_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveInterest_2_World.BP_ItMs_Scroll_LoveInterest_2_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Generic.T_ItemIcon_ItWr_Scroll_Generic";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_WomensRevenge: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_WomensRevenge";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_WomensRevenge::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_WomensRevenge::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_WomensRevenge_Visual.BP_ItMs_Scroll_WomensRevenge_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_WomensRevenge_World.BP_ItMs_Scroll_WomensRevenge_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItWr_Scroll_Generic.T_ItemIcon_ItWr_Scroll_Generic";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_PaintersCave: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_PaintersCave";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_PaintersCave::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_PaintersCave::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_PaintersCave_Visual.BP_ItMs_Scroll_PaintersCave_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_PaintersCave_World.BP_ItMs_Scroll_PaintersCave_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_PaintersCave.T_ItemIcon_ItMs_Scroll_PaintersCave";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_LoveStoryFogTower: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_LoveStoryFogTower";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_LoveStoryFogTower::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_LoveStoryFogTower::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveStoryFogTower_Visual.BP_ItMs_Scroll_LoveStoryFogTower_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveStoryFogTower_World.BP_ItMs_Scroll_LoveStoryFogTower_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_LoveStoryFogTower.T_ItemIcon_ItMs_Scroll_LoveStoryFogTower";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_LoveStoryWomen: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_LoveStoryWomen";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_LoveStoryWomen::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_LoveStoryWomen::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveStoryWomen_Visual.BP_ItMs_Scroll_LoveStoryWomen_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_LoveStoryWomen_World.BP_ItMs_Scroll_LoveStoryWomen_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_LoveStoryWomen.T_ItemIcon_ItMs_Scroll_LoveStoryWomen";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}

UCLASS()
class UItMs_Scroll_InExtremo: UWritingDefinition
{
    default m_Name = "ItMs_Scroll_InExtremo";
    #ifdef WITH_STORY_G1R
    default m_BookCoverConfiguration = UBookCover_ItMs_Scroll_InExtremo::StaticClass();
    default m_WritingDocument = G1R::Document::UDocument_ItMs_Scroll_InExtremo::StaticClass();
    #endif /* WITH_STORY_G1R */
    default m_Value = 1;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_InExtremo_Visual.BP_ItMs_Scroll_InExtremo_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Scroll_InExtremo_World.BP_ItMs_Scroll_InExtremo_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Scroll_InExtremo.T_ItemIcon_ItMs_Scroll_InExtremo";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Writing);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Parchment);
}
