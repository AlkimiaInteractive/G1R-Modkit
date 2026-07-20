
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_FireLizard: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_FireLizard::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Lizard/CharacterCanTransformInto_FireLizard.CharacterCanTransformInto_FireLizard_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_FireLizard_UnTransformed_Montage.A_FireLizard_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;	
}

UCLASS()
class UCharacterCanTransformIntoConfig_FireLizard : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Lizard_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Lizard_Fire::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Lizard_Fire::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Lizard::StaticClass();
}