UCLASS()
class UMusicRegionTrait_CustomValueByPopulationInRegion : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MinimalCharacterAmount = 0;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MaximalCharacterAmount = 10;
    
    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithTags;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithoutTags;

    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
        TArray<AActor> ActorsInRegion; 
        Cast<AVolume>(GetOuter()).BrushComponent.GetOverlappingActors(ActorsInRegion);
        
        int32 MatchingCharacterAmount = 0;
        for (AActor FoundActor : ActorsInRegion)
        {
            AGothicCharacter FoundCharacter = Cast<AGothicCharacter>(FoundActor);

            if (FoundCharacter == nullptr)
                continue;
            
            if (!FoundCharacter.HasAllGameplayTags(WithTags))
                continue;

            if (FoundCharacter.HasAnyGameplayTags(WithoutTags))
                continue;

            MatchingCharacterAmount++;
        }

        float FixedMax = MaximalCharacterAmount - MinimalCharacterAmount;
        float FixedNum = MatchingCharacterAmount - MinimalCharacterAmount;
        float Alpha = FixedNum / FixedMax;

        return Math::Lerp(0.0f, 1.0f, Alpha);
    }
}

UCLASS()
class UMusicRegionTrait_CustomValueByCharactersCloseToPlayer : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MinimalCharacterAmount = 0;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MaximalCharacterAmount = 10;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    float SearchRadius = 1000.0f;
    
    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithTags;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithoutTags;

    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
        FVector PlayerLocation = GetPlayerCharacter().ActorLocation;
        TArray<AActor> ActorsInRegion = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter, PlayerLocation, SearchRadius);
        
        int32 MatchingCharacterAmount = 0;
        for (AActor FoundActor : ActorsInRegion)
        {
            AGothicCharacter FoundCharacter = Cast<AGothicCharacter>(FoundActor);

            if (FoundCharacter == nullptr)
                continue;

            if (FoundCharacter == GetPlayerCharacter())
                continue;
            
            if (!FoundCharacter.HasAllGameplayTags(WithTags))
                continue;

            if (FoundCharacter.HasAnyGameplayTags(WithoutTags))
                continue;

            MatchingCharacterAmount++;

            if (MatchingCharacterAmount == MaximalCharacterAmount)
                break;
        }

        float FixedMax = MaximalCharacterAmount - MinimalCharacterAmount;
        float FixedNum = Math::Max (0.0f, MatchingCharacterAmount - MinimalCharacterAmount);
        float Alpha = FixedNum / FixedMax;

        return Math::Lerp(0.0f, 1.0f, Alpha);
    }
}

UCLASS()
class UMusicRegionTrait_CustomValueByCharactersSensingPlayer : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MinimalCharacterAmount = 0;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MaximalCharacterAmount = 10;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithTags;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    FGameplayTagContainer WithoutTags;

    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
        TArray<AGothicCharacter> PerceivingCharacters = GetPlayerCharacter().Perception.GetCharactersPerceivingMe(EPerceptionSense::None, WithTags, WithoutTags);

        float FixedMax = MaximalCharacterAmount - MinimalCharacterAmount;
        float FixedNum = Math::Max (0.0f, PerceivingCharacters.Num() - MinimalCharacterAmount);
        float Alpha = Math::Min (1.0f , FixedNum / FixedMax);

        return Math::Lerp(0.0f, 1.0f, Alpha);
    }

}
UCLASS()
class UMusicRegionTrait_CustomValueByItemCountInRegion : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MinimalItemAmount = 0;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    int32 MaximalItemAmount = 10;
    
    UPROPERTY(EditAnywhere, Category=CustomValue)
    TSubclassOf<AItemVisualWorld> ItemClass;

    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
        TArray<AActor> ItemsInRegion; 
        Cast<AVolume>(GetOuter()).BrushComponent.GetOverlappingActors(ItemsInRegion, AItemVisualWorld);
        
        int32 MatchingItemAmount = 0;
        for (AActor FoundActor : ItemsInRegion)
        {
            if (FoundActor == nullptr)
                continue;

            if (!FoundActor.IsA(ItemClass))
                continue;    

            MatchingItemAmount++;
        }

        float FixedMax = MaximalItemAmount - MinimalItemAmount;
        float FixedNum = MatchingItemAmount - MinimalItemAmount;
        float Alpha = FixedNum / FixedMax;

        return Math::Lerp(0.0f, 1.0f, Alpha);
    }
}

UCLASS()
class UMusicRegionTrait_CustomValueByInteractionSpotDistance : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    TArray<FInteractionSpotHandle> InteractionSpots;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    float MaxDistanceThreshold = 1000.0f;

    UPROPERTY(EditAnywhere, Category=CustomValue)
    float MinDistanceThreshold = 400.0f;

    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
        FInteractionSpotHandle ClosestHotSpot;

        for (auto Spot : InteractionSpots)
        {
            if (!ClosestHotSpot.IsSet())
            {
                ClosestHotSpot = Spot;
                continue;
            }

            if (Spot.GetDistanceToActor(PlayerCharacter) < ClosestHotSpot.GetDistanceToActor(PlayerCharacter))
            {
                ClosestHotSpot = Spot;
            }
        }

        float Distance = ClosestHotSpot.GetDistanceToActor(PlayerCharacter);
        
        if (Distance <= MinDistanceThreshold)
        {
            return 1.0f;
        }

        float FixedMax = MaxDistanceThreshold - MinDistanceThreshold;
        float FixedDistance = Distance - MinDistanceThreshold;
        float Alpha = FixedDistance / FixedMax;

        return Math::Lerp(1.0f, 0.0f, Alpha);;
    }
}

UCLASS()
class UMusicRegionTrait_CustomValueByStoryChapter : UMusicRegionTrait
{
    UPROPERTY(EditAnywhere, Category=CustomValue)
    TArray<float32> CustomValueByChapter;
    
    UFUNCTION(BlueprintOverride)
    float32 GetCustomValue() const
    {
        auto Story = UGameStory::GetMainStory();

        if (!IsValid(Story))
            return 0.0f;

        if (!CustomValueByChapter.IsValidIndex(Story.Chapter))
            return 0.0f;

        return CustomValueByChapter[Story.Chapter];
    }
}

UCLASS()
class UMusicRegionTrait_Firemages : UMusicRegionTrait
{
    UFUNCTION(BlueprintOverride)
    float GetCustomValue() const
    {
#ifdef WITH_STORY_G1R

        auto Story = G1R::UStoryG1R::Get();

        if (IsValid(Story) && Story.FireMagesDead == 1)
            return 0.0f;

#endif

        return 1.0f;
    }
}