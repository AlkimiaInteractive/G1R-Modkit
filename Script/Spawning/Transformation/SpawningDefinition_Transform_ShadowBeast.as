
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_ShadowBeast: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_ShadowBeast::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/ShadowBeast/CharacterCanTransformInto_ShadowBeast.CharacterCanTransformInto_ShadowBeast_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/A_ShadowBeast_UnTransformed_Montage.A_ShadowBeast_UnTransformed_Montage'";
	
	default m_WaitingTimeCrouchUntilTransform = .01f;
	default m_WaitingTimeCrouchUntilUnTransform = 1.0f;
    default m_CameraTravellingInitialDelay = 5.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_ShadowBeast : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_ShadowBeast_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_ShadowBeast::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_ShadowBeast::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_ShadowBeast::StaticClass();
}