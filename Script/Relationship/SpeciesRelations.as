namespace Creatures
{
    class URS_Species_NeutralToScavengerRideable : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger_Adult_Rideable, ERelationship::Neutral);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger_Adult_Rideable, ERelationshipHostility::None);
        default Weight = 10.0f;
    }

    class URS_Species_Creature : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Enemy);

        default Weight = 0.2f;
    }

    class URS_Species_Creature_KeepMeatbugNeutral : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Meatbug, ERelationship::Neutral);

        default Weight = 10.0f;
    }

    class URS_Species_Bloodfly : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Bloodfly);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger_Adult, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger_Medium, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger_Young, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Demon : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Demon);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature, ERelationship::Enemy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Demon_Temple : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Demon);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationship::Neutral);

        default Weight = 0.6f;
    }

    class URS_Species_Harpy : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Harpy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Goblin : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Goblin);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Troll, ERelationship::Friend);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Enemy);

        // TODO: Validate
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Goblin_EnemyToMeatbugs : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Goblin);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Meatbug, ERelationship::Enemy);

        default Weight = 10.5f;
    }

    class URS_Species_Golem : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Golem);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Golem_EnemyToMeatbugs : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Golem);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Meatbug, ERelationship::Enemy);

        default Weight = 10.5f;
    }

    class URS_Species_Golem_Ice : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Golem_Ice);
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Golem_Mini_Ice);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem_Ice, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem_Mini_Ice, ERelationship::Friend);

        default Weight = 1.0f;
    }

    class URS_Species_Lizard : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Lizard);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Friend);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);
        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);

        default Weight = 0.5f;
    }

    class URS_Species_Lurker : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Lurker);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);
        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Enemy);

        default Weight = 0.5f;
    }

    class URS_Species_Minecrawler : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Minecrawler);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Friend);

        default Weight = 0.5f;
    }

    class URS_Species_Minecrawler_Temple : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Minecrawler);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationship::Neutral);

        default Weight = 0.6f;
    }

    class URS_Species_Molerat : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Molerat);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Friend);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Meatbug : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Meatbug);
    }

    class URS_Species_Orc : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Orc);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Enemy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Troll, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Enemy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lurker, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);

        default Weight = 0.5f;
    }

    class URS_Species_Orcdog : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Orcdog);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Biter : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Biter);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Friend);


        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Biter_Strapped : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Biter_Strapped);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 0.6f;
    }
    

    class URS_Species_Razor : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Razor);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::Predator);

        default Weight = 0.5f;
    }

    class URS_Species_Scavenger : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Scavenger);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Scavenger_Adult : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Scavenger_Adult);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationshipHostility::Predator);

        default Weight = 0.75f;
    }

    class URS_Species_Scavenger_Rideable : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Angry);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationshipHostility::None);

        default Weight = 1.0f;
    }

    class URS_Species_Shadowbeast : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Shadowbeast);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);

        default Weight = 0.5f;
    }

    class URS_Species_Bloodhound : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Bloodhound);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);

        default Weight = 0.5f;
    }

    class URS_Species_Undead : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Undead);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Demon, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Neutral);

        default Weight = 0.25f;
    }

    class URS_Species_Undead_FriendlyTowardsSleeperGuild : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Undead);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Undead_Orc : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Undead_Orc);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Undead_Orc_Varrag : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Undead_Orc_Varrag);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default Weight = 0.75f;
    }

    class URS_Species_Snapper : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Snapper);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Friend);

        // TODO: Validate
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Enemy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);

        // TODO: Validate
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::Predator);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);

        default Weight = 0.5f;
    }

    class URS_Species_Swampshark : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Swampshark);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lurker, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);

        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_SleeperTemple, ERelationship::Neutral);

        default Weight = 0.5f;
    }

    class URS_Species_Troll : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Troll);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Friend);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Troll, ERelationship::Friend);

        default Weight = 0.5f;
    }

    class URS_Species_Wolf : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Wolf);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Angry);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Friend);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Enemy);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::Predator);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationshipHostility::Prey);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::Predator);

        default Weight = 0.5f;
    }

    class URS_Species_Wolf_Cohsel : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Wolf_Cohsel);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Neutral);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::None);

        default Weight = 0.6f;
    }

    class URS_Species_Scavenger_Cohsel : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Cohsel);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Human, ERelationship::Neutral);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Neutral);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Neutral);

        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationshipHostility::None);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationshipHostility::None);

        default Weight = 0.6f;
    }

    class URS_Species_Human : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Human);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationship::Enemy);
        default HostilityTowardsSpecies.Add(GameplayTag::Species_Orc, ERelationshipHostility::AttackOnSight);
        
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Undead, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Minecrawler, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Harpy, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Golem, ERelationship::Enemy);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Troll, ERelationship::Enemy);

        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Biter, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodfly, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Bloodhound, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Goblin, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lizard, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Lurker, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Molerat, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Orcdog, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Razor, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Scavenger, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Shadowbeast, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Snapper, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Swampshark, ERelationship::Angry);
        default FriendlinessTowardsSpecies.Add(GameplayTag::Species_Creature_Wolf, ERelationship::Angry);

        default Weight = 1.5f;
    }

    class URS_Species_Human_NeutralToOrcSlaves : UStaticRelationshipModifier
    {
        default ForSpecies.AddTag(GameplayTag::Species_Human);
        default FriendlinessTowardsGuild.Add(GameplayTag::Guild_Orc_Slave, ERelationship::Neutral);

        default Weight = 2.0f;
    }
}