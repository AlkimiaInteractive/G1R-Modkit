// Copyright by THQ Nordic & Alkimia Interactive

// The categories shown left in the glossary UI. Each document can only belong to a single category, based on its m_CategoryClass.

class UGlossaryCategory_G1R_OldCamp : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_OldCamp;
    default m_DisplayName = LocText("Text_FilterOldCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_OldCamp.T_Icon_OldCamp");
    default m_SortOrder = 1;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Traders);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Teachers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Armorers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_NegativeRelationships);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Friends);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Angry);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Hostile);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Enemies);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Dead);
}

class UGlossaryOldCampDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_OldCamp;
    default m_InitialSegmentNameCrumbs.Add("_Introduction");
}

class UGlossaryCategory_G1R_NewCamp : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_NewCamp;
    default m_DisplayName = LocText("Text_FilterNewCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_NewCamp.T_Icon_NewCamp");
    default m_SortOrder = 2;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Traders);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Teachers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Armorers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_NegativeRelationships);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Friends);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Angry);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Hostile);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Enemies);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Dead);
}

class UGlossaryNewCampDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_NewCamp;
    default m_InitialSegmentNameCrumbs.Add("_Introduction");
}

class UGlossaryCategory_G1R_SwampCamp : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_SwampCamp;
    default m_DisplayName = LocText("Text_FilterSwampCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_SwampCamp.T_Icon_SwampCamp");
    default m_SortOrder = 3;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Traders);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Teachers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Armorers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_NegativeRelationships);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Friends);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Angry);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Hostile);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Enemies);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Dead);
}

class UGlossarySwampCampDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_SwampCamp;
    default m_InitialSegmentNameCrumbs.Add("_Introduction");
}

class UGlossaryCategory_G1R_HiddenCamp : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_HiddenCamp;
    default m_DisplayName = LocText("Text_FilterHiddenCamp");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Characters.T_Icon_Characters");
    default m_SortOrder = 4;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Traders);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Teachers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Armorers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_NegativeRelationships);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Friends);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Angry);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Hostile);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Enemies);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Dead);
}

class UGlossaryHiddenCampDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_HiddenCamp;
    default m_InitialSegmentNameCrumbs.Add("_Introduction");
}

class UGlossaryCategory_G1R_Outsiders : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_Outsiders;
    default m_DisplayName = LocText("Text_FilterOutsiders");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Characters.T_Icon_Characters");
    default m_SortOrder = 5;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Traders);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Teachers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Armorers);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_NegativeRelationships);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Friends);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Angry);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Hostile);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Enemies);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_Dead);
}

class UGlossaryOutsidersDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_Outsiders;
    default m_InitialSegmentNameCrumbs.Add("_Introduction");
}

class UGlossaryCategory_G1R_Creatures : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_Creatures;
    default m_DisplayName = LocText("Text_FilterCreatures");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Creatures.T_Icon_Creatures");
    default m_SortOrder = 6;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
}

class UGlossaryCreaturesDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_Creatures;
    default m_InitialSegmentNameCrumbs.Add("_Unlock");
}

class UGlossaryCategory_G1R_Locations : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_Locations;
    default m_DisplayName = LocText("Text_FilterLocations");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Location.T_Icon_Location");
    default m_SortOrder = 7;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
}

class UGlossaryLocationsDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_Locations;
    default m_InitialSegmentNameCrumbs.Add("_Unlock");
}

class UGlossaryCategory_G1R_Tutorials : UGlossaryCategory
{
    default m_FilterTag = GameplayTag::UI_Filter_Glossary_Tutorials;
    default m_DisplayName = LocText("Text_FilterTutorials");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Tutorials.T_Icon_Tutorials");
    default m_SortOrder = 8;
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_GeneralTutorials);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_WorldExploration);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_CombatMagic);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_CharacterProgression);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_ItemsEconomy);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_StealthCrime);
    default m_PossibleSubcategories.Add(UGlossarySubcategory_G1R_All);
}

class UGlossaryTutorialsDocument : UGlossaryDocument
{
    default m_CategoryClass = UGlossaryCategory_G1R_Tutorials;
    default m_InitialSegmentNameCrumbs.Add("_Initial");
}
