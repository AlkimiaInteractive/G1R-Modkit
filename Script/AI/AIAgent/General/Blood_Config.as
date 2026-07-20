UCLASS()
class UHumanBlood : UCharacterBloodSettings
{
    default m_BloodColor = FLinearColor(0.0625, 0.0f, 0.0f, 1.0f);
    default m_CanDecompose = true;
    default m_HasBlood = true;
}

UCLASS()
class UPlayerBloodConfig : UHumanBlood
{
    default m_CanDecompose = false;
}

class UCreatureBlood : UCharacterBloodSettings
{
    default m_CanDecompose = true;
    default m_HasBlood = true;
}

UCLASS()
class UCreatureBlood_Red : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.0625, 0.0f, 0.0f, 1.0f);
}

UCLASS()
class UCreatureBlood_Blue : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.019830,0.022712,0.088542,1.000000);
}

UCLASS()
class UCreatureBlood_Purple : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.059502,0.010254,0.093750,1.000000);
}

UCLASS()
class UCreatureBlood_Yellow : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.223958,0.210720,0.055990,1.000000);
}

UCLASS()
class UCreatureBlood_Black : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.000000,0.000000,0.000000,1.000000);
}

UCLASS()
class UCreatureBlood_None : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0,0,0,0);
    default m_HasBlood = false;
    default m_CanDecompose = false;
}

UCLASS()
class UCreatureBlood_Light : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.593750,0.580880,0.442220,1.000000);
}

UCLASS()
class UCreatureBlood_Green : UCreatureBlood
{
    default m_BloodColor = FLinearColor(0.045176,0.083333,0.015625,1.000000);
}