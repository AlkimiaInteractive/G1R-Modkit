UCLASS(Abstract)
class UPersonalRelationshipModifier_Guards : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default Weight = 4.0f;
}

UCLASS()
class UPersonalRelationhipModifier_OldMineGuardSupervisor : UPersonalRelationshipModifier_Guards
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Supervisor);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Role_Subordinate);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Role_Guard_OM_Diggers);

    default SetRelativeRankTowardsOther(ERelationshipRelativeRank::LowerThanMe);
}

UCLASS()
class UPersonalRelationhipModifier_OldMineGuardSubordinate : UPersonalRelationshipModifier_Guards
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Subordinate);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Role_Supervisor);

    default SetRelativeRankTowardsOther(ERelationshipRelativeRank::HigherThanMe);
}

UCLASS()
class UPersonalRelationhipModifier_OldMineDiggerGuard : UPersonalRelationshipModifier_Guards
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Guard_OM_Diggers);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Role_Supervisor);

    default SetRelativeRankTowardsOther(ERelationshipRelativeRank::HigherThanMe);
}

UCLASS()
class UPersonalRelationhipModifier_NamelessGuard : UPersonalRelationshipModifier_Guards
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Role_Nameless);

    default SetRelativeRankTowardsOther(ERelationshipRelativeRank::HigherThanMe);
}

UCLASS()
class UPersonalRelationhipModifier_NamedGuard : UPersonalRelationshipModifier_Guards
{
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Role_Nameless);

    default SetRelativeRankTowardsOther(ERelationshipRelativeRank::HigherThanMe);
}