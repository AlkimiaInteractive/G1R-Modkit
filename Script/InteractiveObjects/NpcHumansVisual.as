UCLASS(Abstract)
class UArmorVisualsDefinition_Human_Base : UArmorVisualsDefinition
{
    default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Humans/Prebaked/";

	UPROPERTY()
	FString Person;
	UPROPERTY()
	FString Clothes;

	UPROPERTY()
	FString Shirt = "None";
	UPROPERTY()
	FString Belt = "None";
	UPROPERTY()
	FString Pants = "None";
	UPROPERTY()
	FString Arms = "None";
	UPROPERTY()
	FString Skirt = "None";
	UPROPERTY()
	FString Boots = "None";
	UPROPERTY()
	FString Bracelet = "None";
	UPROPERTY()
	FString Necklace = "None";
	UPROPERTY()
	FString Accessories = "None";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_Women : UArmorVisualsDefinition_Human_Base
{
	default m_MutableAsset = "MO_CharactersWomen";

	UPROPERTY()
	FString Shoulders = "None";
	UPROPERTY()
	FString LegProtections = "None";
	UPROPERTY()
	FString Underwear = "None";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_Human : UArmorVisualsDefinition_Human_Base
{
	default m_MutableAsset = "MO_Player";
	
	UPROPERTY()
	FString Eye_Color = "Eye_Color_01";
	UPROPERTY()
	FString Eyebrows = "Eyebrows_01";
	UPROPERTY()
	FString Hair_Color = "Hair_Color_01";
	UPROPERTY()
	FString Skin_Color = "Skin_Color_01";
	UPROPERTY()
	FString Teeth = "Teeth_01";
	UPROPERTY()
	FString BodyType = "Type01";
	
	UPROPERTY()
	FString Poncho = "None";
	UPROPERTY()
	FString Goatee = "None";
	UPROPERTY()
	FString Hair = "None";
	UPROPERTY()
	FString Moustache = "None";
	UPROPERTY()
	FString SideBurn = "None";
	UPROPERTY()
	FString Stubblecaps = "None";
	UPROPERTY()
	FString Armor = "None";
	UPROPERTY()
	FString Forearm_L = "None";
	UPROPERTY()
	FString Forearm_R = "None";
	UPROPERTY()
	FString Hand_L = "None";
	UPROPERTY()
	FString Hand_R = "None";
	UPROPERTY()
	FString Bag = "None";
	UPROPERTY()
	FString LegProtection_L = "None";
	UPROPERTY()
	FString LegProtection_R = "None";
	UPROPERTY()
	FString LegProtections = "None";
	UPROPERTY()
	FString Boot_L = "None";
	UPROPERTY()
	FString Boot_R = "None";
	UPROPERTY()
	FString Head = "None";
	UPROPERTY()
	FString Forearms = "None";
	UPROPERTY()
	FString Shoulders = "None";
	UPROPERTY()
	FString Knees = "None";
	UPROPERTY()
	FString Scarve = "None";
	UPROPERTY()
	FString Fur = "None";
	UPROPERTY()
	FString Cape = "None";
	UPROPERTY()
	FString Hands = "None";
	UPROPERTY()
	FString UnderBelt = "None";
	UPROPERTY()
	FString Tassets = "None";
	UPROPERTY()
	FString TassetsRear = "None";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_MaleNPC : UArmorVisualsDefinition_Human
{
	default m_MutableAsset = "MO_Characters";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_InExtremo : UArmorVisualsDefinition
{
	default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Humans/Prebaked/";
	
	default m_MutableAsset = "MO_InExtremo";

	UPROPERTY()
	FString BodyType = "None";
	UPROPERTY()
	FString Clothes = "None";
	UPROPERTY()
	FString Person = "None";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_Armor : UArmorVisualsDefinition
{
	default m_MutableAsset = "MO_Player";
	default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Humans/Prebaked/";

	UPROPERTY()
    FString Hair = "Hair_05";
}

UCLASS(Abstract)
class UArmorVisualsDefinition_Zombie : UArmorVisualsDefinition
{
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Creatures/Zombie/Prebaked/";
}
