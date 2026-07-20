UCLASS()
class UEnvironment_LavaDefinitionBase : UWeaponDefinition
{
	default m_Name = "Environment_LavaDefinitionBase";

	default m_HitEffect = UGE_EnvironmentLavaDamage::StaticClass();
	default SetItemType(GameplayTag::Item_Weapon_Environment);

	default m_SuperArmorDamageBase = 0.0f;

	UPROPERTY()
    TSoftClassPtr<AActor> m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_ItemToLava_Explosion.BP_ItemToLava_Explosion_C'";
	
	UPROPERTY()
    TSoftClassPtr<AActor> m_HumanExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_HumanToLava_Explosion.BP_HumanToLava_Explosion_C'";

}

UCLASS()
class UEnvironment_LavaDefinition : UEnvironment_LavaDefinitionBase
{
	default m_Name = "Environment_LavaDefinition";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 10.f);
}

UCLASS()
class UEnvironment_LavaLowDefinition : UEnvironment_LavaDefinitionBase
{
	default m_Name = "Environment_LavaDefinition";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.f);
}

class UGE_EnvironmentLavaDamage : UGE_Damage_Fire_Infinite
{
	default Executions.Empty();
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass(), true));
	//default m_ForceOverflowElementalEffectStack = true;
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
	default Period.Value = 0.1f; 

	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_InLava);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_BlockConversation);

	// Class that contains the damage formula and logic
	FGameplayEffectExecutionDefinition DefByPercentage;
	default DefByPercentage.CalculationClass = UGE_Ex_Damage_EnvironmentLavaByPercentage::StaticClass();

	default Executions.Add(DefByPercentage);
}


class UGE_Ex_Damage_EnvironmentLavaByPercentage : UGE_Ex_Damage
{

	bool GetIsGodModeForPlayer(const UCombatConfig& combatConfig,
							   UGothicAbilitySystemComponent targetAbComp, bool bIsImmortal) const override
	{
		return false;
	}
	
	float GetCalculatedDamage(UGothicAbilitySystemComponent SourceAbComp, UGothicAbilitySystemComponent TargetAbComp, TMapIterator<FGameplayTag, float32> Entry,
                              FGameplayEffectSpec Spec, UWeaponDefinition WeaponUsed) const override
    {
        auto weaponDefinitionByPercentage = Cast<UEnvironment_LavaDefinitionBase>(WeaponUsed);
        if(weaponDefinitionByPercentage == nullptr)
            return Entry.Value;
        
        bool success = false;
     
        FGameplayAttribute maxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");
        float maxTargetHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(TargetAbComp, maxValueAttribute, success);
        FGameplayAttribute resistanceAttr = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Armor::StaticClass(), FName("Resistance_Fire"));
        float32 targetResistance = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(TargetAbComp, resistanceAttr, success);
		float percentage = maxTargetHealth * (Entry.Value / 100);

        return percentage + targetResistance;
       
        

    }

}