//Fire Demon moves

UCLASS()
class UCM_Attack_Demon_Lord_HellArms_Breach : UCM_Attack_Extra01
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}

UCLASS()
class UCM_Attack_Demon_Lord_Flamethrower : UCM_Attack_Extra02
{
    default OwnedTagsToAddWhileActive.AddTag(GameplayTag::AICombatMove_CastSpell);
}