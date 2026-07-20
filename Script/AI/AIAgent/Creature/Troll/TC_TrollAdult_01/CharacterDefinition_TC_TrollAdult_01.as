UCLASS()
class UCharacterDefinition_TC_TrollAdult_01: UCharacterDefinition_Creature_Troll
{
    default m_Species = GameplayTag::Species_Creature_Troll_Adult;
    default m_UniqueName = n"TC_TrollAdult_01";

    default m_AbilitiesEffect = UGE_Troll_AI_Adult::StaticClass();
	default AddToInventory(UItAt_Troll_02::StaticClass(), 2, EInventoryTypes::MainContainer);
}

UCLASS()
class UGE_Troll_AI_Adult : UGE_Troll_AI
{
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
    //default AddAbility(UGA_TrollAdult_PickGoblin::StaticClass());
    //default AddAbility(UGameplayAbilityPick::StaticClass());
}
