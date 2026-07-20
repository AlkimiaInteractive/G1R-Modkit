// Copyright by THQ Nordic & Alkimia Interactive

// For a subcategory to work it needs to be added to the m_PossibleSubcategories array of a glossary category (see GlossaryCategories.as).

// Subcategories for glossary documents. Other than categories each document can belong to multiple subcategories.
// m_FilterTag      must be a gameplay tag that's not used by any other glossary subcategory to work as a subfilter. 
//                  If multiple subfilters share the same tag only a single random one will be added to the subfilter switcher!
//                  Pure badges dont realy care for the filter tag, though.
// m_DisplayName    is the name shown in the subfilter switcher at the top of the glossary UI.
// m_IconImage      is an optional icon that will be shown in the subfilter switcher and as a badge on each glossary entry that belongs to this subcategory.
// m_SortOrder      defines the order in which the subcategories are displayed in the subfilter switcher.
// m_ShowInFilters  defines whether the subcategory is shown in the subfilter switcher.
// m_ShowOnEntries  defines whether the subcategory is shown as a badge on glossary entries that belong to it (if an icon image is set).

// Some subcategories use breadcrumbs to determine whether a document belongs to them:
// Some name (e.g. the document name or the segment name) is checked if it contains any of the defined crumbs.

class UGlossarySubcategory_G1R_All : UGlossarySubcategory
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_All;
    default m_DisplayName = LocText("Text_FilterAll");
    default m_SortOrder = 10;
}

class UGlossarySubcategory_G1R_Traders : UGlossarySubcategory_BySegmentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Traders;
    default m_DisplayName = LocText("Text_FilterTraders");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Shop.T_Icon_Shop");
    default m_SortOrder = 20;
    default m_NameCrumbs.Add("_Trader");
    default m_NameCrumbs.Add("_Dealer");
}

class UGlossarySubcategory_G1R_Teachers : UGlossarySubcategory_BySegmentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Teachers;
    default m_DisplayName = LocText("Text_FilterTeachers");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Trainer.T_Icon_Trainer");
    default m_SortOrder = 21;
    default m_NameCrumbs.Add("_Teach");
    default m_NameCrumbs.Add("_Train");
}

class UGlossarySubcategory_G1R_Armorers : UGlossarySubcategory_BySegmentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Armorers;
    default m_DisplayName = LocText("Text_FilterArmorers");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Armorer.T_Icon_Armorer");
    default m_SortOrder = 22;
    default m_NameCrumbs.Add("_Armor");
}

class UGlossarySubcategory_ByRelationshipAS : UGlossarySubcategory_ByRelationship
{
    UFUNCTION(BlueprintOverride)
    ERelationship GetCombinedRelationshipAS( const AGothicCharacterState _CharacterState, const AGothicPlayerState _OwningPlayerState ) const
    {
        // Get the AS character AI ability and do sanity checks
        UGameplayAbility_CharacterAI CharacterAI = IsValid(_CharacterState) ? _CharacterState.CharacterAI : nullptr;
        UGameplayAbility_CharacterAI_Gothic AI = IsValid(CharacterAI) ? Cast<UGameplayAbility_CharacterAI_Gothic>(CharacterAI) : nullptr;
        if (!IsValid(AI) || !IsValid(_OwningPlayerState))
        {
            return ERelationship::Unknown;
        }

        // Return the combined relationship consisting of actual relation and crime relation, which is only accessible in AS
        return AI.GetPlayerRelationshipForGlossary(_OwningPlayerState);
    }
}

class UGlossarySubcategory_G1R_NegativeRelationships : UGlossarySubcategory_ByRelationshipAS
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_NegativeRelationships;
    default m_DisplayName = LocText("Text_FilterHostile");
    default m_SortOrder = 23;
    default m_ShowOnEntries = false;
    default m_IgnoreDeadActors = true;
    default m_AcceptedRelationships.Add(ERelationship::Angry);
    default m_AcceptedRelationships.Add(ERelationship::Hostile);
    default m_AcceptedRelationships.Add(ERelationship::Enemy);
}

