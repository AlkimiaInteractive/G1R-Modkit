
UCLASS(Abstract)
class UGE_Guild : UGameplayEffect_Guild
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

class UGE_Guild_None : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_None);
}

////////////////////////////////////////////////
// XARDAS
////////////////////////////////////////////////

// XARDAS - DMB
class UGE_Guild_Human_DemonSummoner : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_DemonSummoner);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_XardasTower);
}

class UGE_Guild_Human_DemonSummonerAlly : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_DemonSummoner);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_XardasTower);
}

class UGE_Guild_Human_SummonedDemon : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_DemonSummoner);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_XardasTower);
}

////////////////////////////////////////////////
// OLD CAMP
////////////////////////////////////////////////

// DIGGER - VLK
class UGE_Guild_Human_OldCamp_Digger : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_Digger);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);
}

class UGE_Guild_Human_OldCamp_Digger_OC : UGE_Guild_Human_OldCamp_Digger 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_OldCamp_Digger_OM : UGE_Guild_Human_OldCamp_Digger 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldMine);
}

class UGE_Guild_Human_OldCamp_Digger_SC : UGE_Guild_Human_OldCamp_Digger
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

class UGE_Guild_Human_OldCamp_DiggerLeader : UGE_Guild_Human_OldCamp_Digger 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

// SHADOW - STT
class UGE_Guild_Human_OldCamp_Shadow : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

class UGE_Guild_Human_OldCamp_Shadow_OC : UGE_Guild_Human_OldCamp_Shadow 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_OldCamp_Shadow_OM : UGE_Guild_Human_OldCamp_Shadow 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldMine);
}

class UGE_Guild_Human_OldCamp_Shadow_World : UGE_Guild_Human_OldCamp_Shadow 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_Wilderness);
}

class UGE_Guild_Human_OldCamp_ShadowLeader : UGE_Guild_Human_OldCamp_Shadow 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

// GUARD - GRD
class UGE_Guild_Human_OldCamp_Guard : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

class UGE_Guild_Human_OldCamp_Guard_OC : UGE_Guild_Human_OldCamp_Guard 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_OldCamp_Guard_OM : UGE_Guild_Human_OldCamp_Guard 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldMine);
}

class UGE_Guild_Human_OldCamp_GuardLeader : UGE_Guild_Human_OldCamp_Guard 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

// ORE BARON - EBR
class UGE_Guild_Human_OldCamp_OreBaron : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_OldCamp_OreBaronLeader : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron_Gomez);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);
}

// FIRE MAGE - KDF
class UGE_Guild_Human_OldCamp_FireMage : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_OldCamp_FireMageLeader : UGE_Guild_Human_OldCamp_FireMage 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
}

// WOMAN SLAVE - WOC
class UGE_Guild_Human_OldCamp_WomanSlave : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

// CONVOY
class UGE_Guild_Human_Convoy_OldCamp : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

////////////////////////////////////////////////
// NEW CAMP
////////////////////////////////////////////////

// PEASANT - BAU
class UGE_Guild_Human_NewCamp_Peasant : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_NewCamp_Peasant);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_NewCamp_PeasantLeader : UGE_Guild_Human_NewCamp_Peasant 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
}

// SCRAPPER - SFB
class UGE_Guild_Human_NewCamp_Scraper : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_NewCamp_Scraper);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);
}

class UGE_Guild_Human_NewCamp_Scrapper_NC : UGE_Guild_Human_NewCamp_Scraper
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_NewCamp_Scrapper_FM : UGE_Guild_Human_NewCamp_Scraper
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_FreeMine);
}

class UGE_Guild_Human_NewCamp_ScraperLeader : UGE_Guild_Human_NewCamp_Scraper
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_FreeMine);
}

// MERCENARY - SLD
class UGE_Guild_Human_NewCamp_Mercenary : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_NewCamp_Mercenary);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

class UGE_Guild_Human_NewCamp_Mercenary_NC : UGE_Guild_Human_NewCamp_Mercenary
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_NewCamp_Mercenary_FM : UGE_Guild_Human_NewCamp_Mercenary
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_FreeMine);
}

class UGE_Guild_Human_NewCamp_Mercenary_OC : UGE_Guild_Human_NewCamp_Mercenary
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_NewCamp_MercenaryLeader : UGE_Guild_Human_NewCamp_Mercenary 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

// ROGUE - ORG
class UGE_Guild_Human_NewCamp_Rogue : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_NewCamp_Rogue);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

class UGE_Guild_Human_NewCamp_Rogue_NC : UGE_Guild_Human_NewCamp_Rogue 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_NewCamp_Rogue_FM : UGE_Guild_Human_NewCamp_Rogue 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_FreeMine);
}

class UGE_Guild_Human_NewCamp_Rogue_OC : UGE_Guild_Human_NewCamp_Rogue 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_NewCamp_Rogue_World : UGE_Guild_Human_NewCamp_Rogue 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_Wilderness);
}

class UGE_Guild_Human_NewCamp_RogueLeader : UGE_Guild_Human_NewCamp_Rogue 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

// WATER MAGE - KDW
class UGE_Guild_Human_NewCamp_WaterMage : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_NewCamp_WaterMage);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_NewCamp_WaterMageLeader : UGE_Guild_Human_NewCamp_WaterMage 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);
}

