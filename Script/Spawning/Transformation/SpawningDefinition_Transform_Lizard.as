
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Lizard: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Lizard::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Lizard/CharacterCanTransformInto_Lizard.CharacterCanTransformInto_Lizard_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Lizard_UnTransformed_Montage.A_Lizard_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Lizard : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Lizard_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Lizard::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lizard::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lizard::StaticClass();
}