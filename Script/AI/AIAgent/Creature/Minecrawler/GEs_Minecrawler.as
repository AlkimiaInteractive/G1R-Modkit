
UCLASS()
class UGE_Minecrawler : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());

    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    
    default AddAbility(UGameplayAbilityWallWalking::StaticClass());
}

class UGE_Minecrawler_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

UCLASS()
class UGE_Minecrawler_AI : UGE_Minecrawler
{
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Nymph_AI : UGE_Minecrawler_AI
{
    default AddAbility(UGameplayAbilityEatItem);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ScaledDown);
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
}
UCLASS()
class UGE_Minecrawler_Nymph_Queen_AI : UGE_Minecrawler_Nymph_AI
{
    default AddAbility(UGA_Queen_Summon_Nymph::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Player : UGE_Minecrawler
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    
    default AddAbility(UGA_UnTransform_Minecrawler::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
}

UCLASS()
class UGE_Minecrawler_Nymph_Player : UGE_Minecrawler_Player
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_ScaledDown);
}

UCLASS()
class UGE_Minecrawler_Temple_AI : UGE_Minecrawler_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default AddAbility(UGameplayAbilityEatItem);
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Warrior_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Temple_Sleeper_AI : UGE_Minecrawler_Temple_AI
{
    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Temple_Player : UGE_Minecrawler_Player
{
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Warrior_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Queen_AI : UGE_Minecrawler_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_LockMovement);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_KeepCollisionsWhenDead);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Electrified);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default BlockAbilityTagsComponent.InheritableBlockedAbilityTagsContainer.AddTag(GameplayTag::Ability_Hit_BreakArmorHit);

    default AddAbility(UGA_EnvironmentAttack_SummonNymph_Queen::StaticClass());
    default AddAbility(UGA_MCQueenLockMovementAbility::StaticClass());
    default AddAbility(UGA_Minecrawler_Queen_HealthMonitor::StaticClass());
    default AddAbility(UGA_MCQueenPhaseChangeHit::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    default AddAbility(UGA_BossHealthBar::StaticClass());
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Queen_FX_Ambient::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

class UGE_Minecrawler_Queen_AI_Ph2 : UGE_Minecrawler_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_KeepCollisionsWhenDead);
    
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Electrified);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default AddAbility(UGA_EnvironmentAttack_SummonNymph_Queen_Ph2::StaticClass());
    default AddAbility(UGA_Minecrawler_Queen_Phase2_FightManager::StaticClass());
    default AddAbility(UGA_BossHealthBar_MCQueen_PH2::StaticClass());
    //default AddAbility(UGA_Minecrawler_Queen_PH2_HealthMonitor::StaticClass());
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Queen_FX_Ambient::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}


UCLASS()
class UGE_Minecrawler_Queen_Player : UGE_Minecrawler_Player
{
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Queen_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Warrior_AI : UGE_Minecrawler_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default AddAbility(UGameplayAbilityEatItem);
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Warrior_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Minecrawler_Warrior_Player : UGE_Minecrawler_Player
{
    default RemoveAbility(UGA_Minecrawler_FX_Ambient::StaticClass());
    default AddAbility(UGA_Minecrawler_Warrior_FX_Ambient::StaticClass());
}

UCLASS()
class UGA_Queen_Summon_Nymph : UGA_Summon_NotVisible
{
    default m_PlayRate = 1.f;
    default m_SummonAnimations.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Nymph/A_MCrawler_Emerge_Montage.A_MCrawler_Emerge_Montage'"));
   
}

UCLASS()
class ASH_QueenNymphSpawnerVisual : ACreatureSummonVisual
{
   default m_ConfigClass = USpellConfig_SummonNymph_Queen::StaticClass();

}

UCLASS()
class ASH_QueenNymphSpawnerVisual_Ph2 : ACreatureSummonVisual
{
   default m_ConfigClass = USpellConfig_SummonNymph_Queen::StaticClass();

}

UCLASS()
class USpellConfig_SummonNymph_Queen : UGenericSummonCreatureByTime
{
    default m_SpawnPeriodTime = 12.f;
    default m_MaxSpawnCount = 4.f;

	//default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_GolemIce::StaticClass();
    default m_CharacterToSpawn.m_SpawnAIAgentDefinition = USpawnAIAgentDefinition_Minecrawler_Nymph_Queen::StaticClass();
    //default m_CharacterToSpawn.m_DailyRoutine = UAIState_DailyRoutine_FollowOwner::StaticClass();

    default m_SummonedEffect = UGE_Summoned_Skeletons_SH_Zombie::StaticClass();

}