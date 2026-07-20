UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetMeleeWeaponsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Sword_TwoHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Axe_OneHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Axe_TwoHand);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Fist);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetRangedWeaponsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Weapon_Bow);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Crossbow);
    ItemTags.AddTag(GameplayTag::Item_Ammo);
    ItemTags.AddTag(GameplayTag::Item_Projectile_Arrow);
    ItemTags.AddTag(GameplayTag::Item_Projectile_Bolt);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetTorchTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Weapon_Torch);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetWereablesTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Armor);
    ItemTags.AddTag(GameplayTag::Item_Ring);
    ItemTags.AddTag(GameplayTag::Item_Amulet);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetMagicTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Weapon_Rune);
    ItemTags.AddTag(GameplayTag::Item_Weapon_Scroll);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetFoodTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Food);
    ItemTags.AddTag(GameplayTag::Item_Herb);
    ItemTags.AddTag(GameplayTag::Item_Drug);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetPotionsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Potion);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetMaterialsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Ore);
    ItemTags.AddTag(GameplayTag::Item_Material);
    ItemTags.AddTag(GameplayTag::Item_Trophy);

	return ItemTags;
}


UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetMiscellaneousTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Junk);
    ItemTags.AddTag(GameplayTag::Item_Instrument);
    ItemTags.AddTag(GameplayTag::Item_Lockpick);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetArtefactsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Quest);
    ItemTags.AddTag(GameplayTag::Item_Key);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTagContainer GetDocumentsTags()
{
    FGameplayTagContainer ItemTags;
    ItemTags.AddTag(GameplayTag::Item_Writing);
    ItemTags.AddTag(GameplayTag::Item_Key);

	return ItemTags;
}

UFUNCTION(BlueprintCallable)
FGameplayTag PrepareTooltipItemTypeTag(FGameplayTag Tag)
{
	if (Tag.MatchesTag(GameplayTag::Item_Weapon_Rune))
	{
		return GameplayTag::Item_Weapon_Rune;
	}
    else if (Tag.MatchesTag(GameplayTag::Item_Weapon_Scroll))
    {
		return GameplayTag::Item_Weapon_Scroll;
	}
	else
    {
        return Tag;
    }
}