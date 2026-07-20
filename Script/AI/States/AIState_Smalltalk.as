
// UCLASS()
// class UAIGroup_Smalltalk : UGothicAIGroup
// {
//     float NextTimeSomebodyShouldSaySomething = 0.0f;
//     float TimeBetweenSentencesMin = 8.0f;
//     float TimeBetweenSentencesMax = 18.0f;
//     int NextSpeakerIndex = 0;

//     void SomebodySaidASentence()
//     {
//         NextSpeakerIndex = Math::Rand() % JoinedCharacters.Num() ;
//         NextTimeSomebodyShouldSaySomething = World.TimeSeconds + Math::RandRange(TimeBetweenSentencesMin, TimeBetweenSentencesMax);
//     }

//     bool ShouldISaySomething(AGothicCharacter Me)
//     {
//         if (JoinedCharacters.Num() <= 1)
//             return false;

//         if (World.TimeSeconds < NextTimeSomebodyShouldSaySomething)
//             return false;

//         if (JoinedCharacters[NextSpeakerIndex % JoinedCharacters.Num()] != Me)
//             return false;

//         return true;
//     }
// }

// UCLASS()
// class UAIState_Smalltalka : UGothicCharacterAIState
// {
//     UPROPERTY()
//     FGameplayTagContainer SmalltalkSVMs;

//     UPROPERTY()
//     float SmalltalkFreepointFindRadius = 2500.0f;

//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence01);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence02);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence03);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence04);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence05);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence06);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence07);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence08);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence09);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence10);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence11);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence12);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence13);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence14);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence15);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence16);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence17);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence18);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence19);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence20);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence21);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence22);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence23);
//     default SmalltalkSVMs.AddTag(GameplayTag::Sound_SVM_Smalltalk_Sentence24);

//     bool bHasFreepoint = false;
//     FInteractionSpotHandle SmalltalkFreepoint;

//     void JoinSmalltalk()
//     {
//         if (!SmalltalkFreepoint.IsSet())
//         {
//             auto Available = InteractionSpots::FindSpotsInRadius(Self.ActorLocation, SmalltalkFreepointFindRadius);

//             FInteractionSpotHandle SpotToUse;

//             for (auto& Spot : Available)
//             {
//                 if (Spot.CanBeClaimedBy(Self, GameplayTag::Action_Smalltalk))
//                 {
//                     SpotToUse = Spot;
//                     break;
//                 }
//             }

//             if (!SpotToUse.IsSet())
//                 return;

//             if (!InteractionSpots.ClaimSpot(SpotToUse, Self, GameplayTag::Action_Smalltalk))
//                 return;

//             SmalltalkFreepoint = SpotToUse;

//             AI.GotoPosition(SpotToUse.Location);
//         }

//         if (SmalltalkFreepoint.IsSet())
//         {
//             AI.LeaveGroupsWithClass(UAIGroup_Smalltalk::StaticClass());

//             // If people are already talking, join them. Otherwise, create a new smalltalk-group for other people to join.
//             AI.JoinGroupOfSensedCharactersOrCreateOne(UAIGroup_Smalltalk::StaticClass(), 2, 600.0f);
//         }
//     }

//     UAIGroup_Smalltalk GetSmalltalkGroup()
//     {
//         return Cast<UAIGroup_Smalltalk>(AI.GetGroupStatus(UAIGroup_Smalltalk::StaticClass()));
//     }

//     UFUNCTION(BlueprintOverride)
//     void DoTask()
//     {
//         AI.GotoPreferredLocation();

//         while (GetSmalltalkGroup() == nullptr || GetSmalltalkGroup().JoinedCharacters.Num() <= 1)
//         {
//             if (bShouldExitState)
//                 return;

//             JoinSmalltalk();

//             WaitSeconds(Math::RandRange(3.0f, 5.0f));
//         }

//         while (!bShouldExitState)
//         {
//             if (GetSmalltalkGroup().ShouldISaySomething(Self))
//             {
//                 GetSmalltalkGroup().SomebodySaidASentence();
//                 SayRandomSmalltalkSentence();
//             }

//             Self.SetActorRotation(FRotator::MakeFromX(GetSmalltalkGroup().GroupCenterLocation - Self.ActorLocation));

//             WaitSeconds(Math::RandRange(3.0f, 5.0f));
//         }
//     }

//     UFUNCTION()
//     void SayRandomSmalltalkSentence() const
//     {
//         if (SmalltalkSVMs.Num() == 0)
//             return;

//         FGameplayTag Sentence = SmalltalkSVMs.GameplayTags[Math::Rand() % SmalltalkSVMs.GameplayTags.Num()];

//         USoundActorComponent SoundComponent = USoundActorComponent::Get(Self);

//         if (SoundComponent == nullptr)
//             return;

//         SoundComponent.PlaySVMSound(Sentence);

//         // GetSmalltalkGroup().DebugDrawGroup(5.0f);
//     }

//     UFUNCTION(BlueprintOverride)
//     void OnDestroy(bool bInOwnerFinished)
//     {
//         InteractionSpots.UnclaimSpot(SmalltalkFreepoint, Self);
//     }
// }

UCLASS()
class UAIState_Smalltalk : UAIState_RandomInteractions_Human
{
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Offering);
    default Interactions.Add(FInteraction(GameplayTag::Action_Smalltalk));
    default Interactions.Last().Priority = 2;

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_WaitSmalltalk, InDurationSeconds = 5.0));
    default Interactions.Last().Priority = 1;
}

UCLASS()
class UAIState_SmalltalkWhileRain : UAIState_Smalltalk
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        bool shouldReactToRain = false;
        bool shouldRRun = false;


        if(Math::RandRange(0.0f,1.0f) < 0.70f)
        {
            shouldReactToRain = true;
        }

        if(Math::RandRange(0.0f,1.0f) < 0.90f)
        {
            shouldRRun = true;
         }

        while(!bShouldExitState)
        {
            if(shouldReactToRain && Self != nullptr && Self.IsInRain(2))
            {
                if(shouldRRun)
                {
                    SetWalkSpeed(EWalkSpeed::Running);
                }
                
                // Don't try to activate again if already CoveringHead
                if(!Self.HasGameplayTag(GameplayTag::State_CoveringHead))
                {
                    FGameplayEventData Payload;
                    GothicGAS::AddRainCoverHeadData(Payload, 2);
                    GothicGAS::SendGameplayEvent(CharacterState, GameplayTag::Action_CoverInRain, Payload);
                }
            }

            WaitSeconds(0.5);
        }
    }
}

UCLASS()
class USmallTalkAnimNotify : UAnimNotify
{

}

