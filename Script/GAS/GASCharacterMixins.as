/**
 * This file contains mixins to make querying GAS data from a character easier.
 */

/** ---- Base stats ---- */

/** Heals the character by the given amount of HP */
UFUNCTION(BlueprintCallable)
mixin void Heal(const AGothicCharacter Character, float NumHealth = MAX_flt)
{
    if (Character.GetGothicAbilitySystemComponent() == nullptr)
        return;

    Character.GetGothicAbilitySystemComponent().ApplyGameplayEffectSpecToSelf(Character.AbilitySystemComponent.GE_HealBy(NumHealth));
}

/** Grants the given amount of experience */
UFUNCTION(BlueprintCallable)
mixin void GiveExperience(const AGothicCharacter Character, int Amount)
{
    Character.AbilitySystemComponent.ApplyGameplayEffectSpecToSelf(Character.AbilitySystemComponent.GE_IncreaseExperience(Amount));
}

/** Grants the character the given skill. */
UFUNCTION(BlueprintCallable)
mixin void GiveSkill(AGothicCharacter Character, TSubclassOf<UGE_Skill_Generic> SkillEffect)
{
    Character.AbilitySystemComponent.ApplyGameplayEffectToSelf(SkillEffect, 0, Character.AbilitySystemComponent.MakeEffectContext());
}

UFUNCTION(BlueprintCallable)
mixin bool HasItem(const AGothicCharacter Character, TSubclassOf<UItemDefinition> Item, int MinCount = 1, int Pouch = 0)
// mixin bool HasItem(const AGothicCharacter Character, TSubclassOf<UItemDefinition> Item, int MinCount = 1, EInventorySlotKind InventoryKind = EInventorySlotKind::BasicInventory)
{
    return Character.Inventory.CountItemsOfClass(Item, Pouch != 0 ? EInventorySlotKind::BasicInventoryAndPouch : EInventorySlotKind::BasicInventory) >= MinCount;
}

UFUNCTION(BlueprintCallable)
mixin bool HasItemOfType(const AGothicCharacter Character, FGameplayTag ItemType, int MinCount = 1)
{
    return Character.Inventory.CountItemsOfType(ItemType) >= MinCount;
}

UFUNCTION(BlueprintCallable)
mixin bool EquipItemOfType(const AGothicCharacter Character, FGameplayTag ItemType)
{
    const UDataModule_Container DataModule_Container = DataModule::GetContainerDataModule(Character);
    int32 slotID = -1;
	EInventoryTypes inventoryType = EInventoryTypes::None;
	TSubclassOf<UItemDefinition> ItemDefinition;

    DataModule_Container.GetFirstItemWithType(ItemType,ItemDefinition, inventoryType,slotID);
    if(!ItemDefinition.IsValid())
        return false;

    return Character.Inventory.EquipItem(inventoryType, slotID);
}

UFUNCTION(BlueprintCallable)
mixin void AddItemToInventory(const AGothicCharacter Character, TSubclassOf<UItemDefinition> Item, int Count = 1, EInventoryTypes inventory = EInventoryTypes::MainContainer)
{
    Character.Inventory.AddItemOfClassInventory(Item, Count, inventory);
}

UFUNCTION(BlueprintCallable)
mixin void RemoveItemFromInventory(const AGothicCharacter Character, TSubclassOf<UItemDefinition> Item, int Count = 1, EInventorySlotKind InventoryKind = EInventorySlotKind::BasicInventory)
{
    Character.Inventory.RemoveItemOfClass(Item, Count, InventoryKind);
}

UFUNCTION(BlueprintCallable)
mixin bool IsCloseToWaypoint(const AGothicCharacter Character, FName WaypointName, float Distance = 10.0f * 100.0f)
{
    FInteractionSpotHandle Spot = FInteractionSpotHandle(WaypointName);

    if (!Spot.IsValid())
        return false;

    return Character.ActorLocation.Distance(Spot.Location) < Distance;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCloseToCharacter(const AGothicCharacterState Character, const AGothicCharacterState Other, float Distance = 10.0f * 100.0f)
{
    if (Other == nullptr)
        return false;

    return Character.GetDistanceTo(Other) < Distance;
}

mixin bool HasDefeated(const AGothicCharacter Character, const AGothicCharacter Other, FInGameTime Aftertime = FInGameTime())
{
    if (Other == nullptr)
        return false;

    if (Character.CharacterState == nullptr)
        return false;

    return Character.CharacterState.HasDefeated(Other.CharacterState, Aftertime);
}


mixin bool WasDefeatedBy(const AGothicCharacter Character, const AGothicCharacter Other, FInGameTime Aftertime = FInGameTime())
{
    if (Other == nullptr)
        return false;

    if (Character.CharacterState == nullptr)
        return false;

    return Character.CharacterState.WasDefeatedBy(Other.CharacterState, Aftertime);
}

mixin bool WasIntentionallyDamagedBy(const AGothicCharacter Character, const AGothicCharacter Other, FInGameTime AfterTime = FInGameTime())
{
    if (Other == nullptr)
        return false;

    if (Character.CharacterState == nullptr)
        return false;

    return Character.CharacterState.WasIntentionallyDamagedBy(Other.CharacterState, AfterTime);
}

UFUNCTION(BlueprintCallable) mixin float32 GetHealthAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Health, n"Health", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxHealthAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Health, n"MaxHealth", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetDamageMultiplierAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Health, n"DamageMultiplier", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetManaAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Mana, n"Mana", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetMaxManaAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Mana, n"MaxMana", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetDexterityAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Dexterity, n"Dexterity", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetStrengthAttribute(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Strength, n"Strength", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetCombatAttribute_OneHandCritical(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Strength, n"Critical_OneHand", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetCombatAttribute_TwoHandCritical(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Strength, n"Critical_TwoHand", Default); }

/** Whether this character is a player character, regardless of being player controlled or not. */
UFUNCTION(BlueprintCallable)
mixin bool IsPlayerCharacter(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;

    return Character.CharacterState.IsPlayerCharacter();
}

/** Whether this character is considered to be human. */
UFUNCTION(BlueprintCallable)
mixin bool IsHuman(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsHuman();
}

/** Whether this character is considered to be an orc. */
UFUNCTION(BlueprintCallable)
mixin bool IsOrc(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsOrc();
}

/** Whether this character is considered to be undead. */
UFUNCTION(BlueprintCallable)
mixin bool IsUndead(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsUndead();
}

/** Whether this character is considered to be a creature. */
UFUNCTION(BlueprintCallable)
mixin bool IsCreature(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsCreature();
}

/** Whether this character is considered the given species */
UFUNCTION(BlueprintCallable)
mixin bool IsSpecies(const AGothicCharacter Character, FGameplayTag Species)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsSpecies(Species);
}

UFUNCTION(BlueprintCallable)
mixin bool IsDead(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsDead();
}

UFUNCTION(BlueprintCallable)
mixin bool IsDefeated(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsDefeated();
}

UFUNCTION(BlueprintCallable)
mixin bool IsInjured(const AGothicCharacter Character, float BelowHealthPercentage = 100.0f)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsInjured(BelowHealthPercentage);
}

