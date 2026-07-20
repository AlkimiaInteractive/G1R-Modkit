UCLASS()
class UItFo_Potion_Strongbeer_Magic_EE : UItFo_Potion_Strongbeer
{
    default m_Name = "ItFo_Potion_Strongbeer_Magic_EE";
    default m_Description = "ItFo_Potion_Strongbeer_Magic_EE_description";
    default m_ItemVisual = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Strongbeer_Visual.BP_ItFo_Potion_Strongbeer_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Food/BP_ItFo_Potion_Strongbeer_World.BP_ItFo_Potion_Strongbeer_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItFo_Potion_Strongbeer.T_ItemIcon_ItFo_Potion_Strongbeer";
    default m_Value = 30;
    default m_MaxStack = 99;
    default AddOnConsume(UGE_Item_Heal_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Heal, 1.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default AddOnConsume(UGE_Item_Mana_Overtime::StaticClass()).AddMag(GameplayTag::GE_Param_Mana, 2.0f).AddMag(GameplayTag::GE_Param_Duration, 15);
    default AddOnConsume(UGE_Item_Alcohol_Insta::StaticClass()).AddMag(GameplayTag::GE_Param_Alcohol, 40.0f);
    default AddOnConsume(UGE_Item_Increase_Resistance_Fire::StaticClass());
    default SetItemType(GameplayTag::Item_Potion);
    default AddItemSpec(GameplayTag::Item_Property_Consumable);
    default AddItemSpec(GameplayTag::Item_Property_QuickConsumable);
    default AddItemSpec(GameplayTag::Item_Property_NonTrade);
}

class UGE_Item_Increase_Resistance_Fire : UScriptGameplayEffect
{
	default DurationPolicy = EGameplayEffectDurationType::Instant;

    default IncreaseAttributeByPercentage(UAttributeSet_Armor::StaticClass(), n"Resistance_Fire", 0.15f); // max carry weight
    
    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 30; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;
};