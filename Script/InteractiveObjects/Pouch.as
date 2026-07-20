/**
 * UInteractiveObjectDefinition::m_DefaultInteraction is GameplayTag::Action_Pick_ToInventory.
 * We introduce a special interaction type for the pouch to reduce the number of calls to GASHelper::DoIHaveTheAbilityFor()
 * See also: UInteractSensor::IsInteractiveComponentAccepted()
 */
UCLASS()
class UPouchDefault : UInteractiveObjectDefinition
{
    default m_DefaultInteraction = GameplayTag::Action_Pick_ToInventory_Pouch;
}

/**
 * Note: this is a "dummy" item type; the pouch is some sort of meta-item and cannot be picked up/stored in an inventory.
 * We need this for the UAbilityTask_PickUpItem task to work so that NPCs can go and pick up their pouches on the ground.
 */
UCLASS()
class UItMi_Meta_Pouch: UItemDefinition
{
}