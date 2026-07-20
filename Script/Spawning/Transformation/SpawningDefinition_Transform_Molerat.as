
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Molerat: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Molerat::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Molerat/CharacterCanTransformInto_Molerat.CharacterCanTransformInto_Molerat_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Molerat_UnTransformed_Montage.A_Molerat_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Molerat : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Molerat_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Molerat::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Molerat::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Molerat::StaticClass();
}