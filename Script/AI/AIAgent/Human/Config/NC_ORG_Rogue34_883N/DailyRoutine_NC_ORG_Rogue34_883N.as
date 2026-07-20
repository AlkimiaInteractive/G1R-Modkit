UCLASS()
class UAIAgentConfig_Human_NC_ORG_Rogue34_883N : UAIAgentConfig_Human
{
	default m_CharacterDefinition = UCharacterDefinition_Human_NC_ORG_Rogue34_883N::StaticClass();

}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue34_883N_Start : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Lurk(), n"FP_OW_CONVOY_14");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue34_883N_AfterConvoy : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_Guard(), n"FP_OW_CONVOY_22");
}

UCLASS()
class UDailyRoutine_NC_ORG_Rogue34_883N_Shipment : UAIState_DailyRoutine_Human
{
    default Schedule(0, 0, UAIState_StandAround(), n"EZ_BANDIT_ATTACK3");
    default TeleportToCurrentTaskWhen = EDailyRoutineTeleportMode::WhenOutOfBounds;
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsOldCamp);
    default RelationshipModifiersToApply.Add(URelationshipModifier_NC_Convoy_TowardsHero);

}