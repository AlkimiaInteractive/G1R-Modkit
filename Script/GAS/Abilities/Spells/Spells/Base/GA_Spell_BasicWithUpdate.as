
// USTRUCT(Blueprintable)
// struct FActorSpawnData
// {
// 	UPROPERTY(EditAnywhere, BlueprintReadWrite)
// 	FScriptAsset m_ActorPath = FScriptAsset::OfClass(AActor::StaticClass());

// 	UPROPERTY(EditAnywhere, BlueprintReadWrite)
// 	int m_Amount = 1;
// }

// USTRUCT(Blueprintable)
// struct FObjectSpawnData
// {
// 	UPROPERTY(BlueprintReadWrite, EditAnywhere)
// 	TArray<int> Ids;
// }

// class UGA_Spell_BasicWithUpdate : UGameplayAbilitySpellBasicWithUpdate
// {
//     UPROPERTY(EditAnywhere, BlueprintReadWrite)
// 	TArray<FActorSpawnData> m_ActorsToSpawn; 

// 	UPROPERTY()
// 	TMap<ACharacter, FObjectSpawnData> m_CharactersPendingObjects;

// 	// UPROPERTY(EditAnywhere, BlueprintReadWrite)
// 	// TArray<AActor> m_ActorsSpawned;

//     UPROPERTY()
//     float m_DefaultTargetDistance = 10000.f;

//     UAbilityTask_PlayMontage_Extended m_LaunchSpellMontageTask;

//     UFUNCTION()
//     void SpawnFromTarget(AActor TargetFromSpawn)
//     {
        
//         for(FActorSpawnData& actor_spawn : m_ActorsToSpawn)
//         {
//             UClass asset = actor_spawn.m_ActorPath.GetAssetClass();
//             AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
//             ACharacter target_Character =Cast<ACharacter>(TargetFromSpawn); 
            
//             for(int i = 0; i < actor_spawn.m_Amount; ++i)
//             {
//                 if(!m_CharactersPendingObjects.Contains(target_Character))
//                 {
//                     m_CharactersPendingObjects.Add(target_Character, FObjectSpawnData());
//                 }
                
//                 //m_CharactersPendingObjects[target_Character].Ids.Add(GetNextSpawnId());
                
//                 const FVector pos = GetSpawnPosition(target_Character, actor_default, i, actor_spawn.m_Amount);
//                 const FRotator rot = TargetFromSpawn.GetActorRotation();
//                 SpawnObject(actor_default.Class, pos, rot);
//                 Print(FString("SpawnFromTarget"), 10.f, FLinearColor::Red);
//             }	
//         }
//     }

//     UFUNCTION(BlueprintOverride)
//     void OnActivateSpellServer_Scriptable()
//     {
//         Print(FString("OnActivateSpellServer_Scriptable"), 10.f, FLinearColor::Red);
//         if(IsSpellTargetTypeDynamic())
//         {
//             AActor avatar = GetActorInfo().GetAvatarActor();
//             SpawnFromTarget(avatar);
//         }
//     }

//     UFUNCTION(BlueprintOverride)
//     void OnNewTarget_Scriptable(AActor NewTarget)
//     {
//         Print(FString("OnNewTarget_Scriptable"), 10.f, FLinearColor::Red);
//         if(!IsSpellTargetTypeDynamic())
//         {
//             AActor avatar = GetActorInfo().GetAvatarActor();
//             SpawnFromTarget(avatar);
//         }
//     }

//     // UFUNCTION(BlueprintOverride)
//     // void OnEndSpellServer_Scriptable()
//     // {
//     //     // PlayLaunchSpellMontageAtSection(n"End");

//     //     // if(!IsSpellManaUsageContinuous())
//     //     // {
//     //     //     return;
//     //     // }

//     //     // for(AActor actor : m_ActorsSpawned)
//     //     // {
//     //     //     actor.DestroyActor();
//     //     // }
//     // }

//     UFUNCTION(BlueprintOverride)
//     void OnActorSpawnedServer_Scriptable(AActor ActorSpawned)
//     {
//         if(ActorSpawned == nullptr)
//             return;
//         ActorSpawned.SetOwner(GetActorInfo().GetAvatarActor());
//         // m_ActorsSpawned.Add(ActorSpawned);
	
//         // for (auto& entry : m_CharactersPendingObjects)
//         // {
//         //     if(entry.Value.Ids.Contains(RequestId))
//         //     {
//         //         ActorSpawned.SetOwner(entry.Key);
//         //         ActorSpawned.SetInstigator(entry.Key);
//         //         entry.Value.Ids.Remove(RequestId);
//         //         return;
//         //     }
//         // }
//     }

//     UFUNCTION(BlueprintEvent)
//     FVector GetSpawnPosition(ACharacter OwnerCharacter, AActor SummonActorClass, int Idx, int TotalAmount) const
//     {
//         UCapsuleComponent comp = Cast<UCapsuleComponent>(OwnerCharacter.GetComponentByClass(UCapsuleComponent::StaticClass()));
//         return OwnerCharacter.GetActorLocation() + comp.GetScaledCapsuleHalfHeight() + FVector::UpVector * 2;
//     }

//     void SetOwnerAndInstigator(AActor ActorSpawned)
//     {
//         APawn pawn = Cast<APawn>(GetActorInfo().GetAvatarActor());

//         ActorSpawned.SetOwner(pawn);
//         ActorSpawned.SetInstigator(pawn);
//     }

//     UFUNCTION()
//     void PlayLaunchSpellMontageAtSection(FName section)
//     {
//         //TO Refactor
//         // if(section.IsNone() || m_CurrentAnimData == nullptr)
//         //     return;
//         // if(m_LaunchSpellMontageTask == nullptr)
//         // {
//         //     UAnimMontage montage = m_CurrentAnimData.GetLaunchSpellMontage();
//         //     if(montage != nullptr)
//         //     {
//         //         m_LaunchSpellMontageTask = Task::PlayMontageAndKeepPlayingAfterAbilityEnds(this, montage, section);
//         //         m_LaunchSpellMontageTask.ReadyForActivation();
//         //     }
//         // }
//         // else 
//         // {
//         //     m_LaunchSpellMontageTask.SetNextSectionAfterCurrent(section);
//         // }
//     }

//     UFUNCTION()
//     void StopLaunchSpellMontage()
//     {
//          if(m_LaunchSpellMontageTask != nullptr)
//         {
//             m_LaunchSpellMontageTask.StopPlayingMontage();
//             m_LaunchSpellMontageTask.EndTask();
//         }
//     }

//     UFUNCTION(BlueprintOverride)
//     bool OnShouldFinishSpellAfterActivation_Scriptable()
//     {
//         return !IsSpellManaUsageContinuous() && !IsSpellManaUsageNormalContinuous();
//     }
// }