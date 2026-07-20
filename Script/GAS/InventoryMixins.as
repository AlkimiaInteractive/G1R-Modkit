/**
 * Gameplay specific mixin functions for the InventoryComponent.
 */

/** --- Melee weapons --- */

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedItem(const UInventoryComponent This, TSubclassOf<UItemDefinition> Item)
{
    return This.HasEquippedItemOfClass(Item);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedSword(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Sword);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquipped1hSword(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Sword_OneHand);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquipped2hSword(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Sword_TwoHand);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedAxe(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Axe);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquipped1hAxe(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Axe_OneHand);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquipped2hAxe(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Axe_TwoHand);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedMace(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Mace);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquipped1hMace(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Mace_OneHand);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedStaff(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Staff);
}

UFUNCTION(BlueprintCallable)
mixin bool HasMeleeWeaponInInventory(const UInventoryComponent This)
{
    return This.GetItemsWithSpec(GameplayTag::Item_Range_Melee).Num() > 0;
}

/** --- Ranged weapons --- */

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedBow(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Bow);
}

UFUNCTION(BlueprintCallable)
mixin bool HasEquippedCrossbow(const UInventoryComponent This)
{
    return This.HasEquippedItemOfType(GameplayTag::Item_Weapon_Crossbow);
}

UFUNCTION(BlueprintCallable)
mixin bool HasRangedWeaponInInventory(const UInventoryComponent This)
{
    return This.GetItemsWithSpec(GameplayTag::Item_Range_Long).Num() > 0;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyWeaponInInventory(const UInventoryComponent This)
{
    return This.GetItemsOfType(GameplayTag::Item_Weapon).Num() > 0;
}

UFUNCTION(BlueprintCallable)
mixin bool HasUsableRangedWeaponInInventory(const UInventoryComponent This)
{
    for (auto Item : This.GetItemsWithSpec(GameplayTag::Item_Range_Long))
    {
        if (!This.CanEquipItemOfClass(Item.Class))
            continue;

        if (Item.ItemType.MatchesTag(GameplayTag::Item_Weapon_Crossbow) && !This.HasItemOfClass(UItAm_Bolt))
            continue;

        if (Item.ItemType.MatchesTag(GameplayTag::Item_Weapon_Bow) && !This.HasItemOfClass(UItAm_Arrow))
            continue;

        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyEquippableRangedWeaponInInventory(const UInventoryComponent This)
{
    for (auto Item : This.GetItemsWithSpec(GameplayTag::Item_Range_Long))
    {
        if (This.CanEquipItemOfClass(Item.Class))
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyEquippableWeaponInInventory(const UInventoryComponent This)
{
    for (auto Item : This.GetItemsOfType(GameplayTag::Item_Weapon))
    {
        if (This.CanEquipItemOfClass(Item.Class))
            return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyRealWeaponInInventory(const UInventoryComponent This)
{
    auto Fists = This.GetItemsOfType(GameplayTag::Item_Weapon_Fist);
    auto NonThreatWeapons = This.GetItemsWithSpec(GameplayTag::Item_Property_NoThreat);

    TSet<UItemDefinition> ViableWeapons = This.GetItemsOfType(GameplayTag::Item_Weapon);

    for (auto Weapon : Fists)
    {
        ViableWeapons.Remove(Weapon);
    }
    for (auto Weapon : NonThreatWeapons)
    {
        ViableWeapons.Remove(Weapon);
    }

    return ViableWeapons.Num() > 0; 
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyMeleeWeaponInInventory(const UInventoryComponent This)
{
    return This.HasItemOfClass(UWeaponMeleeDefinition::StaticClass());
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyArcherydWeaponInInventory(const UInventoryComponent This)
{
    return This.HasItemOfClass(UWeaponArcheryDefinition::StaticClass());
}

/** --- Magic --- */

UFUNCTION(BlueprintCallable)
mixin bool HasAnyMagicRuneInInventory(const UInventoryComponent This)
{
    return This.HasMagicRuneInInventory(GameplayTag::Item_Weapon_Rune);
}

UFUNCTION(BlueprintCallable)
mixin bool HasMagicRuneInInventory(const UInventoryComponent This, FGameplayTag MagicRuneType)
{
    if (!MagicRuneType.MatchesTag(GameplayTag::Item_Weapon_Rune))
        return false;

    return This.CountItemsOfType(MagicRuneType) > 0;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnyMagicScrollInInventory(const UInventoryComponent This)
{
    return This.HasMagicScrollInInventory(GameplayTag::Item_Weapon_Scroll);
}

UFUNCTION(BlueprintCallable)
mixin bool HasMagicScrollInInventory(const UInventoryComponent This, FGameplayTag MagicScrollType)
{
    if (!MagicScrollType.MatchesTag(GameplayTag::Item_Weapon_Scroll))
        return false;

    return This.CountItemsOfType(MagicScrollType) > 0;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnySpellWithKeyword(const UInventoryComponent This, FGameplayTag Keyword)
{
    FGameplayTagContainer Keywords;
    Keywords.AddTag(Keyword);

    return This.HasAnySpellWithAllKeywords(Keywords);
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnySpellWithSomeKeywords(const UInventoryComponent This, FGameplayTagContainer Keywords)
{
    if (This.FindSpellWithAnySpecOf(Keywords) == nullptr)
        return false;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool HasAnySpellWithAllKeywords(const UInventoryComponent This, FGameplayTagContainer Keywords)
{
    if (This.FindSpellWithAllSpecsOf(Keywords) == nullptr)
        return false;

    return true;
}

/** Returns how many pieces of Ore are in this inventory. */
UFUNCTION(BlueprintCallable)
mixin int GetOreCount(const UInventoryComponent This)
{
    return This.CountItemsOfClass(UItMi_Orenugget::StaticClass());
}

/** Returns how many pieces of Ore are in this inventory. */
UFUNCTION(BlueprintCallable)
mixin int RemoveOre(UInventoryComponent This, int32 NumToRemove) allow_discard
{
    return This.RemoveItemOfClass(UItMi_Orenugget::StaticClass(), NumToRemove);
}


UFUNCTION(BlueprintCallable)
mixin bool HasEquippedAnyArmor(const UInventoryComponent This)
{
    return IsValid(This.EquippedArmor);
}
