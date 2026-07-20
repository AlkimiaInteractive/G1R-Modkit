// UCLASS()
// class UAICombatTargetScoringEntry_TargetGoblinsForGrabGoblinAttack : UGothicAICombatTargetScoringEntry
// {
//     default Description = "Prioritize goblins if GrabGoblin Attack is selected";

//     UFUNCTION(BlueprintOverride)
//     float CalculateScore(const AGothicCharacter Character) const
//     {
//         auto TrollCombat = Cast<UAIState_Combat_G1R>(AI.CurrentRootState);
//         if (TrollCombat == nullptr)
//             return 0.0f;

//         if (TrollCombat.SelectedAttack == nullptr)
//             return 0.0f;

//         if (!TrollCombat.SelectedAttack.IsA(UCM_Attack_TrollAdult_GoToGoblin))
//             return 0.0f;

//         if (!Character.IsSpecies(GameplayTag::Species_Creature_Goblin))
//         {
//             if (Character.GetDistanceTo(AI.Self) < 400.0f)
//                 return 1.0f;

//             return -1.0f;
//         }

//         return 3.0f;
//     }
// }