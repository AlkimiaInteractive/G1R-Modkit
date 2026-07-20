UCLASS(NotBlueprintable)
class UHealthPotion01: UPotionDefinition
{
	default m_Name = "HealthPotion01";
	default m_Value = 2500;
	default m_Icon = "HealthPotion012DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_Visual.BP_ItFo_Potion_Health_Perma_01_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_World.BP_ItFo_Potion_Health_Perma_01_World_C'";
	default m_Description = "HealthPotion01Desc";
	default m_BonusHp = 250;

	UFUNCTION(BlueprintOverride)
	void ConsumePotion() const
	{
		Log("Consume HealthPotion01");
	}
}

UCLASS()
class UHealthPotion02: UPotionDefinition
{
	default m_Name = "HealthPotion02";
	default m_Value = 350;
	default m_Icon = "HealthPotion022DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_Visual.BP_ItFo_Potion_Health_Perma_01_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_World.BP_ItFo_Potion_Health_Perma_01_World_C'";
	default m_Description = "HealthPotion02Desc";
	default m_BonusHp = 150;
}

UCLASS()
class UHealthPotion03: UPotionDefinition
{
	default m_Name = "HealthPotion03";
	default m_Value = 350;
	default m_Icon = "HealthPotion022DIcon";
	default m_ItemVisual = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_Visual.BP_ItFo_Potion_Health_Perma_01_Visual_C'";
	default m_ItemVisualWorld = n"Blueprint'/Game/Items/Potion/BP_ItFo_Potion_Health_Perma_01_World.BP_ItFo_Potion_Health_Perma_01_World_C'";
	default m_Description = "HealthPotion02Desc";
	default m_BonusHp = 150;
}