
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_OrcDog: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_OrcDog::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/OrcDog/CharacterCanTransformInto_OrcDog.CharacterCanTransformInto_OrcDog_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_OrcDog_UnTransformed_Montage.A_OrcDog_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_OrcDog : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_OrcDog_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_OrcDog::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_OrcDog::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_OrcDog::StaticClass();
}