UFUNCTION(BlueprintCallable)
mixin bool IsSitting(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsSitting();
}

/** Returns true if the character needs some time until it can do actions again (e.g. when stunned or doing another action) */
UFUNCTION(BlueprintCallable)
mixin bool IsBlocked(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsBlocked();
}

/** Returns true if the character is currently flying */
UFUNCTION(BlueprintCallable)
mixin bool IsFlying(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsFlying();
}

/** Returns true if the character is currently climbing a ladder or a wall */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingLadderOrWall(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsClimbingLadderOrWall();
}

/** Returns true if the character is currently climbing a ladder */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingLadder(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsClimbingLadder();
}

/** Returns true if the character is currently climbing a wall */
UFUNCTION(BlueprintCallable)
mixin bool IsClimbingWall(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.CharacterState.IsClimbingWall();
}

/** Returns true if the character is currently falling */
UFUNCTION(BlueprintCallable)
mixin bool IsFalling(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;
    
    return Character.MovementComponent.IsFalling();
}

/** Returns true if the character is currently on the ground */
UFUNCTION(BlueprintCallable)
mixin bool IsOnTheGround(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;

    if (Character.IsFalling())
        return false;

    if (Character.IsFlying())
        return false;

    return Character.HasGameplayTag(GameplayTag::State_Grounded);
}

/** Returns true if the character is holding their weapon defensively to block incomming attacks. */
UFUNCTION(BlueprintCallable)
mixin bool IsInBlockingStance(const AGothicCharacter Character)
{
    if (!IsValid(Character))
        return false;

    return Character.CharacterState.IsInBlockingStance();
}

/** Returns true if the character has a weapon in their hand. */
UFUNCTION(BlueprintCallable)
mixin bool IsDrawingOrUndrawingWeapon(const AGothicCharacter Character)
{
    if (Character.CharacterState.HasGameplayTag(GameplayTag::State_ItemDraw) && !Character.CharacterState.HasGameplayTag(GameplayTag::State_ItemInHand))
        return true;

    if (!Character.HasDrawnBow() && !Character.HasDrawnCrossbow())
        return false;

    return false;
}

/** Returns true if the character has a weapon in their hand. */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeapon(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_ItemInHand);
}

/** Returns true if the character is in any fighting state */
UFUNCTION(BlueprintCallable)
mixin bool IsInConflictFightingState(const AGothicCharacter Character)
{
    if (!Character.HasGameplayTag(GameplayTag::AIState_Conflict))
        return false;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_Combat))
        return true;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_TurnToAttacker))
        return true;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_Paralyzed))
        return true;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_ReactToTakingDamage))
        return true;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_Flee_GetGuardHelp))
        return true;

    return false;
}

/** Returns true if the character is in any fighting state */
UFUNCTION(BlueprintCallable)
mixin bool IsInConflictWarningState(const AGothicCharacter Character)
{
    if (!Character.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
        return false;

    if (Character.HasGameplayTag(GameplayTag::AIState_Conflict_Warning_BlockedPath))
        return false;
    
    return true;
}

/** Returns true if the character is in combat */
UFUNCTION(BlueprintCallable)
mixin bool IsInCombat(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Combat);
}

/** Returns true if the character is in combat */
UFUNCTION(BlueprintCallable)
mixin bool IsInCombatWithFists(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Combat_Melee_Fist);
}

/** Returns true if the character is currently doing an attack move */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingAttack(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Attack);
}

/** Returns true if the character is currently doing a taunt move */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingTaunt(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Taunt);
}

/** Returns true if the character is currently doing magic (casting, charging, launching or finishing a spell) */
UFUNCTION(BlueprintCallable)
mixin bool IsDoingMagic(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_DoingMagic);
}

/** Returns true if the character is currently aiming at something */
UFUNCTION(BlueprintCallable)
mixin bool IsAiming(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Aiming_Normal);
}

/** Returns true if the character is currently in a conversation */
UFUNCTION(BlueprintCallable)
mixin bool IsInConversation(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Conversation);
}

/** Returns true if the character can dodge right now. This includes both before and after an ongoing attack's damage phase */
UFUNCTION(BlueprintCallable)
mixin bool CanDodgeNow(const AGothicCharacter Character)
{
    return (Character.HasGameplayTag(GameplayTag::State_CanDodge) || !(Character.HasGameplayTag(GameplayTag::State_LockMovement) || Character.HasGameplayTag(GameplayTag::State_Dodge)));
}


/** Returns true if the character is currently holding an item with of the given class. */
UFUNCTION(BlueprintCallable)
mixin bool IsHoldingItemOfClass(const AGothicCharacter Character, TSubclassOf<UItemDefinition> ItemClass)
{
    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return false;

    return Character.CarryComponent.EquippedItemDefinition.IsA(ItemClass);
}

/** Returns true if the character is currently holding an item with of the given class. */
UFUNCTION(BlueprintCallable)
mixin bool IsHoldingItem(const AGothicCharacter Character)
{
    return Character.CarryComponent.EquippedItemDefinition != nullptr;
}

/** Returns true if the character is currently holding a one handed weapon */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeapon1H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponWithSpec(GameplayTag::Item_Grip_OneHand);
}

/** Returns true if the character is currently holding a two handed weapon */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeapon2H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponWithSpec(GameplayTag::Item_Grip_TwoHand);
}

