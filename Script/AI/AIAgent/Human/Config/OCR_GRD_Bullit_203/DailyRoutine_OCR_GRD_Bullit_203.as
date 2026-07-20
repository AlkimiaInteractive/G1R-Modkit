UCLASS()
class UAIAgentConfig_Human_OCR_GRD_Bullit_203 : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_OCR_GRD_Bullit_203::StaticClass();

}

UCLASS()
class UDailyRoutine_OCR_GRD_Bullit_203_Ownership : UAIState_DailyRoutine_Human
{
    default KnownPlaces.Add(Location::Bed, n"IO_OC_BED_BULLIT");
    default KnownPlaces.Add(Location::Home, n"IO_OC_BED_BULLIT");
}

UCLASS()
class UDailyRoutine_OCR_GRD_Bullit_203_Start : UDailyRoutine_OCR_GRD_Bullit_203_Ownership
{
    default Schedule(3, 0, UAIState_Sleep(), Location::Bed);
    default Schedule(8, 0, UAIState_Drink(), n"IO_OC_CHAIR_BENCH_37");
    default Schedule(23, 45, UAIState_Guard_Watch_Patrolling_Route_Bullit(), n"BreadcrumbActor_OC_Drunk_1");
    default Schedule(1, 00, UAIState_PeeDrunk(), n"FP_OW_OC_PEE_2");
}

class UAIState_PeeDrunk : UAIState_RandomInteractions 
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Drugs_Forced_Alcohol_High);
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee));
}

UCLASS()
class UDailyRoutine_OCR_GRD_Bullit_203_Ot : UDailyRoutine_OCR_GRD_Bullit_203_Ownership
{
    default Schedule(7, 0, UAIState_Guard(), n"FP_OC_GUARDPASSAGE_43");
    default RolesWhileAssigned.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

