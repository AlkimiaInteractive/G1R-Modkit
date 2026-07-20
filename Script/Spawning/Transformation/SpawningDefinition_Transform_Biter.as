
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Biter: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Biter::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Biter/CharacterCanTransformInto_Biter.CharacterCanTransformInto_Biter_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Biter_UnTransformed_Montage.A_Biter_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Biter : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Biter_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Biter::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Biter::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Biter::StaticClass();
}