class UGlossarySubcategory_G1R_Friends : UGlossarySubcategory_ByRelationshipAS
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Friends;
    default m_DisplayName = LocText("Text_FilterFriends");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Friendly.T_Icon_Friendly");
    default m_SortOrder = 24;
    default m_ShowInFilters = false;
    default m_IgnoreDeadActors = true;
    default m_AcceptedRelationships.Add(ERelationship::Friend);
}

class UGlossarySubcategory_G1R_Angry : UGlossarySubcategory_ByRelationshipAS
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Angry;
    default m_DisplayName = LocText("Text_FilterAngry");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Angry.T_Icon_Angry");
    default m_SortOrder = 24;
    default m_ShowInFilters = false;
    default m_IgnoreDeadActors = true;
    default m_AcceptedRelationships.Add(ERelationship::Angry);
}

class UGlossarySubcategory_G1R_Hostile : UGlossarySubcategory_ByRelationshipAS
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Hostile;
    default m_DisplayName = LocText("Text_FilterHostile");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Hostile.T_Icon_Hostile");
    default m_SortOrder = 24;
    default m_ShowInFilters = false;
    default m_IgnoreDeadActors = true;
    default m_AcceptedRelationships.Add(ERelationship::Hostile);
}

class UGlossarySubcategory_G1R_Enemies : UGlossarySubcategory_ByRelationshipAS
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Enemies;
    default m_DisplayName = LocText("Text_FilterEnemies");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Enemy.T_Icon_Enemy");
    default m_SortOrder = 24;
    default m_ShowInFilters = false;
    default m_IgnoreDeadActors = true;
    default m_AcceptedRelationships.Add(ERelationship::Enemy);
}

// The ByAliveState variety checks if the character is actually dead, but we want to only mark them as such if the player really knows about them being dead.
//class UGlossarySubcategory_G1R_Dead : UGlossarySubcategory_ByAliveState
class UGlossarySubcategory_G1R_Dead : UGlossarySubcategory_BySegmentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_Dead;
    default m_DisplayName = LocText("Text_FilterDead");
    default m_IconImage = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/Common/Icons/T_Icon_Dead.T_Icon_Dead");
    default m_SortOrder = 29;
    //default m_IsCharacterAlive = false;
    default m_NameCrumbs.Add("_Dead");
}

class UGlossarySubcategory_G1R_GeneralTutorials : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_GeneralTutorials;
    default m_DisplayName = LocText("Text_FilterGeneral");
    default m_SortOrder = 1;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_Base_");
    default m_NameCrumbs.Add("_General_");
}

class UGlossarySubcategory_G1R_WorldExploration : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_WorldExploration;
    default m_DisplayName = LocText("Text_FilterWorldExploration");
    default m_SortOrder = 2;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_MP_");
    default m_NameCrumbs.Add("_NV_");
    default m_NameCrumbs.Add("_SR_");
}

class UGlossarySubcategory_G1R_CombatMagic : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_CombatMagic;
    default m_DisplayName = LocText("Text_FilterCombatMagic");
    default m_SortOrder = 3;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_CB_");
    default m_NameCrumbs.Add("_MC_");
    default m_NameCrumbs.Add("_MG_");
    default m_NameCrumbs.Add("_RC_");
}

class UGlossarySubcategory_G1R_CharacterProgression : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_CharacterProgression;
    default m_DisplayName = LocText("Text_FilterCharacterProgression");
    default m_SortOrder = 4;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_CF_");
    default m_NameCrumbs.Add("_PR_");
    default m_NameCrumbs.Add("_PC_");
    default m_NameCrumbs.Add("_SL_");
}

class UGlossarySubcategory_G1R_ItemsEconomy : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_ItemsEconomy;
    default m_DisplayName = LocText("Text_FilterItemsEconomy");
    default m_SortOrder = 5;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_DR_");
    default m_NameCrumbs.Add("_TR_");
}

class UGlossarySubcategory_G1R_StealthCrime : UGlossarySubcategory_ByDocumentName
{
    default m_FilterTag = GameplayTag::UI_Filter_GlossarySub_StealthCrime;
    default m_DisplayName = LocText("Text_FilterStealthCrime");
    default m_SortOrder = 6;
    default m_ShowOnEntries = false;
    default m_NameCrumbs.Add("_CR_");
    default m_NameCrumbs.Add("_LP_");
    default m_NameCrumbs.Add("_PP_");
}
