
UCLASS()
class UCharacterDefinition_Creature_Golem_Stone_AncientMonastery : UCharacterDefinition_Creature_Golem_Stone_Bridge
{
    default m_UniqueName = n"Golem_Stone_AncientMonastery";

    default m_AIAbility = UGameplayAbility_CharacterAI_Golem_Stone_Monastery::StaticClass();
}

