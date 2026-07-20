UCLASS()
class UGA_ManagePetInteractiveObject_Scavenger : UGameplayAbilityManagePetInteractiveObject
{
    default m_InteractiveObjectDefinition = UPetCharacterInteractionScavenger::StaticClass();
}

UCLASS()
class UGA_ManagePetInteractiveObject_Wolf : UGameplayAbilityManagePetInteractiveObject
{
    default m_InteractiveObjectDefinition = UPetCharacterInteractionWolf::StaticClass();
}