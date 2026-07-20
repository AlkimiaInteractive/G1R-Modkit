UCLASS()
class UGE_Pettable_Wolf : UGameplayEffect_AbilitySet
{
    default AddAbility(UGameplayAbilityGetPettedWhileLaying::StaticClass());
    default AddAbility(UGA_ManagePetInteractiveObject_Wolf::StaticClass());
    default AddAbility(UGA_GetPettedWhileStanding_Wolf::StaticClass());
}

UCLASS()
class UGE_Pettable_Scavenger : UGameplayEffect_AbilitySet
{
    default AddAbility(UGameplayAbilityGetPettedWhileLaying::StaticClass());
    default AddAbility(UGA_ManagePetInteractiveObject_Scavenger::StaticClass());
    default AddAbility(UGA_GetPettedWhileStanding_Scavenger::StaticClass());
}