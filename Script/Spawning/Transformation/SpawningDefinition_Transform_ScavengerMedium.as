
UCLASS()
class USpawnCharacterCanTransformIntoDefinition_ScavengerMedium: USpawnCharacterCanTransformIntoDefinition
{
	default m_Config = UCharacterCanTransformIntoConfig_ScavengerMedium::StaticClass();
	default m_Character = n"Blueprint'/Game/AI/AIAgent/Creature/Scavenger/CharacterCanTransformInto_ScavengerMedium.CharacterCanTransformInto_ScavengerMedium_C'";
	default m_UnTransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Transform/ScavengerMed_UnTransform_Montage.ScavengerMed_UnTransform_Montage'";
	default m_WaitingTimeCrouchUntilTransform = 0.2f;
	default m_WaitingTimeCrouchUntilUnTransform = 2.0f;
    default m_CameraTravellingInitialDelay = 0.5f;
    default m_CameraTravellingDuration = 1.5f;
	default m_CanSwim = true;
}

UCLASS()
class UCharacterCanTransformIntoConfig_ScavengerMedium : UCharacterConfig
{
	default m_LocomotionConfig = ULocomotionConfig_Scavenger_Medium_Player::StaticClass();
	default m_AnimConfig = UAnimConfig_Scavenger_Medium::StaticClass();
	default m_CharacterDefinition = UCharacterDefinition_Creature_Scavenger_Medium::StaticClass();
	default m_NavigationConfig = UAIAgentConfig_Navigation_Scavenger::StaticClass();
}