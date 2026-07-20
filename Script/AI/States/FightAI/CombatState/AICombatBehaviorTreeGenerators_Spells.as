/** Stop casting any spell currently being cast */
UCLASS()
class UCBT_Tree_MagicSpellStopCastingAny : UCBT_Tree
{
    default BaseSortLayer = 0.5f;

    UPROPERTY()
    float MaxRange = 3000.0f;

    UPROPERTY()
    float MinRange = 50.0f;

            
    default PrioritySelector() // OR
                .AddRequirement(UCS_IsCastingSpellConcurrently()) // Only cancel spell if it's concurrent (can be cast while moving and indefinitely)
                .AsPrioritySelector()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    // Not inside distance range for spell
                    .AddRequirement(UCS_React_CurrentMoveHasTag_NotInsideDistanceRange(GameplayTag::Action_CastSpell, MinRange, MaxRange)) 
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    // Not facing the target
                    .AddRequirement(UCS_Not(UCS_FacingEnemy()))
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    // Target already dead
                    .AddRequirement(UCS_EnemyDeadOrDefeated())
                    .ExitToFlowControlNode()
                .DoOperation(UCO_CancelCurrentCombatAction())
                    .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Area)) // Spell is Area spell
                    .AddRequirement(UCS_Not(UCS_EnemyInsideSelectedSpellArea())); // AND Target outside spellcasting area

    default MakeBehavior();
}

UCLASS()
class UCBT_Tree_MagicSpellCasting : UCBT_Tree
{
    default BaseSortLayer = 4.0f;

    UPROPERTY()
    float MaxRange = 2000.0f;

    UPROPERTY()
    float MinRange = 100.0f;

    default Sequence()
                .AddRequirement(UCS_SpellSelected())
                .AddRequirement(UCS_HasDrawnSelectedMagicSpell())
                .AddRequirement(UCS_EnemyInsideDistanceRange(MinRange, MaxRange))
                .AddRequirement(UCS_Or(UCS_Not(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Area)),
                                       UCS_EnemyInsideSelectedSpellArea()))
                .AsSequence()
                .PrioritySelector()
                    .DoMove(UCM_CastSpellOnce())
                        .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Casting_Single))
                        .ExitToFlowControlNode()
                    .DoMove(UCM_CastSpellMultiple(2, 4))
                        .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Casting_Combo))
                        .ExitToFlowControlNode()
                    .DoMove(UCM_CastSpellChargedBasedOnDistance(MinRange, MaxRange))
                        .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Casting_Charged))
                        .ExitToFlowControlNode()
                    .DoMove(UCM_CastSpellForSeconds(4.5f, 6.0f))
                        .AddRequirement(UCS_SelectedSpellHasSpec(GameplayTag::AISpellKeywords_Casting_Sustained));

    default MakeBehavior();
}