// CONVOY
class UGE_Guild_Human_Convoy_NewCamp : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

////////////////////////////////////////////////
// SWAMP CAMP
////////////////////////////////////////////////

// GURU - GUR
class UGE_Guild_Human_SwampCamp_Guru : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Guru);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

class UGE_Guild_Human_SwampCamp_GuruLeader : UGE_Guild_Human_SwampCamp_Guru 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);
}

// TEMPLAR - TPL
class UGE_Guild_Human_SwampCamp_Templar : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Templar);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

class UGE_Guild_Human_SwampCamp_Templar_SC : UGE_Guild_Human_SwampCamp_Templar 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

class UGE_Guild_Human_SwampCamp_Templar_OM : UGE_Guild_Human_SwampCamp_Templar 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldMine);
}

class UGE_Guild_Human_SwampCamp_TemplarLeader : UGE_Guild_Human_SwampCamp_Templar 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

// NOVICE - NOV
class UGE_Guild_Human_SwampCamp_Novice : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);
}

class UGE_Guild_Human_SwampCamp_Novice_OC : UGE_Guild_Human_SwampCamp_Novice 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OldCamp);
}

class UGE_Guild_Human_SwampCamp_Novice_NC : UGE_Guild_Human_SwampCamp_Novice 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_NewCamp);
}

class UGE_Guild_Human_SwampCamp_Novice_SC : UGE_Guild_Human_SwampCamp_Novice 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

// WOMAN SLAVE - WSC
class UGE_Guild_Human_SwampCamp_WomanSlave : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

////////////////////////////////////////////////
// SWAMP CAMP - KALOMNISTS
////////////////////////////////////////////////

// GURU - GUR
class UGE_Guild_Human_SwampCamp_Kalomnist_Guru : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

class UGE_Guild_Human_SwampCamp_Kalomnist_GuruLeader : UGE_Guild_Human_SwampCamp_Kalomnist_Guru 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);
}

// TEMPLAR - TPL
class UGE_Guild_Human_SwampCamp_Kalomnist_Templar : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

// NOVICE - NOV
class UGE_Guild_Human_SwampCamp_Kalomnist_Novice : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_SwampCamp);
}

////////////////////////////////////////////////
// BANDIT CAMP
////////////////////////////////////////////////

// BANDIT
class UGE_Guild_Human_BanditCamp_Bandit : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Human_Bandit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_BanditCamp);
}

class UGE_Guild_Human_BanditCamp_BanditLeader : UGE_Guild_Human_BanditCamp_Bandit 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_GuildLeader);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Boss);
}

////////////////////////////////////////////////
// ORC
////////////////////////////////////////////////

// ORC SLAVE
class UGE_Guild_Orc_Slave : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Slave);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_FreeMine);
}

// ORC PEASANT
class UGE_Guild_Orc_Peasant : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Peasant);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Workforce);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
}

// ORC SCOUT
class UGE_Guild_Orc_Scout : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Scout);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
}

// ORC WARRIOR
class UGE_Guild_Orc_Warrior : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Warrior);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
}

// ORC SHAMAN
class UGE_Guild_Orc_Shaman : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Shaman);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Leadership);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
}

// ORC BLACKSMITH
class UGE_Guild_Orc_Warrior_Blacksmith : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Orc_Warrior_Blacksmith);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CrimeLocation_OrcEnclave);
}

////////////////////////////////////////////////
// OTHER
////////////////////////////////////////////////

// UNDEAD
class UGE_Guild_Undead : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Undead);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::CampRole_Guard);
}

// DEMON
class UGE_Guild_Demon : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Demon);
}

////////////////////////////////////////////////
// FUNCTIONS
////////////////////////////////////////////////

mixin FGameplayEffectSpecHandle GE_Guild(UAbilitySystemComponent ASC, TSubclassOf<UGE_Guild> GuildEffect)
{
    return ASC.MakeOutgoingSpec(GuildEffect, 1.0f, ASC.MakeEffectContext());
}

////////////////////////////////////////////////
// TEST GUILDS
////////////////////////////////////////////////

class UGE_Guild_Test_A : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_A);
}

class UGE_Guild_Test_B : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_B);
}

class UGE_Guild_Test_C : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_C);
}

class UGE_Guild_Test_D : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_D);
}

class UGE_Guild_Test_Trespassing : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_Trespassing);
}

class UGE_Guild_Test_Theft : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_Theft);
}

class UGE_Guild_Test_AITestDummy : UGE_Guild 
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_Test_AITestDummy);
}

// SLEEPER GUILD
class UGE_SleeperTemple : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Visuals_Humans_RedEyes);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Personality_Brave);
}

class UGE_SleeperTemple_Gorn : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Gorn);
}

class UGE_SleeperTemple_Milten : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Milten);
}

class UGE_SleeperTemple_Diego : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Diego);
}

class UGE_SleeperTemple_Lester : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Lester);
}

class UGE_SleeperTemple_Xardas : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Xardas);
}

class UGE_SleeperTemple_Mud : UGE_Guild
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Guild_SleeperTemple_Mud);
}