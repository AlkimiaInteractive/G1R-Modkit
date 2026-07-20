UCLASS()
class UCombatDifficultySettings_Hard : UCombatDifficultySettings
{
    default m_settingsName = "ui_difficulty_hard";
    default m_uiSortingPriority = 2.0f;

    // ============================================================ //
    //                          CREATURES                           //
    // ============================================================ //

    // --- BASE CREATURE ---------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature,                      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature,                      1.0f);


    // --- BITER ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter,                1.0f);


    // *** ARMORED *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter_Armored,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter_Armored,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter_Armored,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);


    // *** STRAPPED *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter_Strapped,       1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter_Strapped,       1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter_Strapped,       1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);


    // --- BLOODFLY --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Bloodfly,             1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Bloodfly,             1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Bloodfly,             1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);


    // --- BLOODHOUND ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Bloodhound,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Bloodhound,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Bloodhound,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);


    // --- DEMON ------------------------------------ //

    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Fire,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Fire,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Fire,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);


    // *** LESSER *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Lesser,         1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Lesser,         1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Lesser,         1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);


    // *** LORD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Lord,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Lord,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Lord,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);


    // --- GOBLIN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin,               1.0f);


    // *** BLACK *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Black,         1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Black,         1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Black,         1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);


    // *** GREEN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Green,         1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Green,         1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Green,         1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Normal,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Normal,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Normal,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);


    // --- GOLEM ------------------------------------ //

    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Fire,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Fire,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Fire,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);


    // *** ICE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Ice,            1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Ice,            1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Ice,            1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);


    // *** MINI ICE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);


    // *** STONE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Stone,          1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Stone,          1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Stone,          1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);


    // --- HARPY ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Harpy,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Harpy,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Harpy,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Harpy,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Harpy,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Harpy,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Harpy,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Harpy,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Harpy,                1.0f);


    // --- LIZARD ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard,               1.0f);


    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard_Fire,          1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard_Fire,          1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard_Fire,          1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard_Normal,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard_Normal,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard_Normal,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);


    // --- LURKER ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lurker,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lurker,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lurker,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lurker,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lurker,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lurker,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lurker,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lurker,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lurker,               1.0f);


    // --- MEATBUG ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Meatbug,              1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Meatbug,              1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Meatbug,              1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Meatbug,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Meatbug,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Meatbug,              1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Meatbug,              1.0f);


    // --- MINECRAWLER ------------------------------ //

    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);


    // *** QUEEN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);


    // *** TEMPLE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);


    // --- MOLERAT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Molerat,              1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Molerat,              1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Molerat,              1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Molerat,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Molerat,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Molerat,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Molerat,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Molerat,              1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Molerat,              1.0f);


    // --- ORCDOG ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_OrcDog,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_OrcDog,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_OrcDog,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_OrcDog,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_OrcDog,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_OrcDog,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_OrcDog,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_OrcDog,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_OrcDog,               1.0f);


    // --- RAT -------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Rat,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Rat,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Rat,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Rat,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Rat,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Rat,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Rat,                  1.0f);


    // --- RAZOR ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Razor,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Razor,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Razor,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Razor,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Razor,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Razor,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Razor,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Razor,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Razor,                1.0f);


    // --- SCAVENGER -------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger,            1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger,            1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger,            1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger,            1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger,            1.0f);


    // *** ADULT *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);


    // *** MEDIUM *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);


    // *** YOUNG *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Young,      1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Young,      1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Young,      1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);


    // --- SHADOWBEAST ------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_ShadowBeast,          1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_ShadowBeast,          1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_ShadowBeast,          1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);


    // --- SKELETON --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton,             1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton,             1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton,             1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton,             1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton,             1.0f);


    // *** MAGE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);


    // *** SCOUT *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);


    // --- SNAPPER ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Snapper,              1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Snapper,              1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Snapper,              1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Snapper,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Snapper,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Snapper,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Snapper,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Snapper,              1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Snapper,              1.0f);


    // --- SWAMPSHARK ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_SwampShark,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_SwampShark,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_SwampShark,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_SwampShark,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_SwampShark,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_SwampShark,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_SwampShark,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_SwampShark,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_SwampShark,           1.0f);


    // --- THESLEEPER ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_TheSleeper,           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_TheSleeper,           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_TheSleeper,           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_TheSleeper,           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_TheSleeper,           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_TheSleeper,           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);


    // --- TROLL ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll,                1.0f);


    // *** JUVENILLE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll_Normal,         1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll_Normal,         1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll_Normal,         1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);


    // --- WOLF ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);

    // tundra wolf
        // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);

    // --- ZOMBIE ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Zombie,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Zombie,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Zombie,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Zombie,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Zombie,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Zombie,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Zombie,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Zombie,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Zombie,               1.0f);


    // *** GUARDIAN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);


    // ============================================================ //
    //                            HUMANS                            //
    // ============================================================ //

    // --- BASE HUMAN (affects the player character)-- //
    
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human,                         1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human,                         1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human,                         1.0f);


    // --- BANDIT ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Bandit,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Bandit,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Bandit,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Bandit,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Bandit,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Bandit,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Bandit,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Bandit,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Bandit,                  1.0f);


    // --- DIGGER ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Digger,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Digger,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Digger,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Digger,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Digger,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Digger,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Digger,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Digger,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Digger,                  1.0f);


    // --- GUARD ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard,                   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard,                   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard,                   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard,                   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard,                   1.0f);


    // *** HEAVYGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);


    // *** LIGHTGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_LightGuard,        1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_LightGuard,        1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_LightGuard,        1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);


    // *** MEDIUMGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);


    // --- GURU ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guru,                    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guru,                    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guru,                    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guru,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guru,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guru,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guru,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guru,                    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guru,                    1.0f);


    // --- MAGE ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage,                    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage,                    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage,                    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage,                    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage,                    1.0f);


    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage_Fire,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage_Fire,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage_Fire,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);


    // *** WATER *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage_Water,              1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage_Water,              1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage_Water,              1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage_Water,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage_Water,              1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage_Water,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage_Water,              1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage_Water,              1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage_Water,              1.0f);


    // --- MERCENARY -------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mercenary,               1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mercenary,               1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mercenary,               1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mercenary,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mercenary,               1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mercenary,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mercenary,               1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mercenary,               1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mercenary,               1.0f);


    // --- NOVICE ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Novice,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Novice,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Novice,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Novice,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Novice,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Novice,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Novice,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Novice,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Novice,                  1.0f);


    // --- OREBARON --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_OreBaron,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_OreBaron,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_OreBaron,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_OreBaron,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_OreBaron,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_OreBaron,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_OreBaron,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_OreBaron,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_OreBaron,                1.0f);


    // --- PEASANT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Peasant,                 1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Peasant,                 1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Peasant,                 1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Peasant,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Peasant,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Peasant,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Peasant,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Peasant,                 1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Peasant,                 1.0f);


    // --- ROGUE ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Rogue,                   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Rogue,                   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Rogue,                   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Rogue,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Rogue,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Rogue,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Rogue,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Rogue,                   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Rogue,                   1.0f);


    // --- SCRAPER ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Scraper,                 1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Scraper,                 1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Scraper,                 1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Scraper,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Scraper,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Scraper,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Scraper,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Scraper,                 1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Scraper,                 1.0f);


    // --- SHADOW ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Shadow,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Shadow,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Shadow,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Shadow,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Shadow,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Shadow,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Shadow,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Shadow,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Shadow,                  1.0f);


    // --- TEMPLAR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar,                 1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar,                 1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar,                 1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar,                 1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar,                 1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar,                 1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar,                 1.0f);


    // *** HEAVYTEMPLAR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);


    // *** LIGHTTEMPLAR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);


    // --- XARDAS ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Xardas,                  1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Xardas,                  1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Xardas,                  1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Xardas,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Xardas,                  1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Xardas,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Xardas,                  1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Xardas,                  1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Xardas,                  1.0f);


    // ============================================================ //
    //                             ORCS                             //
    // ============================================================ //

    // --- BASE ORC --------------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc,                           1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc,                           1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc,                           1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc,                           1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc,                           1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc,                           1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc,                           1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc,                           1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc,                           1.0f);


    // --- BLACKSMITH ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Blacksmith,                1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Blacksmith,                1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Blacksmith,                1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);


    // --- PEASANT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Peasant,                   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Peasant,                   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Peasant,                   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Peasant,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Peasant,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Peasant,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Peasant,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Peasant,                   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Peasant,                   1.0f);


    // --- SCOUT ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Scout,                     1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Scout,                     1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Scout,                     1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Scout,                     1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Scout,                     1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Scout,                     1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Scout,                     1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Scout,                     1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Scout,                     1.0f);


    // --- SHAMAN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Shaman,                    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Shaman,                    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Shaman,                    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Shaman,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Shaman,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Shaman,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Shaman,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Shaman,                    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Shaman,                    1.0f);


    // --- SLAVE ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Slave,                     1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Slave,                     1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Slave,                     1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Slave,                     1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Slave,                     1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Slave,                     1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Slave,                     1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Slave,                     1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Slave,                     1.0f);


    // ============================================================ //
    //                         UNDEAD ORCS                          //
    // ============================================================ //

    // --- BASE UNDEAD ORC -------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead,                    1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead,                    1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead,                    1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead,                    1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead,                    1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead,                    1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead,                    1.0f);


    // --- SHAMAN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead_Shaman,             1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead_Shaman,             1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead_Shaman,             1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);


    // --- WARRIOR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead_Warrior,            1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead_Warrior,            1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead_Warrior,            1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);


    // ============================================================ //
    //                             ORCS                             //
    // ============================================================ //

    // --- WARRIOR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Warrior,                   1.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Warrior,                   1.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Warrior,                   1.2f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Warrior,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Warrior,                   1.2f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Warrior,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Warrior,                   1.2f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Warrior,                   1.2f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Warrior,                   1.0f);

}