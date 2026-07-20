
UCLASS()
class UItAm_Arrow: UCommonBowArrow
{
    default m_Name = "ItAm_Arrow";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Arrow_Visual.BP_ItAm_Arrow_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItAm_Arrow_World.BP_ItAm_Arrow_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAm_Arrow.T_ItemIcon_ItAm_Arrow";
    default m_Value = 1;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Projectile_Arrow);
    default m_UniqueName = n"ItAm_Arrow";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItAm_Bolt: UCommonBolt
{
    default m_Name = "ItAm_Bolt";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Bolt_Visual.BP_ItAm_Bolt_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItAm_Bolt_World.BP_ItAm_Bolt_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAm_Bolt.T_ItemIcon_ItAm_Bolt";
    default m_Value = 1;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Projectile_Bolt);
    default m_UniqueName = n"ItAm_Bolt";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
}

UCLASS()
class UItAt_Amulet_Ulu_Talisman: UItemDefinition
{
    default m_Name = "ItAt_Amulet_Ulu_Talisman";
    default m_Description = "ItAt_Amulet_Ulu_Talisman_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAt_Amulet_Ulu_Talisman_Visual.BP_ItAt_Amulet_Ulu_Talisman_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItAt_Amulet_Ulu_Talisman_World.BP_ItAt_Amulet_Ulu_Talisman_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItAt_Amulet_Ulu_Talisman.T_ItemIcon_ItAt_Amulet_Ulu_Talisman";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItAt_Amulet_Ulu_Talisman";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItKe_Lockpick: UItemDefinition
{
    default m_Name = "ItKe_Lockpick";
    default m_Description = "ItKe_Lockpick_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItKe_Lockpick_Visual.BP_ItKe_Lockpick_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItKe_Lockpick_World.BP_ItKe_Lockpick_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItKe_Lockpick.T_ItemIcon_ItKe_Lockpick";
    default m_Value = 15;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Lockpick);
    default m_UniqueName = n"ItKe_Lockpick";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Alchemy_Moleratlubric_01: UItemDefinition
{
    default m_Name = "ItMi_Alchemy_Moleratlubric_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Moleratlubric_01_Visual.BP_ItMi_Alchemy_Moleratlubric_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Moleratlubric_01_World.BP_ItMi_Alchemy_Moleratlubric_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Alchemy_Moleratlubric_01.T_ItemIcon_ItMi_Alchemy_Moleratlubric_01";
    default m_Value = 5;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Alchemy_Moleratlubric_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Alchemy_Ink: UItemDefinition
{
    default m_Name = "ItMi_Alchemy_Ink";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Ink_Visual.BP_ItMi_Alchemy_Ink_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Ink_World.BP_ItMi_Alchemy_Ink_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Alchemy_Ink.T_ItemIcon_ItMi_Alchemy_Ink";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Alchemy_Ink";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Alchemy_Syranoil_01: UItemDefinition
{
    default m_Name = "ItMi_Alchemy_Syranoil_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Syranoil_01_Visual.BP_ItMi_Alchemy_Syranoil_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Alchemy_Syranoil_01_World.BP_ItMi_Alchemy_Syranoil_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Alchemy_Syranoil_01.T_ItemIcon_ItMi_Alchemy_Syranoil_01";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Alchemy_Syranoil_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMs_Book_WaterMages: UItemDefinition
{
    default m_Name = "ItMs_Book_WaterMages";
    default m_Value = 160;
    default m_ItemVisual = n"Blueprint'/Game/Items/Writing/BP_ItMs_Book_WaterMages_Visual.BP_ItMs_Book_WaterMages_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Writing/BP_ItMs_Book_WaterMages_World.BP_ItMs_Book_WaterMages_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Book_WaterMages.T_ItemIcon_ItMs_Book_WaterMages";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
	default m_UniqueName = n"ItMs_Book_WaterMages";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Glossary: UItemDefinition
{
    default m_Name = "ItMs_Glossary";
    default m_Value = 160;
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Glossary_Visual.BP_ItMs_Glossary_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Glossary_World.BP_ItMs_Glossary_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Glossary.T_ItemIcon_ItMs_Glossary";
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
	default m_UniqueName = n"ItMs_Glossary";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_Coop: UItemDefinition
{
    default m_Name = "ItMi_Coop";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Coop_Visual.BP_ItMi_Coop_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Coop_World.BP_ItMi_Coop_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Coop.T_ItemIcon_ItMi_Coop";
    default m_Value = 1;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Coop";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMs_DraxHunterKnife: UItemDefinition
{
    default m_Name = "ItMs_DraxHunterKnife";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_DraxHunterKnife_Visual.BP_ItMs_DraxHunterKnife_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_DraxHunterKnife_World.BP_ItMs_DraxHunterKnife_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_DraxHunterKnife.T_ItemIcon_ItMs_DraxHunterKnife";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
	default m_UniqueName = n"ItMs_DraxHunterKnife";
	default m_Description = "ItMs_DraxHunterKnife_description";
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_Hammer: UItemDefinition
{
    default m_Name = "ItMi_Hammer";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Hammer_Visual.BP_ItMi_Hammer_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Hammer_World.BP_ItMi_Hammer_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Hammer.T_ItemIcon_ItMi_Hammer";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 1.0f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Hammer";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_JudgeHat: UItemDefinition
{
    default m_Name = "ItMi_JudgeHat";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_JudgeHat_Visual.BP_ItMi_JudgeHat_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_JudgeHat_World.BP_ItMi_JudgeHat_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_JudgeHat.T_ItemIcon_ItMi_JudgeHat";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_JudgeHat";
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_Lute: UItemDefinition
{
    default m_Name = "ItMi_Lute";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Lute_Visual.BP_ItMi_Lute_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Lute_World.BP_ItMi_Lute_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Lute.T_ItemIcon_ItMi_Lute";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 1.0f;
    default SetItemType(GameplayTag::Item_Instrument);
    default m_UniqueName = n"ItMi_Lute";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Oldcoin_01: UItemDefinition
{
    default m_Name = "ItMi_Oldcoin_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Oldcoin_01_Visual.BP_ItMi_Oldcoin_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Oldcoin_01_World.BP_ItMi_Oldcoin_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Oldcoin_01.T_ItemIcon_ItMi_Oldcoin_01";
    default m_Value = 0;
    default m_MaxStack = 0;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Oldcoin_01";
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Shiny);
    default AddItemSpec(GameplayTag::Item_Property_Throwable);
    default AddItemSpec(GameplayTag::Item_Property_Size_Small);
}

UCLASS()
class UItMi_Specialjoint: UItemDefinition
{
    default m_Name = "ItMi_Specialjoint";
    default m_Description = "ItMi_Specialjoint_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Specialjoint_Visual.BP_ItMi_Specialjoint_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Specialjoint_World.BP_ItMi_Specialjoint_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Specialjoint.T_ItemIcon_ItMi_Specialjoint";
    default m_Value = 200;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_Specialjoint";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
}

UCLASS()
class UItMi_Stomper: UItemDefinition
{
    default m_Name = "ItMi_Stomper";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stomper_Visual.BP_ItMi_Stomper_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stomper_World.BP_ItMi_Stomper_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stomper.T_ItemIcon_ItMi_Stomper";
    default m_Value = 3;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 1.0f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stomper";
}

UCLASS()
class UItMi_Stuff_Alarmhorn: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Alarmhorn";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Alarmhorn_Visual.BP_ItMi_Stuff_Alarmhorn_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Alarmhorn_World.BP_ItMi_Stuff_Alarmhorn_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Alarmhorn.T_ItemIcon_ItMi_Stuff_Alarmhorn";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.5f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Alarmhorn";
}

UCLASS()
class UItMi_Stuff_Amphore_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Amphore_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Amphore_01_Visual.BP_ItMi_Stuff_Amphore_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Amphore_01_World.BP_ItMi_Stuff_Amphore_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Amphore_01.T_ItemIcon_ItMi_Stuff_Amphore_01";
    default m_Value = 8;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 1.0f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Amphore_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Barbknife_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Barbknife_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Barbknife_01_Visual.BP_ItMi_Stuff_Barbknife_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Barbknife_01_World.BP_ItMi_Stuff_Barbknife_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Barbknife_01.T_ItemIcon_ItMi_Stuff_Barbknife_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Barbknife_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Brush: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Brush";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Brush_Visual.BP_ItMi_Stuff_Brush_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Brush_World.BP_ItMi_Stuff_Brush_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Brush.T_ItemIcon_ItMi_Stuff_Brush";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Brush";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Candle_01: UItemDefinition
{
    default m_Name = "ItMi_Candle_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Candle_01_Visual.BP_ItMi_Candle_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Candle_01_World.BP_ItMi_Candle_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Candle_01.T_ItemIcon_ItMi_Candle_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Candle_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Candlestick_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Candlestick_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Candlestick_01_Visual.BP_ItMi_Stuff_Candlestick_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Candlestick_01_World.BP_ItMi_Stuff_Candlestick_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Candlestick_01.T_ItemIcon_ItMi_Stuff_Candlestick_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Candlestick_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Cup_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Cup_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Cup_01_Visual.BP_ItMi_Stuff_Cup_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Cup_01_World.BP_ItMi_Stuff_Cup_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Cup_01.T_ItemIcon_ItMi_Stuff_Cup_01";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Cup_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Cup_02: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Cup_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Cup_02_Visual.BP_ItMi_Stuff_Cup_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Cup_02_World.BP_ItMi_Stuff_Cup_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Cup_02.T_ItemIcon_ItMi_Stuff_Cup_02";
    default m_Value = 20;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Cup_02";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Gearwheel_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Gearwheel_01";
    default m_Description = "ItMi_Stuff_Gearwheel_01_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Gearwheel_01_Visual.BP_ItMi_Stuff_Gearwheel_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Gearwheel_01_World.BP_ItMi_Stuff_Gearwheel_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Gearwheel_01.T_ItemIcon_ItMi_Stuff_Gearwheel_01";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_Stuff_Gearwheel_01";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_Stuff_Idologront_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Idologront_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Idologront_01_Visual.BP_ItMi_Stuff_Idologront_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Idologront_01_World.BP_ItMi_Stuff_Idologront_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Idologront_01.T_ItemIcon_ItMi_Stuff_Idologront_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.5f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Idologront_01";
}

UCLASS()
class UItMi_Stuff_Idolsleeper_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Idolsleeper_01";
    default m_Description = "ItMi_Stuff_Idolsleeper_01_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Idolsleeper_01_Visual.BP_ItMi_Stuff_Idolsleeper_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Idolsleeper_01_World.BP_ItMi_Stuff_Idolsleeper_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Idolsleeper_01.T_ItemIcon_ItMi_Stuff_Idolsleeper_01";
    default m_Value = 0;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.5f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Idolsleeper_01";
}

UCLASS()
class UItMi_Stuff_Mug_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Mug_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Mug_01_Visual.BP_ItMi_Stuff_Mug_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Mug_01_World.BP_ItMi_Stuff_Mug_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Mug_01.T_ItemIcon_ItMi_Stuff_Mug_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Mug_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Pan_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Pan_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Pan_01_Visual.BP_ItMi_Stuff_Pan_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Pan_01_World.BP_ItMi_Stuff_Pan_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Pan_01.T_ItemIcon_ItMi_Stuff_Pan_01";
    default m_Value = 10;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.5f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Pan_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Pipe_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Pipe_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Pipe_01_Visual.BP_ItMi_Stuff_Pipe_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Pipe_01_World.BP_ItMi_Stuff_Pipe_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Pipe_01.T_ItemIcon_ItMi_Stuff_Pipe_01";
    default m_Value = 6;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Pipe_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Plate_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Plate_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Plate_01_Visual.BP_ItMi_Stuff_Plate_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Plate_01_World.BP_ItMi_Stuff_Plate_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Plate_01.T_ItemIcon_ItMi_Stuff_Plate_01";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.2f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Plate_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_Stuff_Silverware_01: UItemDefinition
{
    default m_Name = "ItMi_Stuff_Silverware_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Silverware_01_Visual.BP_ItMi_Stuff_Silverware_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Stuff_Silverware_01_World.BP_ItMi_Stuff_Silverware_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Stuff_Silverware_01.T_ItemIcon_ItMi_Stuff_Silverware_01";
    default m_Value = 4;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Stuff_Silverware_01";
    default AddItemSpec(GameplayTag::Item_Property_TraderRegen);
}

UCLASS()
class UItMi_UrizielGem_01: UItemDefinition
{
    default m_Name = "ItMi_UrizielGem_01";
    default m_Description = "ItMi_UrizielGem_01_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_01_Visual.BP_ItMi_UrizielGem_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_01_World.BP_ItMi_UrizielGem_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_UrizielGem.T_ItemIcon_ItMs_UrizielGem";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_UrizielGem_01";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_UrizielGem_02: UItemDefinition
{
    default m_Name = "ItMi_UrizielGem_02";
    default m_Description = "ItMi_UrizielGem_02_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_02_Visual.BP_ItMi_UrizielGem_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_02_World.BP_ItMi_UrizielGem_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_UrizielGem.T_ItemIcon_ItMs_UrizielGem";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_UrizielGem_02";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_UrizielGem_03: UItemDefinition
{
    default m_Name = "ItMi_UrizielGem_03";
    default m_Description = "ItMi_UrizielGem_03_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_03_Visual.BP_ItMi_UrizielGem_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_03_World.BP_ItMi_UrizielGem_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_UrizielGem.T_ItemIcon_ItMs_UrizielGem";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_UrizielGem_03";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_UrizielGem_04: UItemDefinition
{
    default m_Name = "ItMi_UrizielGem_04";
    default m_Description = "ItMi_UrizielGem_04_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_04_Visual.BP_ItMi_UrizielGem_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_04_World.BP_ItMi_UrizielGem_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_UrizielGem.T_ItemIcon_ItMs_UrizielGem";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_UrizielGem_04";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_UrizielGem_05: UItemDefinition
{
    default m_Name = "ItMi_UrizielGem_05";
    default m_Description = "ItMi_UrizielGem_05_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_05_Visual.BP_ItMi_UrizielGem_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_UrizielGem_05_World.BP_ItMi_UrizielGem_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_UrizielGem.T_ItemIcon_ItMs_UrizielGem";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMi_UrizielGem_05";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMi_Wedel: UItemDefinition
{
    default m_Name = "ItMi_Wedel";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMi_Wedel_Visual.BP_ItMi_Wedel_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMi_Wedel_World.BP_ItMi_Wedel_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMi_Wedel.T_ItemIcon_ItMi_Wedel";
    default m_Value = 2;
    default m_MaxStack = 99;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMi_Wedel";
}

UCLASS()
class UItMs_Ashes: UItemDefinition
{
    default m_Name = "ItMs_Ashes";
    default m_Description = "ItMs_Ashes_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Ashes_Visual.BP_ItMs_Ashes_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Ashes_World.BP_ItMs_Ashes_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Ashes.T_ItemIcon_ItMs_Ashes";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Ashes";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Axe_Bran: UItemDefinition
{
    default m_Name = "ItMs_Axe_Bran";
    default m_Description = "ItMs_Axe_Bran_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Axe_Bran_Visual.BP_ItMs_Axe_Bran_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Axe_Bran_World.BP_ItMs_Axe_Bran_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Axe_Bran.T_ItemIcon_ItMs_Axe_Bran";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Axe_Bran";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Demonprank: UItemDefinition
{
    default m_Name = "ItMs_Demonprank";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Demonprank_Visual.BP_ItMs_Demonprank_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Demonprank_World.BP_ItMs_Demonprank_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Demonprank.T_ItemIcon_ItMs_Demonprank";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Demonprank";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_ExplosionBarrel: UItemDefinition
{
    default m_Name = "ItMs_ExplosionBarrel";
    default m_Description = "ItMs_ExplosionBarrel_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ExplosionBarrel_Visual.BP_ItMs_ExplosionBarrel_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ExplosionBarrel_World.BP_ItMs_ExplosionBarrel_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ExplosionBarrel.T_ItemIcon_ItMs_ExplosionBarrel";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_ExplosionBarrel";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_ExplosionScroll: UItemDefinition
{
    default m_Name = "ItMs_ExplosionScroll";
    default m_Description = "ItMs_ExplosionScroll_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ExplosionScroll_Visual.BP_ItMs_ExplosionScroll_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ExplosionScroll_World.BP_ItMs_ExplosionScroll_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ExplosionScroll.T_ItemIcon_ItMs_ExplosionScroll";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_ExplosionScroll";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_FakeDiggerClothes: UItemDefinition
{
    default m_Name = "ItMs_FakeDiggerClothes";
    default m_Description = "ItMs_FakeDiggerClothes_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_FakeDiggerClothes_Visual.BP_ItMs_FakeDiggerClothes_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_FakeDiggerClothes_World.BP_ItMs_FakeDiggerClothes_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_Vlk_Armor_L.T_ItemIcon_Vlk_Armor_L";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_FakeDiggerClothes";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Focus_01: UOG_FocusStone
{
    default m_Name = "ItMs_Focus_01";
    default m_Description = "ItMs_Focus_01_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_01_Visual.BP_ItMs_Focus_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_01_World.BP_ItMs_Focus_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Focus_01.T_ItemIcon_ItMs_Focus_01";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Focus_01";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_NonLootUnkillable);
    default AddItemSpec(GameplayTag::Item_Property_LookAt_QuestItem);
}

UCLASS()
class UItMs_Focus_02: UOG_FocusStone
{
    default m_Name = "ItMs_Focus_02";
    default m_Description = "ItMs_Focus_02_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_02_Visual.BP_ItMs_Focus_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_02_World.BP_ItMs_Focus_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Focus_02.T_ItemIcon_ItMs_Focus_02";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Focus_02";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_LookAt_QuestItem);
}

UCLASS()
class UItMs_Focus_03: UOG_FocusStone
{
    default m_Name = "ItMs_Focus_03";
    default m_Description = "ItMs_Focus_03_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_03_Visual.BP_ItMs_Focus_03_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_03_World.BP_ItMs_Focus_03_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Focus_03.T_ItemIcon_ItMs_Focus_03";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Focus_03";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_LookAt_QuestItem);
}

UCLASS()
class UItMs_Focus_04: UOG_FocusStone
{
    default m_Name = "ItMs_Focus_04";
    default m_Description = "ItMs_Focus_04_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_04_Visual.BP_ItMs_Focus_04_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_04_World.BP_ItMs_Focus_04_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Focus_04.T_ItemIcon_ItMs_Focus_04";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Focus_04";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_LookAt_QuestItem);
}

UCLASS()
class UItMs_Focus_05: UOG_FocusStone
{
    default m_Name = "ItMs_Focus_05";
    default m_Description = "ItMs_Focus_05_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_05_Visual.BP_ItMs_Focus_05_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_05_World.BP_ItMs_Focus_05_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Focus_05.T_ItemIcon_ItMs_Focus_05";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Focus_05";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_LookAt_QuestItem);
}

UCLASS()
class UItMs_Lightbringer: UItemDefinition
{
    default m_Name = "ItMs_Lightbringer";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Lightbringer_Visual.BP_ItMs_Lightbringer_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Lightbringer_World.BP_ItMs_Lightbringer_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Lightbringer.T_ItemIcon_ItMs_Lightbringer";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Lightbringer";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Remedy: UItemDefinition
{
    default m_Name = "ItMs_Remedy";
    default m_Description = "ItMs_Remedy_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Remedy_Visual.BP_ItMs_Remedy_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Remedy_World.BP_ItMs_Remedy_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Remedy.T_ItemIcon_ItMs_Remedy";
    default m_Value = 50;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Remedy";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_ScavengerWhistle: UItemDefinition
{
    default m_Name = "ItMs_ScavengerWhistle";
    default m_Description = "ItMs_ScavengerWhistle_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ScavengerWhistle_Visual.BP_ItMs_ScavengerWhistle_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ScavengerWhistle_World.BP_ItMs_ScavengerWhistle_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ScavengerWhistle.T_ItemIcon_ItMs_ScavengerWhistle";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Instrument);
    default m_UniqueName = n"ItMs_ScavengerWhistle";
    default AddItemSpec(GameplayTag::Item_Property_CallMount);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
    default AddItemSpec(GameplayTag::Item_Property_Equipable);
    default AddItemSpec(GameplayTag::Item_Property_NoThreat);
    default m_EquipBlockingTags.AddTag(GameplayTag::State_RidingBlocked);
    default m_EquipBlockingTags.AddTag(GameplayTag::State_Riding);
}

UCLASS()
class UItMs_Spellblade: UItemDefinition
{
    default m_Name = "ItMs_Spellblade";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Spellblade_Visual.BP_ItMs_Spellblade_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Spellblade_World.BP_ItMs_Spellblade_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Spellblade.T_ItemIcon_ItMs_Spellblade";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Spellblade";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMS_SunkenTowerStone_01: UItemDefinition
{
    default m_Name = "ItMS_SunkenTowerStone_01";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMS_SunkenTowerStone_01_Visual.BP_ItMS_SunkenTowerStone_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMS_SunkenTowerStone_01_World.BP_ItMS_SunkenTowerStone_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMS_SunkenTowerStone_01.T_ItemIcon_ItMS_SunkenTowerStone_01";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMS_SunkenTowerStone_01";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMS_SunkenTowerStone_02: UItemDefinition
{
    default m_Name = "ItMS_SunkenTowerStone_02";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMS_SunkenTowerStone_02_Visual.BP_ItMS_SunkenTowerStone_02_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMS_SunkenTowerStone_02_World.BP_ItMS_SunkenTowerStone_02_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMS_SunkenTowerStone_02.T_ItemIcon_ItMS_SunkenTowerStone_02";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMS_SunkenTowerStone_02";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Timeblade: UItemDefinition
{
    default m_Name = "ItMs_Timeblade";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Timeblade_Visual.BP_ItMs_Timeblade_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Timeblade_World.BP_ItMs_Timeblade_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Timeblade.T_ItemIcon_ItMs_Timeblade";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Timeblade";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_ToyMaker_000: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_000";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_000_Visual.BP_ItMs_ToyMaker_000_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_000_World.BP_ItMs_ToyMaker_000_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_000.T_ItemIcon_ItMs_ToyMaker_000";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_000";
}

UCLASS()
class UItMs_ToyMaker_001: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_001";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_001_Visual.BP_ItMs_ToyMaker_001_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_001_World.BP_ItMs_ToyMaker_001_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_001.T_ItemIcon_ItMs_ToyMaker_001";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_001";
}

UCLASS()
class UItMs_ToyMaker_009: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_009";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_009_Visual.BP_ItMs_ToyMaker_009_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_009_World.BP_ItMs_ToyMaker_009_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_009.T_ItemIcon_ItMs_ToyMaker_009";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_009";
}

UCLASS()
class UItMs_ToyMaker_013: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_013";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_013_Visual.BP_ItMs_ToyMaker_013_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_013_World.BP_ItMs_ToyMaker_013_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_013.T_ItemIcon_ItMs_ToyMaker_013";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_013";
}

UCLASS()
class UItMs_ToyMaker_005: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_005";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_005_Visual.BP_ItMs_ToyMaker_005_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_005_World.BP_ItMs_ToyMaker_005_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_005.T_ItemIcon_ItMs_ToyMaker_005";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_005";
}

UCLASS()
class UItMs_ToyMaker_007: UItemDefinition
{
    default m_Name = "ItMs_ToyMaker_007";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_007_Visual.BP_ItMs_ToyMaker_007_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_ToyMaker_007_World.BP_ItMs_ToyMaker_007_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_ToyMaker_007.T_ItemIcon_ItMs_ToyMaker_007";
    default m_Value = 10;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default m_Weight = 0.1f;
    default SetItemType(GameplayTag::Item_Junk);
    default m_UniqueName = n"ItMs_ToyMaker_007";
}

UCLASS()
class UItMs_Uriziel: UItemDefinition
{
    default m_Name = "ItMs_Uriziel";
    default m_Description = "ItMs_Uriziel_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Uriziel_Visual.BP_ItMs_Uriziel_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Uriziel_World.BP_ItMs_Uriziel_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Uriziel.T_ItemIcon_ItMs_Uriziel";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Uriziel";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Winch: UItemDefinition
{
    default m_Name = "ItMs_Winch";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Winch_Visual.BP_ItMs_Winch_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Winch_World.BP_ItMs_Winch_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Winch.T_ItemIcon_ItMs_Winch";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
	default m_UniqueName = n"ItMs_Winch";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

UCLASS()
class UItMs_Worldsplitter: UItemDefinition
{
    default m_Name = "ItMs_Worldsplitter";
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Worldsplitter_Visual.BP_ItMs_Worldsplitter_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Worldsplitter_World.BP_ItMs_Worldsplitter_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMs_Worldsplitter.T_ItemIcon_ItMs_Worldsplitter";
    default m_Value = 0;
    default m_MaxStack = 1;
    default m_CanBeSpawned = true;
    default SetItemType(GameplayTag::Item_Quest);
    default m_UniqueName = n"ItMs_Worldsplitter";
    default AddItemSpec(GameplayTag::Item_Property_Quest);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
    default AddItemSpec(GameplayTag::Item_Property_Unique);
}

