UCLASS()
class UBaseArmorDefinition : UArmorDefinition
{
    default m_MaxStack = 1;
    default SetItemType(GameplayTag::Item_Armor);
    default AddItemSpec(GameplayTag::Item_Property_Wereable);
    default AddItemSpec(GameplayTag::Item_Property_NonDroppableOnlyDrop);
}