/** Returns true if the character is holding a ranged long weapon */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnRangedWeapon(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponWithSpec(GameplayTag::Item_Range_Long);
}

/** Returns true if the character is currently holding melee weapon */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMeleeWeapon(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponWithSpec(GameplayTag::Item_Range_Melee);
}

/** Returns true if the character is currently holding a weapon of the given class */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeaponOfClass(const AGothicCharacter Character, TSubclassOf<UWeaponDefinition> WeaponClass)
{
    if (WeaponClass == nullptr)
        return true;

    if (!Character.HasDrawnWeapon())
        return false;

    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return false;

    return Character.CarryComponent.EquippedItemDefinition.IsA(WeaponClass);
}

/** Returns true if the character is currently holding a weapon with the given spec tag */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeaponWithSpec(const AGothicCharacter Character, FGameplayTag SpecTag)
{
    if (!Character.HasDrawnWeapon())
        return false;

    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return false;

    return Character.CarryComponent.EquippedItemDefinition.HasItemSpec(SpecTag);
}

/** Returns true if the character is currently holding a weapon of type Spell */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMagicSpell(const AGothicCharacter Character)
{
    if (Character.HasDrawnRune())
        return true;

    if (Character.HasDrawnScroll())
        return true;

    return false;
}

/** Returns true if the character is currently holding a weapon of type Spell */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnRune(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Rune);
}

/** Returns true if the character is currently holding a weapon of type Spell */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnScroll(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Scroll);
}

/** Returns true if the character is currently holding a weapon of the given type */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMagicSpellWithTag(const AGothicCharacter Character, FGameplayTag Type)
{
    return Character.HasDrawnWeaponOfType(Type);
}

/** Returns true if the character is currently holding a spell with the given spec */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMagicSpellWithSpec(const AGothicCharacter Character, FGameplayTag Spec)
{
    if (!Character.HasDrawnRune() || Character.HasDrawnScroll())
        return false;

    if (!Character.HasDrawnWeaponWithSpec(Spec))
        return false;

    return true;
}

/** Returns true if the character is currently holding a weapon of type Torch */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnTorch(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Torch);
}

/** Returns true if the character is currently holding a weapon of type Sword */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnSword(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Sword);
}

/** Returns true if the character is currently holding a weapon of type Sword 1H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnSword1H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Sword_OneHand);
}

/** Returns true if the character is currently holding a weapon of type Sword 1H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnSword2H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Sword_TwoHand);
}

/** Returns true if the character is currently holding a weapon of type Axe */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnAxe(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Axe);
}

/** Returns true if the character is currently holding a weapon of type Axe 1H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnAxe1H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Axe_OneHand);
}

/** Returns true if the character is currently holding a weapon of type Axe 1H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnAxe2H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Axe_TwoHand);
}

/** Returns true if the character is currently holding a weapon of type Crossbow */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnCrossbow(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Crossbow);
}

/** Returns true if the character is currently holding a weapon of type Bow */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnBow(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Bow);
}

/** Returns true if the character is currently holding a weapon of type Mace */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMace(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Mace);
}

/** Returns true if the character is currently holding a weapon of type Mace 1H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMace1H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Mace_OneHand);
}

/** Returns true if the character is currently holding a weapon of type Mace 2H */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnMace2H(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Orc_TwoHand);
}

/** Returns true if the character is currently holding a weapon of type Staff */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnStaff(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Staff);
}

UFUNCTION(BlueprintCallable)
mixin bool HasDrawnFists(const AGothicCharacter Character)
{
    return Character.HasDrawnWeaponOfType(GameplayTag::Item_Weapon_Fist);
}

/** Returns true if the character is currently holding a weapon with the given type tag */
UFUNCTION(BlueprintCallable)
mixin bool HasDrawnWeaponOfType(const AGothicCharacter Character, FGameplayTag TypeTag)
{
    if (!Character.HasDrawnWeapon())
        return false;

    return Character.IsHoldingItemOfType(TypeTag);
}

/** Returns true if the character is currently holding an item with the given type tag */
UFUNCTION(BlueprintCallable)
mixin bool IsHoldingItemOfType(const AGothicCharacter Character, FGameplayTag TypeTag)
{
    if (Character.CarryComponent == nullptr)
        return false;

    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return false;

    return Character.CarryComponent.EquippedItemDefinition.ItemType.MatchesTag(TypeTag);
}

/** Returns the type of the currently drawn weapon or an empty tag if there was none */
UFUNCTION(BlueprintCallable)
mixin FGameplayTag GetDrawnWeaponTypeTag(const AGothicCharacter Character)
{
    if (!Character.HasDrawnWeapon())
        return FGameplayTag::Empty;

    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return FGameplayTag::Empty;

    return Character.CarryComponent.EquippedItemDefinition.ItemType;
}

/** Returns true if the currently drawn item matches the class */
UFUNCTION(BlueprintCallable)
mixin bool IsDrawnItemClass(const AGothicCharacter Character, TSubclassOf<UItemDefinition> ItemDefinitionClass)
{
    if (!Character.HasDrawnWeapon())
        return false;

    if (Character.CarryComponent.EquippedItemDefinition == nullptr)
        return false;

    return Character.CarryComponent.EquippedItemDefinition.IsA(ItemDefinitionClass);
}

/** Returns true if the character has the required skill level to perform combos with the currently drawn weapon */
UFUNCTION(BlueprintCallable)
mixin bool CanDoCombosWithCurrentlyDrawnWeapon(const AGothicCharacter Character)
{
    if (!Character.IsHuman())
        return true;

    return Character.IsCurrentlyDrawnWeaponSkillTrainedOrMaster();
}

/** Returns true if the character has the required skill to perform block with the currently drawn weapon */
UFUNCTION(BlueprintCallable)
mixin bool CanDoBlockWithCurrentlyDrawnWeapon(const AGothicCharacter Character)
{
    if (!Character.HasDrawnMeleeWeapon())
        return false;

    if (!Character.HasAbility(UGA_StanceBlock::StaticClass()))
        return false;

    return true;
}

