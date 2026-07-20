UCLASS()
class UAbilityTask_Interaction_Golem_Stone_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemStone::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/TEMP/A_StoneGolem_Invoked_Temp_Montage.A_StoneGolem_Invoked_Temp_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Golem_Stone_StandAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemStone::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    //default bPossibleAnywhere = true;
    
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/GeneralIdles/StoneGolem_Idle_Montage.StoneGolem_Idle_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Golem_Ice_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemIce::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    //default bPossibleAnywhere = true;
    
    //default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/TEMP/A_StoneGolem_Invoked_Temp_Montage.A_StoneGolem_Invoked_Temp_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Golem_Ice_StandAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemIce::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    //default bPossibleAnywhere = true;
    
    //default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/GeneralIdles/StoneGolem_Idle_Montage.StoneGolem_Idle_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Golem_Fire_StandAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemFire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    //default bPossibleAnywhere = true;
    
    //default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Stone_Golem/GeneralIdles/StoneGolem_Idle_Montage.StoneGolem_Idle_Montage'";
}