UCLASS()
class UCombatDifficultySettings_Easy : UCombatDifficultySettings
{
    default m_settingsName = "ui_difficulty_easy";
    default m_uiSortingPriority = 0.0f; // Adjust if needed


    // ============================================================ //
    //                          CREATURES                           //
    // ============================================================ //

    // --- BASE CREATURE ---------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature,                      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature,                      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature,                      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature,                      0.5f);


    // --- BITER ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter,                0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter,                0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter,                0.75f);


    // *** ARMORED *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter_Armored,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter_Armored,        0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter_Armored,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter_Armored,        0.75f);


    // *** STRAPPED *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Biter_Strapped,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Biter_Strapped,       0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Biter_Strapped,       1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Biter_Strapped,       0.75f);


    // --- BLOODFLY --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Bloodfly,             1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Bloodfly,             0.5f);


    // --- BLOODHOUND ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Bloodhound,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Bloodhound,           0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Bloodhound,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Bloodhound,           0.85f);


    // --- DEMON ------------------------------------ //

    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Fire,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Fire,           0.85f);


    // *** LESSER *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Lesser,         1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Lesser,         0.85f);


    // *** LORD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Demon_Lord,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Demon_Lord,           0.85f);


    // --- GOBLIN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin,               0.5f);


    // *** BLACK *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Black,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Black,         0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Black,         1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Black,         0.65f);


    // *** GREEN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Green,         1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Green,         0.5f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Normal,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Normal,        0.5f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Goblin_Warrior,       1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Goblin_Warrior,       0.75f);


    // --- GOLEM ------------------------------------ //

    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Fire,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Fire,           0.75f);


    // *** ICE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Ice,            1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Ice,            0.75f);


    // *** MINI ICE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Mini_Ice,       0.5f);


    // *** STONE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Golem_Stone,          1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Golem_Stone,          0.75f);


    // --- HARPY ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Harpy,                0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Harpy,                0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Harpy,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Harpy,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Harpy,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Harpy,                0.85f);


    // --- LIZARD ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard,               0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard,               0.65f);


    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard_Fire,          0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard_Fire,          0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard_Fire,          1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard_Fire,          0.85f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lizard_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lizard_Normal,        0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lizard_Normal,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lizard_Normal,        0.65f);


    // --- LURKER ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Lurker,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Lurker,               0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Lurker,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Lurker,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Lurker,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Lurker,               0.65f);


    // --- MEATBUG ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Meatbug,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Meatbug,              1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Meatbug,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Meatbug,              0.5f);


    // --- MINECRAWLER ------------------------------ //

    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Normal,   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Normal,   0.75f);


    // *** QUEEN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Queen,    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Queen,    0.85f);


    // *** TEMPLE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Temple,   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Temple,   0.85f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Minecrawler_Warrior,  0.85f);


    // --- MOLERAT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Molerat,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Molerat,              1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Molerat,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Molerat,              0.5f);


    // --- ORCDOG ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_OrcDog,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_OrcDog,               0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_OrcDog,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_OrcDog,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_OrcDog,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_OrcDog,               0.75f);


    // --- RAT -------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Rat,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Rat,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Rat,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Rat,                  0.5f);


    // --- RAZOR ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Razor,                0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Razor,                0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Razor,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Razor,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Razor,                0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Razor,                0.75f);


    // --- SCAVENGER -------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger,            1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger,            1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger,            0.5f);


    // *** ADULT *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Adult,      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Adult,      0.65f);


    // *** MEDIUM *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Medium,     1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Medium,     0.5f);


    // *** YOUNG *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Scavenger_Young,      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Scavenger_Young,      0.5f);


    // --- SHADOWBEAST ------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_ShadowBeast,          0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_ShadowBeast,          0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_ShadowBeast,          1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_ShadowBeast,          0.85f);


    // --- SKELETON --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton,             0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton,             0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton,             1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton,             1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton,             0.75f);


    // *** MAGE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Mage,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Mage,        0.75f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Normal,      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Normal,      0.75f);


    // *** SCOUT *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Scout,       1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Scout,       0.85f);


    // *** WARRIOR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Skeleton_Warrior,     1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Skeleton_Warrior,     0.85f);


    // --- SNAPPER ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Snapper,              0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Snapper,              0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Snapper,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Snapper,              1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Snapper,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Snapper,              0.75f);


    // --- SWAMPSHARK ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_SwampShark,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_SwampShark,           0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_SwampShark,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_SwampShark,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_SwampShark,           0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_SwampShark,           0.85f);


    // --- THESLEEPER ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_TheSleeper,           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_TheSleeper,           0.5f);


    // --- TROLL ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll,                0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll,                0.85f);


    // *** JUVENILLE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll_Juvenille,      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll_Juvenille,      0.85f);


    // *** NORMAL *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Troll_Normal,         1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Troll_Normal,         0.85f);


    // --- WOLF ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Wolf_Normal,                 1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Wolf_Normal,                 0.65f);

    // tundra wolf
        // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Wolf_Alpha,                 1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Wolf_Alpha,                 0.75f);

    // --- ZOMBIE ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Zombie,               0.85f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Zombie,               0.85f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Zombie,               0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Zombie,               0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Zombie,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Zombie,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Zombie,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Zombie,               0.75f);


    // *** GUARDIAN *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Creature_Zombie_Guardian,      1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Creature_Zombie_Guardian,      0.75f);


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
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Bandit,                  0.8f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Bandit,                  0.8f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Bandit,                  0.8f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Bandit,                  0.8f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Bandit,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Bandit,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Bandit,                  0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Bandit,                  0.65f);


    // --- DIGGER ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Digger,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Digger,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Digger,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Digger,                  0.5f);


    // --- GUARD ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard,                   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard,                   0.65f);


    // *** HEAVYGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_HeavyGuard,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_HeavyGuard,        0.65f);


    // *** LIGHTGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_LightGuard,        1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_LightGuard,        0.65f);


    // *** MEDIUMGUARD *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guard_MediumGuard,       1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guard_MediumGuard,       0.65f);


    // --- GURU ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Guru,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Guru,                    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Guru,                    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Guru,                    0.65f);


    // --- MAGE ------------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage,                    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage,                    0.75f);


    // *** FIRE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage_Fire,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage_Fire,               0.75f);


    // *** WATER *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mage_Water,              1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mage_Water,              1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mage_Water,              0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mage_Water,              0.75f);


    // --- MERCENARY -------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Mercenary,               1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Mercenary,               1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Mercenary,               0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Mercenary,               0.65f);


    // --- NOVICE ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Novice,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Novice,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Novice,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Novice,                  0.5f);


    // --- OREBARON --------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_OreBaron,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_OreBaron,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_OreBaron,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_OreBaron,                0.65f);


    // --- PEASANT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Peasant,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Peasant,                 1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Peasant,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Peasant,                 0.5f);


    // --- ROGUE ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Rogue,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Rogue,                   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Rogue,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Rogue,                   0.5f);


    // --- SCRAPER ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Scraper,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Scraper,                 1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Scraper,                 0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Scraper,                 0.5f);


    // --- SHADOW ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Shadow,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Shadow,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Shadow,                  0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Shadow,                  0.5f);


    // --- TEMPLAR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar,                 1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar,                 1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar,                 0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar,                 0.65f);


    // *** HEAVYTEMPLAR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar_HeavyTemplar,    0.65f);


    // *** LIGHTTEMPLAR *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Templar_LightTemplar,    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Templar_LightTemplar,    0.5f);


    // --- XARDAS ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Human_Xardas,                  1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Human_Xardas,                  1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Human_Xardas,                  0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Human_Xardas,                  0.75f);


    // ============================================================ //
    //                             ORCS                             //
    // ============================================================ //

    // --- BASE ORC --------------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc,                           1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc,                           1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc,                           0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc,                           0.75f);


    // --- BLACKSMITH ------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Blacksmith,                1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Blacksmith,                0.65f);


    // --- PEASANT ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Peasant,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Peasant,                   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Peasant,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Peasant,                   0.65f);


    // --- SCOUT ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Scout,                     1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Scout,                     1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Scout,                     0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Scout,                     0.65f);


    // --- SHAMAN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Shaman,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Shaman,                    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Shaman,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Shaman,                    0.75f);


    // --- SLAVE ------------------------------------ //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Slave,                     1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Slave,                     1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Slave,                     0.5f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Slave,                     0.5f);


    // ============================================================ //
    //                         UNDEAD ORCS                          //
    // ============================================================ //

    // --- BASE UNDEAD ORC -------------------------- //

    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead,                    1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead,                    1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead,                    0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead,                    0.75f);


    // --- SHAMAN ----------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead_Shaman,             1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead_Shaman,             0.75f);


    // --- WARRIOR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Undead_Warrior,            0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Undead_Warrior,            0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Undead_Warrior,            1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Undead_Warrior,            0.75f);


    // ============================================================ //
    //                             ORCS                             //
    // ============================================================ //

    // --- WARRIOR ---------------------------------- //

    // *** BASE *** //
    // -- Attributes --
    default AddCombatModifier("AttributeSet_Strength.Strength",             GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Dexterity.Dexterity",           GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.Health",                 GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Health.MaxHealth",              GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Armor.SuperArmor",              GameplayTag::AIAgent_Orc_Warrior,                   0.5f);
    default AddCombatModifier("AttributeSet_Armor.MaxSuperArmor",           GameplayTag::AIAgent_Orc_Warrior,                   0.5f);
    default AddCombatModifier("AttributeSet_Mana.Mana",                     GameplayTag::AIAgent_Orc_Warrior,                   1.0f);
    default AddCombatModifier("AttributeSet_Mana.MaxMana",                  GameplayTag::AIAgent_Orc_Warrior,                   1.0f);

    // -- Resistances --
    default AddCombatModifier("AttributeSet_Armor.Resistance_Blunt",        GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Edge",         GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Point",        GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Fire",         GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Energy",       GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Ice",          GameplayTag::AIAgent_Orc_Warrior,                   0.65f);
    default AddCombatModifier("AttributeSet_Armor.Resistance_Wind",         GameplayTag::AIAgent_Orc_Warrior,                   0.65f);

}