/** Returns true if the character has the required skill to perform parry with the currently drawn weapon */
UFUNCTION(BlueprintCallable)
mixin bool CanDoParryWithCurrentlyDrawnWeapon(const AGothicCharacter Character)
{
    if (!Character.CanDoBlockWithCurrentlyDrawnWeapon())
        return false;

    if (!Character.IsCurrentlyDrawnWeaponSkillTrainedOrMaster())
        return false;

    return true;
}

/** Returns true if the character has the required skill to perform riposte with the currently drawn weapon */
UFUNCTION(BlueprintCallable)
mixin bool CanDoRiposteWithCurrentlyDrawnWeapon(const AGothicCharacter Character)
{
    if (!Character.CanDoBlockWithCurrentlyDrawnWeapon())
        return false;

    if (!Character.IsCurrentlyDrawnWeaponSkillMaster())
        return false;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCurrentlyDrawnWeaponSkillUntrained(const AGothicCharacter Character)
{
    return !Character.IsCurrentlyDrawnWeaponSkillTrainedOrMaster();
}

UFUNCTION(BlueprintCallable)
mixin bool IsCurrentlyDrawnWeaponSkillTrainedOrMaster(const AGothicCharacter Character)
{
    return Character.IsCurrentlyDrawnWeaponSkillTrained() || Character.IsCurrentlyDrawnWeaponSkillMaster();
}

UFUNCTION(BlueprintCallable)
mixin bool IsCurrentlyDrawnWeaponSkillTrained(const AGothicCharacter Character)
{
    return Character.CarryComponent.GetCurrentWeaponSkill() == EWeaponSkill::Trained;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCurrentlyDrawnWeaponSkillMaster(const AGothicCharacter Character)
{
    return Character.CarryComponent.GetCurrentWeaponSkill() == EWeaponSkill::Master;
}

UFUNCTION(BlueprintCallable)
mixin int GetCurrentlyDrawnWeaponSkillLevel(const AGothicCharacter Character)
{
    FGameplayTag CurrentlyDrawnWeapon = Character.GetDrawnWeaponTypeTag();

    if (!CurrentlyDrawnWeapon.IsValid())
        return 0;
    
    switch(Character.CarryComponent.GetCurrentWeaponSkill())
    {
        case EWeaponSkill::Master:
            return 2;
        case EWeaponSkill::Trained:
            return 1;
        default:
            return 0;
    }
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeOneHandedTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_OneHanded_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeTwoHandedTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsBowTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Ranged_Bow_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsCrossbowTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeOneHandedMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_OneHanded_Master);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeTwoHandedMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_TwoHanded_Master);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeFistsMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_Fists_Master);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeFistsTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_Fists_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeOrcMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_Orc_Master);
}

UFUNCTION(BlueprintCallable)
mixin bool IsMeleeOrcTrained(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Melee_Orc_Trained);
}

UFUNCTION(BlueprintCallable)
mixin bool IsBowMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;

    return Character.HasGameplayTag(GameplayTag::Skill_Ranged_Bow_Master);
}

UFUNCTION(BlueprintCallable)
mixin bool IsCrossbowMaster(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Debuff_WeaponSkill_Untrained))
        return false;
    
    return Character.HasGameplayTag(GameplayTag::Skill_Ranged_Crossbow_Master);
}

/** Returns true if the character is currently channeling a spell */
UFUNCTION(BlueprintCallable)
mixin bool IsChannelingSpell(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Channeling);
}

/** Returns true if the character is currently casting a spell */
UFUNCTION(BlueprintCallable)
mixin bool IsCastingSpell(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Casting);
}

/** Returns false if the character needs some time until it can do actions again (e.g. when stunned or doing another action) */
UFUNCTION(BlueprintCallable)
mixin bool CanMove(const AGothicCharacter Character)
{
    // When in combat, we can exit out of some animations early to move
    if (Character.HasGameplayTag(GameplayTag::State_ResetStates))
        return true;

    return !Character.HasGameplayTag(GameplayTag::State_LockMovement);
}

/** Returns true if the character is currently allowed to move around*/
UFUNCTION(BlueprintCallable)
mixin bool CanWalk(const AGothicCharacter Character)
{
    // if (Character.HasGameplayTag(GameplayTag::Tests_GenericTag_One))
    //     return false;

    return true;
}

/** Returns true if the character doesn't have the tag cantstrafe */
UFUNCTION(BlueprintCallable)
mixin bool CanStrafe(const AGothicCharacter Character)
{
    if (Character.HasGameplayTag(GameplayTag::Character_CantStrafe))
        return false;

    return true;
}

/** Whether the character should run, walk or sprint. */
UFUNCTION(BlueprintCallable)
mixin EWalkSpeed GetWalkSpeed(const AGothicCharacter Character) property
{
    return AIScript::GetWalkSpeed(Character); // TODO: Don't use AIScript
}

/** Returns true if the character is walking */
UFUNCTION(BlueprintCallable)
mixin bool IsWalkSpeedWalking(const AGothicCharacter Character)
{
    return Character.GetWalkSpeed() == EWalkSpeed::Walking;
}

/** Returns true if the character is running */
UFUNCTION(BlueprintCallable)
mixin bool IsWalkSpeedRunning(const AGothicCharacter Character)
{
    return Character.GetWalkSpeed() == EWalkSpeed::Running;
}

/** Returns true if the character is sprinting */
UFUNCTION(BlueprintCallable)
mixin bool IsWalkSpeedSprinting(const AGothicCharacter Character)
{
    return Character.GetWalkSpeed() == EWalkSpeed::Sprinting;
}

/** Returns true if the character has the State.Immunity.SuperArmor tag. */
UFUNCTION(BlueprintCallable)
mixin bool HasImmunitySuperArmorTag(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Immunity_SuperArmor);
}

/** Returns true if the character has any Item.Weapon.Rune tag. */
UFUNCTION(BlueprintCallable)
mixin bool HasAnyRuneTag(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::Item_Weapon_Rune);
}

/** Returns true if the character has a specific rune tag. */
UFUNCTION(BlueprintCallable)
mixin bool HasSpecificRuneTag(const AGothicCharacter Character, FGameplayTag Tag)
{
    if (!Tag.IsValid())
        return false;

    if (!Tag.MatchesTag(GameplayTag::Item_Weapon_Rune))
        return false;

    return Character.HasGameplayTag(Tag);
}

