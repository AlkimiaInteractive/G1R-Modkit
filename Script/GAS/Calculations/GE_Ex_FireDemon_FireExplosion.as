// class UGE_Ex_FireDemon_FireExplosion_BurnCalculator : UGE_ExecutionCalculationBase
// {
//     UFUNCTION(BlueprintOverride)
//     void Execute(const FGameplayEffectCustomExecutionParameters& ExecutionParams, FGameplayEffectCustomExecutionOutput& OutExecutionOutput) const
//     {
//         // Get the gameplay ability component of both source and target
//         UGothicAbilitySystemComponent targetAbComp = Cast<UGothicAbilitySystemComponent>(ExecutionParams.GetTargetAbilitySystemComponent());
        
//         AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
//         float minFireResistance = 20.f;

//         if(target == nullptr)
//             return;

//         // If we have to perform damages we apply them to the corresponding health properties
//         //Check the resistance of fire. TODO
//         if (target.GetArmorAttribute_Resistance_Fire() < minFireResistance)
//         {
//             // Apply condition gameplay effects
//             // This notify that the conditional gameplay event will be executed
//             OutExecutionOutput.MarkConditionalGameplayEffectsToTrigger();
//         }
//     }
// }