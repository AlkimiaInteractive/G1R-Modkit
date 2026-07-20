
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Harpy: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Harpy::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Harpy/CharacterCanTransformInto_Harpy.CharacterCanTransformInto_Harpy_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Harpy_UnTransformed_Montage.A_Harpy_UnTransformed_Montage'";
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Harpy : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Harpy_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Harpy::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Harpy::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Harpy::StaticClass();
}