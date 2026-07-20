
UCLASS()
class UCharacterDefinition_Orc_UndeadWarriorM : UCharacterDefinition_Orc
{
	default m_CharacterType = GameplayTag::AIAgent_Orc;
    default m_Species = GameplayTag::Species_Creature_Undead_Orc;
    default m_UniqueName = n"Orc_UndeadwarriorM";

    default m_AbilitiesEffect = UGE_OrcUndead_AI::StaticClass();
}