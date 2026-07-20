UCLASS(meta=(DisplayName="Weapons Allowed In Region"))
class URegionTrait_WeaponsAllowed : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::RegionTraits_Permissions_Weapons_Allowed);
}

UCLASS(meta=(DisplayName="Weapons Banned In Region"))
class URegionTrait_WeaponsBanned : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::RegionTraits_Permissions_Weapons_Banned);
}

UCLASS(meta=(DisplayName="Fists Allowed In Region"))
class URegionTrait_FistsAllowed : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::RegionTraits_Permissions_Fists_Allowed);
}

UCLASS(meta=(DisplayName="Fists Banned In Region"))
class URegionTrait_FistsBanned : UOwnedTagRegionTrait
{
    default TagsToApplyOnEnter.AddTag(GameplayTag::RegionTraits_Permissions_Fists_Banned);
}