/** Returns true if the character is currently swimming. */
UFUNCTION(BlueprintCallable)
mixin bool IsSwimming(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Swimming);
}

/** Returns true if the character is currently diving. */
UFUNCTION(BlueprintCallable)
mixin bool IsDiving(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Movement_Diving);
}

/** Returns true if the character is currently in shallow water. */
UFUNCTION(BlueprintCallable)
mixin bool IsInShallowWater(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Movement_InWater);
}

/** Returns true if the character is currently frozen. */
UFUNCTION(BlueprintCallable)
mixin bool IsFrozen(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::Debuff_Freeze);
}

/** Returns true if the character is currently shrunk. */
UFUNCTION(BlueprintCallable)
mixin bool IsShrunk(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::Debuff_Shrink);
}

/** Returns true if the character is currently paralized. */
UFUNCTION(BlueprintCallable)
mixin bool IsParalized(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::Debuff_Paralyzed);
}

/** Returns true if the character is currently affected by fear. */
UFUNCTION(BlueprintCallable)
mixin bool IsAffectedByFear(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::Debuff_Fear);
}

/** Returns true if the character has the State.WaitReceiveRiposte tag. */
UFUNCTION(BlueprintCallable)
mixin bool HasWaitReceiveRiposteTag(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_WaitReceiveRiposte);
}

/** Returns true if the character has the State.Block tag. */
UFUNCTION(BlueprintCallable)
mixin bool HasBlockStanceTag(const AGothicCharacter Character)
{
    return Character.HasGameplayTag(GameplayTag::State_Block);
}

/** ---- Relationship ---- */

/** Returns true if the character is friendly towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsFriendlyTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsFriendlyTowards(OtherCharacter.CharacterState);
}

/** Returns true if the character is neutral towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsNeutralTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsNeutralTowards(OtherCharacter.CharacterState);
}

/** Returns true if the character is angry towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsAngryTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsAngryTowards(OtherCharacter.CharacterState);
}

/** Returns true if the character is hostile towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsHostileTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsHostileTowards(OtherCharacter.CharacterState);
}

/** Returns true if the character is enemy towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsEnemyTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsEnemyTowards(OtherCharacter.CharacterState);
}

/** Returns true if the character is protecting OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsProtecting(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(Character) || !IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return false;

    return Character.CharacterState.IsProtecting(OtherCharacter.CharacterState);
}

/** Returns the current Relationship towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin ERelationship GetRelationshipTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return ERelationship::Neutral;

    return Character.CharacterState.GetRelationshipTowards(OtherCharacter.CharacterState);
}

/** Returns the current RelationshipHostility towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin ERelationshipHostility GetHostilityTowards(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!IsValid(OtherCharacter) || !IsValid(Character.CharacterState))
        return ERelationshipHostility::None;

    return Character.CharacterState.GetHostilityTowards(OtherCharacter.CharacterState);
}

/** ---- Level progression ---- */

/** Current level of the character. */
UFUNCTION(BlueprintCallable)
mixin float32 GetLevelAttribute(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Level", 0.0f); }

/** How much experience this character has. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetExperienceAttribute(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Experience", 0.0f); }

/** How many points the character can spend on learning new skills. */
UFUNCTION(BlueprintCallable)
mixin float32 GetSkillpointsAttribute(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"Skillpoints", 0.0f); }

/** Experience points awarded to the character's killers. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetXPKillOrDefeatBountyAttribute(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"XPKillOrDefeatBounty", 0.0f); }

/** Experience points awarded to the character's executed. (Used for levelup) */
UFUNCTION(BlueprintCallable)
mixin float32 GetXPExecutedBountyAttribute(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_LevelProgression::StaticClass(), n"XPExecutedBounty", 0.0f); }

/** ---- Gameplay ---- */

UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_SuperArmor(const AGothicCharacter Character, float32 Default = 0.0f)         { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"SuperArmor", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_MaxSuperArmor(const AGothicCharacter Character, float32 Default = 0.0f)      { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"MaxSuperArmor", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Blunt(const AGothicCharacter Character, float32 Default = 0.0f)   { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Blunt", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Edge(const AGothicCharacter Character, float32 Default = 0.0f)    { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Edge", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Point(const AGothicCharacter Character, float32 Default = 0.0f)   { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Point", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Fire(const AGothicCharacter Character, float32 Default = 0.0f)    { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Fire", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Energy(const AGothicCharacter Character, float32 Default = 0.0f)  { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Energy", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Ice(const AGothicCharacter Character, float32 Default = 0.0f)     { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Ice", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Wind(const AGothicCharacter Character, float32 Default = 0.0f)    { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Wind", Default); }
UFUNCTION(BlueprintCallable) mixin float32 GetArmorAttribute_Resistance_Falling(const AGothicCharacter Character, float32 Default = 0.0f) { return Character.GetAttributeValue(UAttributeSet_Armor::StaticClass(), n"Resistance_Falling", Default); }

UFUNCTION(BlueprintCallable) mixin float32 GetMovementAttribute_SpeedModifier(const AGothicCharacter Character) property { return Character.GetAttributeValue(UAttributeSet_Movement::StaticClass(), n"SpeedModifier", 0.0f); }


/** ---- Skills ---- */

UFUNCTION(BlueprintCallable) mixin float32 GetSkillLevel_PickPocketing(const AGothicCharacter Character) property  { return Character.GetAttributeValue(UAttributeSet_Pickpocketing::StaticClass(), n"PickPocketing", 0.0f); }


/** ---- Internal ---- */

/** Access to the Gothic specialized AbilitySystemComponent.   */
UFUNCTION(BlueprintCallable)
mixin UGothicAbilitySystemComponent GetGothicAbilitySystemComponent(const AGothicCharacter Character) property
{
    return Cast<UGothicAbilitySystemComponent>(Character.AbilitySystemComponent);
}

/** Return the current value of the given AttributeSet/Name. Returns empty if the character had no such attribute. */
UFUNCTION(BlueprintCallable)
mixin float32 GetAttributeValue(const AGothicCharacter Character, TSubclassOf<UAngelscriptAttributeSet> AttributeSetClass, FName AttributeName, float32 Default = 0.0f)
{
    return Character.CharacterState.AbilitySystemComponent.GetAttributeCurrentValue(AttributeSetClass, AttributeName, Default);
}

/** Returns true, if the Character has the given attribute set and attribute. */
UFUNCTION(BlueprintCallable)
mixin bool HasAttribute(const AGothicCharacter Character, TSubclassOf<UAngelscriptAttributeSet> AttributeSetClass, FName AttributeName)
{
    auto ASC = Character.GetGothicAbilitySystemComponent();

    if (ASC == nullptr)
        return false;

    float32 Value;
    return ASC.TryGetAttributeCurrentValue(AttributeSetClass, AttributeName, Value);
}

/** Returns true if the Character is stronger than OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsStrongerThan(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (OtherCharacter.CharacterState.ShouldActCoward())
        return true;

    if (OtherCharacter.CharacterState.ShouldActBrave())
        return false;

    if (Character.GetLevelAttribute() > 2.0f * OtherCharacter.GetLevelAttribute())
        return true;

    return false;
}

/** Sets whether the character should be able to move right now. */
UFUNCTION(BlueprintCallable)
mixin void SetMovementLocked(const AGothicCharacter Character, bool bIsLocked) property
{
    if (bIsLocked)
    {
        Character.AbilitySystemComponent.AddLooseGameplayTag(GameplayTag::State_LockMovement);
    }
    else
    {
        Character.AbilitySystemComponent.RemoveLooseGameplayTag(GameplayTag::State_LockMovement);
    }
}

/** Whether this character is facing OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsFacingOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, Character.ActorForwardVector);
}

/** Whether this character's back is facing OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsBackFacingOtherCharacterDirectly(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, -Character.ActorForwardVector, -0.9f);
}

/** Whether this character is possibly aiming at OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsFacingOtherCharacterDirectly(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, Character.ActorForwardVector, -0.95);
}

/** Whether this character is facing away from OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsFacingAwayFromOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, -Character.ActorForwardVector);
}

/** Whether this character is facing Location */
UFUNCTION(BlueprintCallable)
mixin bool IsFacingLocation(const AGothicCharacter Character, const FVector Location)
{
    return Character.IsCharacterDirectionFacingLocation(Location, Character.ActorForwardVector);
}

/** Whether this character is facing away from Location */
UFUNCTION(BlueprintCallable)
mixin bool IsFacingAwayFromLocation(const AGothicCharacter Character, const FVector Location)
{
    return Character.IsCharacterDirectionFacingLocation(Location, -Character.ActorForwardVector);
}

/** Whether this character is turning towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsTurningTowardsOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, Character.Controller.DesiredRotation.ForwardVector);
}

/** Whether this character is moving towards OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsMovingTowardsOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!Character.IsFacingOtherCharacter(OtherCharacter))
        return false;

    if (!Character.IsMoving())
        return false;

    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, Character.Velocity.UnsafeNormal);
}

/** Whether this character is moving away from OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsMovingAwayFromOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    if (!Character.IsFacingAwayFromOtherCharacter(OtherCharacter))
        return false;

    if (!Character.IsMoving())
        return false;

    return Character.IsCharacterDirectionFacingOtherCharacter(OtherCharacter, -Character.Velocity.UnsafeNormal);
}

/** Whether the given direction is facing this character */
UFUNCTION(BlueprintCallable)
mixin bool IsCharacterDirectionFacingOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter, const FVector Direction, float EnemyFacingDotLimit = -0.45f)
{
    /**
     * -1    Enemy is looking is dead in the eye,
     * -0.5  Enemy is looking at an angle of 45° to one of our sides
     *  0    Enemy is looking at an angle of 90° to one of our sides
     *  0.5  Enemy is turned away from us at 45°
     *  1.0  Enemy's back faces us
     * */

    if (OtherCharacter == nullptr)
        return false;

    return Character.IsCharacterDirectionFacingLocation(OtherCharacter.ActorLocation, Direction, EnemyFacingDotLimit);
}

/** Whether the given direction is facing this location */
UFUNCTION(BlueprintCallable)
mixin bool IsCharacterDirectionFacingLocation(const AGothicCharacter Character, const FVector Location, const FVector Direction, float EnemyFacingDotLimit = -0.45f)
{
    /**
     * -1    Enemy is looking is dead in the eye,
     * -0.5  Enemy is looking at an angle of 45° to one of our sides
     *  0    Enemy is looking at an angle of 90° to one of our sides
     *  0.5  Enemy is turned away from us at 45°
     *  1.0  Enemy's back faces us
     * */

    FVector DirectionOtherCharacterToSelf = (Character.ActorLocation - Location).GetSafeNormal2D();

    return Direction.GetSafeNormal2D().DotProduct(DirectionOtherCharacterToSelf) < EnemyFacingDotLimit;
}

/**
* Outputs the character relative direction (Forward, Back, Right, Left) that is closest to given direction
* Will normalize input direction and output normalized direction
* */
UFUNCTION(BlueprintCallable)
mixin FVector GetClosestRelativeCharacterDirection(const AGothicCharacter Character, FVector Direction)
{
    FVector Direction2D = Direction.GetSafeNormal2D();

    FVector AvatarForward = Character.ActorForwardVector;
    FVector AvatarRight = Character.ActorRightVector;

    const float DotForward = Direction2D.DotProduct(AvatarForward);
	const float DotBackward = Direction2D.DotProduct(-AvatarForward);
	const float DotRight = Direction2D.DotProduct(AvatarRight);
	const float DotLeft = Direction2D.DotProduct(-AvatarRight);

	const float MaxDot = Math::Max(DotForward, Math::Max(DotBackward, Math::Max(DotLeft, DotRight)));

    if (MaxDot == DotForward)
	{
		return AvatarForward;
	}
	else if (MaxDot == DotRight)
	{
		return AvatarRight;
	}
	else if (MaxDot == DotLeft)
	{
		return -AvatarRight;
	}
	else
	{
		return -AvatarForward;
	}
}

/** Whether the character is looking at another character (within tolerance) */
UFUNCTION(BlueprintCallable)
mixin bool IsLookingAtOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter, float DistanceTolerance = 250.0f)
{
    if (Character.GetVisionLineDistanceToOtherCharacter(OtherCharacter) <= DistanceTolerance)
        return true;

    return false;
}

/** Whether the character is looking at another character (within tolerance) */
UFUNCTION(BlueprintCallable)
mixin float GetVisionLineDistanceToOtherCharacter(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    float DistanceToOtherCharacter = Character.Controller.ActorLocation.Distance(OtherCharacter.ActorLocation);
    FVector VisionLineStartPoint = Character.Controller.ActorLocation;
    FVector VisionLineEndPoint = VisionLineStartPoint + Character.Controller.ActorForwardVector * 2.0f * DistanceToOtherCharacter;

    FVector OtherCharacterSegmentBottom = OtherCharacter.FeetLocation;
    FVector OtherCharacterSegmentTop = OtherCharacterSegmentBottom + OtherCharacter.ActorUpVector * 2.0f * OtherCharacter.SimpleCollisionHalfHeight;

    FVector VisionLineClosestPoint;
    FVector OtherCharacterSegmentClosestPoint;
    Math::FindNearestPointsOnLineSegments(VisionLineStartPoint, VisionLineEndPoint, OtherCharacterSegmentBottom, OtherCharacterSegmentTop, VisionLineClosestPoint, OtherCharacterSegmentClosestPoint);

    return VisionLineClosestPoint.Distance(OtherCharacterSegmentClosestPoint);
}

/** Get the character's turning rate (degs/s) */
UFUNCTION(BlueprintCallable)
mixin float GetTurningRate(const AGothicCharacter Character)
{
    return Character.GothicMovementComponent.RotationRate.Yaw;
}

/** Get the character's turning radius */
UFUNCTION(BlueprintCallable)
mixin float GetTurningRadius(const AGothicCharacter Character)
{
    return 360.0f * Character.GothicMovementComponent.MaxSpeed / (Character.GetTurningRate() * (2 * PI));
}

/** Whether this character is moving */
UFUNCTION(BlueprintCallable)
mixin bool IsMoving(const AGothicCharacter Character)
{
    return !FVector(Character.Velocity.X, Character.Velocity.Y, 0).IsNearlyZero();
}

UFUNCTION(BlueprintCallable)
mixin bool IsPathfollowing(const AGothicCharacter Character)
{
    return Character.GetPathfollowingStatus() == EPathFollowingStatus::Moving 
        || Character.GetPathfollowingStatus() == EPathFollowingStatus::Paused; // paused means there is a path, but we temporary dont follow it. Used for NavLinks
}

UFUNCTION(BlueprintCallable)
mixin bool IsPathfollowingStanding(const AGothicCharacter Character)
{
    return Character.GetPathfollowingStatus() != EPathFollowingStatus::Moving;
}

/** Returns true if the character can currently use the spell */
UFUNCTION(BlueprintCallable)
mixin bool CanUseSpell(const AGothicCharacter Character, const USpellContainer Spell, bool bConsiderMana = true)
{
    if (Spell.IsA(UScrollSpellContainer::StaticClass()))
        return true;

    if(!Character.CanCastSpell(Spell.ItemType))
        return false;
    
    //TODO: Check mana requirements of spell

    if (Character.GetManaAttribute() <= 0.0f)
        return false;

    return true;
}

/** Will the given direction lead away from the attacker and allows we to move on NavMesh only? */
mixin bool CanDodgeIntoDirection(const AGothicCharacter Character, FVector Direction, float Distance, const AGothicCharacter Attacker)
{
    FVector SelfToAttackerDirection = Attacker.ActorLocation - Character.GetActorLocation();
    FVector RelativeDirectionToAttacker = Character.GetClosestRelativeCharacterDirection(SelfToAttackerDirection);
    FVector RelativeDodgeDirection = Character.GetClosestRelativeCharacterDirection(Direction);

    // the requested direction would make me dodge towards the attacker
    if (RelativeDirectionToAttacker == RelativeDodgeDirection)
        return false;

    FVector HitLocation;
    return UNavigationSystemV1::CanMoveInDirection(Character, Character.GetFeetLocation(), RelativeDodgeDirection, Distance) &&
           UCharacterPersonalSpaceSubsystem::CanMoveStraightInDirection(Character.CharacterState.Character, RelativeDodgeDirection, Distance, HitLocation);
}

/** get the character this character is directly facing*/
UFUNCTION(BlueprintCallable)
mixin AGothicCharacter GetCharacterThisCharacterIsDirectlyFacing(const AGothicCharacter Character)
{
    // Replace with sensed characters array
    TArray<AGothicCharacter> ActorsFound = Character.Perception.GetAllSensedCharacters(FGameplayTagContainer(), FGameplayTagContainer());

    AGothicCharacter ClosestCharacter = nullptr;

    for (auto OtherCharacter : ActorsFound)
    {
        if (!Character.IsFacingOtherCharacterDirectly(OtherCharacter))
            continue;

        if (ClosestCharacter == nullptr)
        {
            ClosestCharacter = OtherCharacter;
            continue;
        }

        if (Character.GetDistanceTo(ClosestCharacter) >= Character.GetDistanceTo(OtherCharacter))
            continue;

        ClosestCharacter = OtherCharacter;
    }

    return ClosestCharacter;
}

/** get the character this character is facing */
UFUNCTION(BlueprintCallable)
mixin AGothicCharacter GetCharacterThisCharacterIsLookingAt(const AGothicCharacter Character)
{
    auto TargetCharacter = Cast<AGothicCharacter>(Character.GetTargetedActor());
    if (TargetCharacter != nullptr)
        return TargetCharacter;

    auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius2D(AGothicCharacter::StaticClass(), Character.NavAgentLocation, 2500.0f);

    float SmallestPercentDistance = 1.0f;
    AGothicCharacter CharacterClosestToVisionLine;

    float MinDistance = 100.0f;
    float MinTolerance = 100.0f;
    float MaxDistance = 2000.0f;
    float MaxTolerance = 350.0f;

    for (auto OtherActor : Actors)
    {
        auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);

        if (!IsValid(OtherCharacter))
            continue;
        
        if (OtherCharacter == Character)
            continue;
        
        float CharacterDistance = Character.ActorLocation.Distance(OtherCharacter.ActorLocation);
        float Incline = (MaxTolerance - MinTolerance) / (MaxDistance - MinDistance);
        float CalculatedTolerance = Incline * CharacterDistance;

        float MaxDistanceFromVisionLine = Math::Clamp(CalculatedTolerance, MinTolerance, MaxTolerance);
        float DistanceFromVisionLine = Character.GetVisionLineDistanceToOtherCharacter(OtherCharacter);
        float PercentDistance = DistanceFromVisionLine / MaxDistanceFromVisionLine;

        if ( PercentDistance >= SmallestPercentDistance)
            continue;

        CharacterClosestToVisionLine = OtherCharacter;
        SmallestPercentDistance = PercentDistance;
    }

    return CharacterClosestToVisionLine;
}

/** Returns true if the Character is currently perceiving OtherCharacter */
UFUNCTION(BlueprintCallable)
mixin bool IsCurrentlyPerceiving(const AGothicCharacter Character, const AGothicCharacter OtherCharacter)
{
    return Character.Perception.CanSense(OtherCharacter);
}

UFUNCTION(BlueprintCallable)
mixin TSet<AGothicCharacter> GetCharactersWithTagTargetingThisCharacterInCombat(const AGothicCharacter Character, FGameplayTag OtherTagRequired = FGameplayTag::Empty)
{
    TSet<AGothicCharacter> Characters;

    for (auto Group : UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Combat::StaticClass()))
    {
        auto CombatGroup = Cast<UAIGroup_Combat>(Group);
        if (CombatGroup == nullptr)
            continue;

        if (CombatGroup.TargetEnemy != Character)
            continue;

        if (!OtherTagRequired.IsValid())
        {
            Characters.Append(CombatGroup.JoinedCharacters);
        }
        else
        {
            for (auto Other : CombatGroup.JoinedCharacters)
            {
                if (OtherTagRequired.IsValid() && !Other.HasGameplayTag(OtherTagRequired))
                    continue;

                Characters.Add(Other);
            }
        }
    }

    return Characters;
}

UFUNCTION(BlueprintCallable)
mixin bool IsAnyCharacterWithTagTargetingThisCharacterInCombat(const AGothicCharacter Character, FGameplayTag OtherTagRequired = FGameplayTag::Empty)
{
    for (auto Group : UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_Combat::StaticClass()))
    {
        auto CombatGroup = Cast<UAIGroup_Combat>(Group);

        if (CombatGroup == nullptr)
            continue;

        if (CombatGroup.TargetEnemy != Character)
            continue;

        if (!CombatGroup.JoinedCharacters.IsEmpty() && !OtherTagRequired.IsValid())
        {
            // No need to iterate group members if we don't care about any tags
            return true;
        }

        for (auto Other : CombatGroup.JoinedCharacters)
        {
            if (!Other.HasGameplayTag(OtherTagRequired))
                continue;

            return true;
        }
    }

    return false;
}


UFUNCTION(BlueprintCallable)
mixin bool IsBeingTargetedInCombat(const AGothicCharacter Character)
{
    return Character.IsAnyCharacterWithTagTargetingThisCharacterInCombat();
}

UFUNCTION(BlueprintCallable)
mixin bool IsBeingTargetedByCreatureInCombat(const AGothicCharacter Character)
{
    return Character.IsAnyCharacterWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature);
}

