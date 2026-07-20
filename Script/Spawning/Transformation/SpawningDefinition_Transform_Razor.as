
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_Razor: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_Razor::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Razor/CharacterCanTransformInto_Razor.CharacterCanTransformInto_Razor_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_Razor_UnTransformed_Montage.A_Razor_UnTransformed_Montage'";

	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_Razor : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Razor_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Razor::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Razor::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Razor::StaticClass();
}