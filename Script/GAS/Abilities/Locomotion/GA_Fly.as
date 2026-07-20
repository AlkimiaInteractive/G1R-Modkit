class UGA_Fly_Harpy : UGameplayAbilityFly
{
	default TriggerBeginOn(GameplayTag::Action_Fly, EGameplayAbilityTriggerSource::GameplayEvent);
	default TriggerEndOn(GameplayTag::End_Action_Fly);

	default m_CanLand = true;
}

class UGA_Fly_Bloodfly : UGameplayAbilityFly
{
	default TriggerBeginOn(GameplayTag::Action_Fly, EGameplayAbilityTriggerSource::GameplayEvent);

    default m_ActivateAbilityOnGranted = true;
	default m_CanLand = false;
}

class UGA_Fly_Demon : UGameplayAbilityFly
{
	default TriggerBeginOn(GameplayTag::Action_Fly, EGameplayAbilityTriggerSource::GameplayEvent);

    default m_ActivateAbilityOnGranted = true;
	default m_CanLand = false;
}

class UGA_Fly_SkeletonMage : UGameplayAbilityFly
{
	default TriggerBeginOn(GameplayTag::Action_Fly, EGameplayAbilityTriggerSource::GameplayEvent);

    default m_ActivateAbilityOnGranted = true;
	default m_CanLand = false;
}