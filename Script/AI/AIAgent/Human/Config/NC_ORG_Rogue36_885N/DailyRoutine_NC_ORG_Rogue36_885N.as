UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue36_885N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue36_885N::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue36_885N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_12");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue36_885N_AfterConvoy : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OW_CONVOY_27");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue36_885N_Shipment : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"EZ_BANDIT_ATTACK");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsOldCamp);
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsHero);
}