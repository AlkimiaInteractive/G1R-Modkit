// mixin bool ShouldAssessDisengage(const UGothicCharacterAIState AIState)
// {
//     if (AIState.AI == nullptr)
//         return false;

//     if (!AIState.AI.bEnableDisengage)
//         return false;

//     float SelfDistance = AIState.AI.PreferredLocationConflictDistanceFromSelf;
//     if (SelfDistance > AIState.AI.DisengageDistanceFromPreferredLocation)
//         return true;

//     if (AIState.CharacterOfInterest == nullptr)
//         return false;

//     float CharacterOfInterestDistance = AIState.AI.GetPreferredLocationConflictDistanceFromCharacter(AIState.CharacterOfInterest);
//     if (CharacterOfInterestDistance > AIState.AI.DisengageDistanceFromPreferredLocation)
//         return true;

//     return false;
// }

// mixin void AssessDisengage(const UGothicCharacterAIState AIState)
// {    
//     if (AIState.AI == nullptr)
//         return;

//     if (!AIState.AI.bEnableDisengage)
//         return;

//     FRememberedPerception Perception;

//     Perception.EventTag = GameplayTag::AIEvent_TooFarFromPreferredLocation;
//     Perception.Origin.Character = AIState.AI.Character;
//     Perception.Instigator.Character = AIState.AI.CharacterOfInterest;
//     Perception.Target.Character = AIState.AI.CharacterOfInterest;
//     Perception.Affected.Character = AIState.AI.Character;

//     AIState.AI.AssessEvent(GameplayTag::AIEvent_TooFarFromPreferredLocation, Perception);
// }

// mixin void EvaluateDisengage(const UGothicCharacterAIState AIState)
// {
//     if (AIState.AI == nullptr)
//         return;
    
//     if (!AIState.AI.bEnableDisengage)
//         return;

//     if (!AIState.ShouldAssessDisengage())
//         return;

//     AIState.AssessDisengage();
// }