UFUNCTION(BlueprintCallable)
mixin bool IsBeingTargetedInTrainingFight(const AGothicCharacter Character)
{
    return Character.CharacterState.IsInTrainingFight();
}

UFUNCTION(BlueprintCallable)
mixin bool IsCarnivoreCreature(const AGothicCharacter Character)
{
    auto Carnivores = FGameplayTagContainer();
    Carnivores.AddTag(GameplayTag::Species_Creature_Biter);
    Carnivores.AddTag(GameplayTag::Species_Creature_Orcdog);
    Carnivores.AddTag(GameplayTag::Species_Creature_Swampshark);
    Carnivores.AddTag(GameplayTag::Species_Creature_Razor);
    Carnivores.AddTag(GameplayTag::Species_Creature_Lizard);
    Carnivores.AddTag(GameplayTag::Species_Creature_Snapper);
    Carnivores.AddTag(GameplayTag::Species_Creature_Wolf);
    Carnivores.AddTag(GameplayTag::Species_Creature_Bloodhound);
    Carnivores.AddTag(GameplayTag::Species_Creature_Biter);
    Carnivores.AddTag(GameplayTag::Species_Creature_Minecrawler);

    return Character.CharacterState.Species.MatchesAny(Carnivores);
}

UFUNCTION(BlueprintCallable)
mixin bool IsOmnivoreCreature(const AGothicCharacter Character)
{
    auto Omnivores = FGameplayTagContainer();
    Omnivores.AddTag(GameplayTag::Species_Creature_Scavenger);

    return Character.CharacterState.Species.MatchesAny(Omnivores);
}

