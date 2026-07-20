
UCLASS()
class UIoRostisserieDefault: UDefaultInteractive
{
	default m_Name = "Rostisserie";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Ambient_RoastScavenger;
};

UCLASS(Abstract)
class AScavengerRotisserie : ARotisserie
{
	default m_InteractiveObjectDefinition.m_DefaultInteraction = GameplayTag::Action_Ambient_RoastScavenger;
}

UCLASS(Abstract)
class ARotisserie : AAnimatedInteractiveObjectActor
{
	default m_InteractiveObjectDefinition.m_Name = "Rotisserie";
	default m_InteractiveObjectDefinition.m_Icon = "Apfel2DIcon";
	default m_InteractiveObjectDefinition.m_Description = "ApfelDesc";

    /** Animation montage that contains our turning animations. */
    UPROPERTY(Category = Animation)
    UAnimMontage MontageToPlay;

    /** Montage section name for when we're TurnedUp (should be a loop) */
    UPROPERTY(Category = Animation)
    FName SectionNameTurnedUp = n"TurnedUp";
    
    /** Montage section name for when we're TurnedDown (should be a loop) */
    UPROPERTY(Category = Animation)
    FName SectionNameTurnedDown = n"TurnedDown";

    /** Montage section name to turn the rotisserie up (Should lead to TurnedUp-loop) */
    UPROPERTY(Category = Animation)
    FName SectionNameTurnUp = n"TurnUp";
    
    /** Montage section name to turn the rotisserie down (Should lead to TurnedDown-loop) */
    UPROPERTY(Category = Animation)
    FName SectionNameTurnDown = n"TurnDown";

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        PlayAnimationMontage(MontageToPlay, SectionNameTurnedDown);
    }

    UFUNCTION()
    bool IsTurnedUp() const { return CurrentMontageSection == SectionNameTurnedUp; }

    UFUNCTION()
    bool IsTurnedDown() const { return CurrentMontageSection.IsNone() || CurrentMontageSection == SectionNameTurnedDown; }

    UFUNCTION()
    bool IsBeingTurned() const { return !IsTurnedUp() && !IsTurnedDown(); }


    UFUNCTION()
    bool CanTurnUpNow() const { return IsTurnedDown(); }

    UFUNCTION()
    bool CanTurnDownNow() const { return IsTurnedUp(); }


    UFUNCTION()
    void TurnUp()
    {
        if (!CanTurnUpNow())
            return;

        PlayAnimationMontage(MontageToPlay, SectionNameTurnUp);
    }

    UFUNCTION()
    void TurnDown()
    {
        if (!CanTurnDownNow())
            return;

        PlayAnimationMontage(MontageToPlay, SectionNameTurnDown);
    }
}


UCLASS()
class UAbilityTask_Interaction_Rotisserie : UAbilityTask_InteractionSpot_Montage
{
    UPROPERTY()
    TSoftObjectPtr<UAnimMontage> RoastMontage;

    default AutoTransitionCheckSecondsMin = 0.5f;
    default AutoTransitionCheckSecondsMax = 2.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
		MainMontage = RoastMontage;
		
        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"TurnUp"));
        Transitions.Last().bSeamless = false;
        Transitions.Last().Condition.BindUFunction(GetRotisserie(), n"CanTurnUpNow");
        Transitions.Last().OnTransition.BindUFunction(GetRotisserie(), n"TurnUp");

        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"TurnDown"));
        Transitions.Last().bSeamless = false;
        Transitions.Last().Condition.BindUFunction(GetRotisserie(), n"CanTurnDownNow");
        Transitions.Last().OnTransition.BindUFunction(GetRotisserie(), n"TurnDown");

        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"Spicefy"));
        Transitions.Last().CooldownSeconds = 40.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().Probability = 0.5f;
        
        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"Smell"));
        Transitions.Last().CooldownSeconds = 40.0f;
        Transitions.Last().Probability = 0.5f;
        Transitions.Last().bSeamless = false;
        
        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"Kick"));
        Transitions.Last().CooldownSeconds = 40.0f;
        Transitions.Last().Probability = 0.5f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(RoastMontage, n"Loop", n"TakeMeat"));
        Transitions.Last().CooldownSeconds = 40.0f;
        Transitions.Last().Probability = 0.5f;
        Transitions.Last().bSeamless = false;
    }

    ARotisserie GetRotisserie() const
    {
        return Cast<ARotisserie>(GetUsedActor());
    }
}
