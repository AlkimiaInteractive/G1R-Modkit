#ifdef WITH_STORY_G1R
UCLASS(Abstract)
class URS_Guild_WithUlumulu_Base : UStaticRelationshipModifier
{
    UFUNCTION(BlueprintOverride)
    bool IsApplicableForWorld(UWorld CurrentWorld) const
    {
        if(G1R::UStoryG1R::Get().HasULUMULU != 1)
            return false;

        auto Player = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        auto PlayerCharacterState = Player.CharacterState;

        // If the temple guards are dead we assume the player bruteforced their way inside the temple

        AGothicCharacterState TempleGuard1 = AGothicCharacterState::FindByUniqueName(n"OW_OWR_OrcTempleWarriorM01_2041");
        if (IsValid(TempleGuard1) && PlayerCharacterState.HasKilled(TempleGuard1))
            return false;

        AGothicCharacterState TempleGuard2 = AGothicCharacterState::FindByUniqueName(n"OW_OWR_OrcTempleWarriorM02_2042");
        if (IsValid(TempleGuard2) && PlayerCharacterState.HasKilled(TempleGuard2))
            return false; 

        return true;
    }

    default Weight = 4.0f;
}
#endif

namespace Orcs
{
    #ifdef WITH_STORY_G1R
    class URS_Guild_Orc_WithUlumulu : URS_Guild_WithUlumulu_Base
    {
        default ForGuild.AddTag(GameplayTag::Guild_Orc);
        default ForSpecies.AddTag(GameplayTag::Species_Orc);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 4.0f;
    }
    #endif
}

namespace Biters
{
    #ifdef WITH_STORY_G1R
    class URS_Guild_Biters_WithUlumulu : URS_Guild_WithUlumulu_Base
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Biter);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 4.0f;
    }
    #endif
}

namespace OrcDogs
{
    #ifdef WITH_STORY_G1R
    class URS_Guild_OrcDogs_WithUlumulu : URS_Guild_WithUlumulu_Base
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Orcdog);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 4.0f;
    }
    #endif
}