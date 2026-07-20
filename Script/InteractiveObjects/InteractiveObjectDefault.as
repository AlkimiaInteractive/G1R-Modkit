
UCLASS()
class UDefaultInteract : UInteractiveObjectDefinition
{
    default m_ObjectInteractAngle = 0.0f;
    default m_PlayerInteractAngle = 180.0f;
    default m_PlayerInteractZDistance = 130.0f;
    default m_PlayerInteractDistance = 150.0f;
    //default m_PlayerSightDistance = 200.0f;
    default m_PlayerDetectDistance = 0.0f;
    default m_Priority = 0.0f;
}

UCLASS()
class UFocusStoneInteractive : UDefaultInteract
{
    default m_RequiredIdObject.Add(UItAt_Amulet_Ulu_Talisman::StaticClass());
    default m_Priority = 7.0f;
}

UCLASS()
class UDefaultInteractive : UDefaultInteract
{
    default m_ObjectInteractAngle = 360.0f;
    default m_PlayerInteractDistance = 250.0f;

	// Set to true on chests whose lock must never be randomized
	UPROPERTY()
	bool m_bNoRandomLock = false;

	// Backup of the original m_Lock value, used internally
	UPROPERTY()
	FName m_OriginalLock;
}


UCLASS()
class UDefaultCharacterInteraction : UDefaultInteract
{
    default m_PlayerInteractDistance = 250.0f;
    default m_PlayerInteractDistanceFar = 300.0f;
    default m_PlayerInteractZDistance = 190.0f;
    default m_ObjectInteractAngle = 360.0f;
    default m_DefaultInteraction = GameplayTag::Action_Conversation;
    default m_Priority = 1.0f;
}

UCLASS()
class ULootCharacterInteraction : UDefaultCharacterInteraction
{
    default m_DefaultInteraction = GameplayTag::Action_Loot;
    default m_Priority = 9.0f;
}

UCLASS()
class UExecutionCharacterInteraction : UDefaultCharacterInteraction
{
    default m_DefaultInteraction = GameplayTag::Action_Execution;
    default m_AdditionalInteractions.AddTag(GameplayTag::Action_Loot);
    //default m_RequiredItemSpec = GameplayTag::Item_Property_Equipable;
    default m_Priority = 10.0f;
}

UCLASS()
class URideCharacterInteraction : UDefaultCharacterInteraction
{
    default m_DefaultInteraction = GameplayTag::Action_Ride;
    default m_PlayerInteractDistance = 180.0f;
    default m_Priority = 5.0f;
}

UCLASS()
class UPetCharacterInteraction : UDefaultCharacterInteraction
{
    default m_DefaultInteraction = GameplayTag::Action_Pet;
    default m_PlayerInteractDistance = 150.0f;
    default m_Priority = 4.0f;
}

UCLASS()
class UPetCharacterInteractionScavenger : UPetCharacterInteraction
{
    default m_PlayerInteractDistance = 200.0f;
    //default m_ObjectInteractAngle = 45.0f;
    //default m_PlayerInteractAngle = 45.0f;
}

UCLASS()
class UPetCharacterInteractionWolf : UPetCharacterInteraction
{
    //default m_ObjectInteractAngle = 90.0f;
    //default m_PlayerInteractAngle = 45.0f;
}

UCLASS()
class USmashMeatBugCharacterInteraction : UDefaultInteract
{
    default m_ObjectInteractAngle = 360.0f;
    default m_PlayerInteractAngle = 90.0f;
    default m_PlayerInteractDistance = 105.0f;
    //default m_PlayerSightDistance = 150.0f;
    //default m_PlayerDetectDistance = 0.0f;
    default m_Priority = 6.0f;

    default m_DefaultInteraction = GameplayTag::Action_Smash_MeatBug;
}