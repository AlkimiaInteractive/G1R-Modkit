UCLASS()
class UGE_Golem : UGE_Character_Definition
{
    
    //default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Burn);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Electrified);
    //causing more problems than it solves (avoiding entering into geometry). Ice golem rocks can be pushed far.
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_KeepCollisionsWhenDead);

    default AddAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

class UGE_Golem_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

UCLASS()
class UGE_Golem_AI : UGE_Golem
{
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
}

UCLASS()
class UGE_Golem_Player : UGE_Golem
{
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    
}

UCLASS()
class UGE_Golem_Fire_AI : UGE_Golem_AI
{
    //default AddAbility(UGA_Golem_RestoreHealth::StaticClass());
    //default AddAbility(UGA_FireGolem_SpecialState_Heated::StaticClass());
    //default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    //default AddAbility(UGA_BreakSuperArmor_FireGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_FireGolem_EnvironmentAttack_ArenaLavaStreams::StaticClass());
    default AddAbility(UGA_FireGolem_EnvironmentAttack_ArenaFloorSinking::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor_ELementalGolems::StaticClass());
    default AddAbility(UGA_GolemFire_FX_Sizzle::StaticClass());

    
}

UCLASS()
class UGE_Golem_Fire_Player : UGE_Golem_Player
{
    default AddAbility(UGA_FireGolem_SpecialState_Heated::StaticClass());
    default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    default AddAbility(UGA_BreakSuperArmor_FireGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_GolemFire_FX_Sizzle::StaticClass());
}

UCLASS()
class UGE_Golem_Ice_AI : UGE_Golem_AI
{
    //default AddAbility(UGA_IceGolem_SpecialState_SummonMiniGolem::StaticClass());
    //default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    //default AddAbility(UGA_Golem_RestoreHealth::StaticClass());
    default AddAbility(UGA_BreakSuperArmor_IceGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems::StaticClass());
    default AddAbility(UGA_GolemIce_FX_Crackle::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor_ELementalGolems::StaticClass());
}

UCLASS()
class UGE_MiniGolem_Ice_AI : UGE_Golem_AI
{
    //default AddAbility(UGA_IceGolem_SpecialState_SummonMiniGolem::StaticClass());
    //default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ScaledDown);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default TargetTagsComponent.InheritableGrantedTagsContainer.RemoveTag(GameplayTag::Character_KeepCollisionsWhenDead);
    default AddAbility(UGA_BreakSuperArmor_IceGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    //default AddAbility(UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems::StaticClass());
    default RemoveAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGA_GolemIce_FX_Crackle::StaticClass());
}

UCLASS()
class UGE_Golem_Ice_Player : UGE_Golem_Player
{
    //default AddAbility(UGA_IceGolem_SpecialState_SummonMiniGolem::StaticClass());
    //default RemoveAbility(UGA_BreakSuperArmor::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default AddAbility(UGA_BreakSuperArmor_IceGolem::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_IceGolem_EnvironmentAttack_ActivateMiniGolems::StaticClass());
    default AddAbility(UGA_GolemIce_FX_Crackle::StaticClass());
}

UCLASS()
class UGE_MiniGolem_Ice_Player : UGE_Golem_Player
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ScaledDown);
    default AddAbility(UGA_GolemIce_FX_Crackle::StaticClass());
}

UCLASS()
class UGE_Golem_Stone_AI : UGE_Golem_AI
{
    //default AddAbility(UGA_Golem_RestoreHealth::StaticClass());
    default AddAbility(UGA_Summon_Golem::StaticClass());
    default AddAbility(UGA_GolemStone_FX_Crackle::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    
}

UCLASS()
class UGE_Golem_Stone_Bridge_AI : UGE_Golem_AI
{
    default AddAbility(UGA_GolemStone_FX_Crackle::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
}

UCLASS()
class UGE_BridgeGolem_Dormant : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Dormant);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);
}

UCLASS()
class UGE_Golem_Stone_Summon_AI : UGE_Golem_AI
{
    default AddAbility(UGA_Summon_Golem::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
    default AddAbility(UGA_GolemStone_FX_Crackle::StaticClass());
    default RemoveAbility(UGA_BossHealthBar::StaticClass());

}

UCLASS()
class UGE_Golem_Stone_Player : UGE_Golem_Player
{
    default AddAbility(UGA_GolemStone_FX_Crackle::StaticClass());
}