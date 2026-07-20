class UGE_Weapon_Equip : UGameplayEffect_AbilitySet
{
    //default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    //default AddAbility(UGameplayAbilityRoll::StaticClass());
    //default AddAbility(UGameplayAbilityTaunt::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat);
}

class UGE_Weapon_Equip_Swimming : UGameplayEffect_AbilitySet
{
    // Commented out: player can only throw quick punches while swimming.
    //default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    //default AddAbility(UGameplayAbilityRoll::StaticClass());
    //default AddAbility(UGameplayAbilityTaunt::StaticClass());

    // Commented out: do NOT enter State_Combat while swimming as this may conflict with other systems (ex: sprinting)
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Aggressive);
}

class UGE_Weapon_Melee_Equip : UGE_Weapon_Equip
{
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGA_StanceBlock::StaticClass(), EAbilityInputID::Block);
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGA_Parry::StaticClass());
    default AddAbility(UGameplayAbilityAttackRiposte::StaticClass());
    default AddAbility(UGA_Deflected::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);
}

class UGE_Weapon_Melee_Equip_Swimming : UGE_Weapon_Equip_Swimming
{
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());

    // Commented out: player can only throw quick punches while swimming.
    // default AddAbility(UGA_StanceBlock::StaticClass(), EAbilityInputID::Block);
    // default AddAbility(UGA_Parried::StaticClass());
    // default AddAbility(UGA_Parry::StaticClass());
    // default AddAbility(UGA_Deflected::StaticClass());

    // Commented out: do NOT enter State_Combat while swimming as this may conflict with other systems (ex: sprinting)
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);
}

class UGE_Weapon_Ranged_Equip : UGE_Weapon_Equip
{
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Archery);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Aggressive);
}

class UGE_Weapon_Melee_Equip_WatchFight : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Aggressive);
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_PreferStrafe);
}