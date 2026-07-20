
UCLASS()
class UCharacterDefinition_Human_AITestDummy : UCharacterDefinition_Human
{
	default m_CharacterType = GameplayTag::AIAgent_AITestDummy;
	default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;

    default m_InitialGuildEffect = UGE_Guild_Test_AITestDummy;
	default m_AIAbility = UGameplayAbility_CharacterAI_AITestDummy;

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.5f;
	//

	default SetAttributeValue("AttributeSet_Armor.SuperArmor", MAX_flt);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", MAX_flt);
	default SetAttributeValue("AttributeSet_Health.Health", MAX_flt);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", MAX_flt);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"Pelvis";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, -1, 0);
	//

    default m_UniqueName = n"AITestDummy"; 

	// #jfm: modified the AI test dummy to add something to his pouch (pickpocketing test)
	FGameplayTagContainer QuickSlotItemCategories;
    default QuickSlotItemCategories.AddTag(GameplayTag::Item);
    default CreateInventory(EInventoryTypes::Pouch, QuickSlotItemCategories, 0);
    default AddToInventory(UItFo_Apple::StaticClass(), 10, EInventoryTypes::Pouch);

	default m_CharacterVisualsDefinition = UCharacterVisualsDefinition_Human_OC_VLK_Mud_574::StaticClass();

	default m_PouchActorClass = n"Blueprint'/Game/InteractiveObjects/Pouch/BP_Pouch.BP_Pouch_C'";
}