UFUNCTION(BlueprintCallable)
mixin UAIState_Combat_G1R GetCombatAIState(AGothicCharacter Character)
{
    auto AI = Character.GetCharacterAI();

    if (!IsValid(AI))
        return nullptr;

    return AI.FindActiveStateByClass(UAIState_Combat_G1R);
} 

UFUNCTION(BlueprintCallable)
mixin bool IsInConflict(const AGothicCharacter Character)
{
    auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
    for (auto Group : Groups)
    {
        auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
        if (!IsValid(ConflictGroup))
            continue;

        if (!ConflictGroup.IsCharacterInvolved(Character))
            continue;

        return true;
    }

    return false;
}

UFUNCTION(BlueprintCallable)
mixin UAIGroup_ConflictInstance GetConflictGroup(const AGothicCharacter Character)
{
    auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
    for (auto Group : Groups)
    {
        auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
        if (!IsValid(ConflictGroup))
            continue;

        if (!ConflictGroup.IsCharacterInvolved(Character))
            continue;

        return ConflictGroup;
    }

    return nullptr;
}

/** Returns true if the hair state phase of that character is greater than the Amount parameter */
UFUNCTION(BlueprintCallable)
mixin bool IsCurrentHairstylePhaseGreaterThan(const AGothicCharacter Character, int Amount)
{    
    return Character.CharacterVisualsComponent.GetCurrentHairPhase() > Amount;   
}
