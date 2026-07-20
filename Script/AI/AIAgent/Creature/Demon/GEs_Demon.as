UCLASS()
class UGE_Demon: UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_NoCorpse);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    // default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGA_Fly_Demon::StaticClass(), EAbilityInputID::JumpAction);
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_NoDeathEffect::StaticClass());

}


UCLASS()
class UGE_Demon_AI : UGE_Demon
{
    default AddAbility(UGameplayAbilityPick::StaticClass());

    FConditionalGameplayEffect conditionalSummonGE;
	default conditionalSummonGE.EffectClass = UGE_SummonedNotVisible::StaticClass(); 
	default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalSummonGE);
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

UCLASS()
class UGE_Demon_Player : UGE_Demon
{
}

class UGE_Demon_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge_Flying::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

UCLASS()
class UGE_Demon_Fire_AI : UGE_Demon_AI
{
    default AddAbility(UGA_Summon_FireDemon::StaticClass());
    default AddAbility(UGA_FireDemon_FX_Sizzle::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
}


UCLASS()
class UGE_Demon_Fire_Player : UGE_Demon_Player
{
}

UCLASS()
class UGE_Demon_Lesser_AI : UGE_Demon_AI
{
    default AddAbility(UGA_Summon_LesserDemon::StaticClass());
    default AddAbility(UGA_LesserDemon_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Demon_Lesser_AI_Kasorg : UGE_Demon_AI
{
    default AddAbility(UGA_Summon_LesserDemon_Kasorg::StaticClass());
}

UCLASS()
class UGE_Demon_Lesser_AI_Xardas : UGE_Demon_Lesser_AI
{
    default AddAbility(UGA_Demon_Lesser_ForceConversation::StaticClass());
    default AddAbility(UGA_Demon_Lesser_Conversation::StaticClass());
    default AddAbility(UGA_Demon_Lesser_Speak::StaticClass());
    default AdditionalEffects.OnApplicationGameplayEffects.Empty();
}

UCLASS()
class UGE_Demon_Lesser_Player : UGE_Demon_Player
{
}

UCLASS()
class UGE_Demon_Lord_AI : UGE_Demon_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default AddAbility(UGA_Summon_LordDemon::StaticClass());
    default AddAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
}

UCLASS()
class UGE_Demon_Lord_Player : UGE_Demon_Player
{
}