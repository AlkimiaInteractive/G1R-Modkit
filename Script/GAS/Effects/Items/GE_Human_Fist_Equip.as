
class UGE_Fist_Equip : UGE_Weapon_Melee_Equip
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Aggressive);
}

class UGE_Fist_Equip_Swimming : UGE_Weapon_Melee_Equip_Swimming
{
    // Commented out: do NOT enter State_Combat while swimming as this may conflict with other systems (ex: sprinting)
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default AddAbility(UGA_EnsureWeapon_Swimming::StaticClass());
}

class UGE_Fist_Equip_WaterWalking : UGE_Weapon_Melee_Equip_Swimming
{
    // Commented out: do NOT enter State_Combat while swimming as this may conflict with other systems (ex: sprinting)
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default AddAbility(UGA_EnsureWeapon_WaterWalking::StaticClass());
}


class UGA_EnsureWeapon_WaterWalking : UGameplayAbilityEnsureWeaponUnequipped
{
    default m_TagToCheck = GameplayTag::State_InWater;
}

class UGA_EnsureWeapon_Swimming : UGameplayAbilityEnsureWeaponUnequipped
{
    default m_TagToCheck = GameplayTag::State_Swimming;
}