class UForceFeedbackEffect_Heavy : UForceFeedbackEffect
{
    FForceFeedbackChannelDetails detail;
    
}

class UMatineeCameraShake_Heavy : ULegacyCameraShake
{
    default OscillationDuration = 0.0f; //0.5f;

    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 1;
    default RotOscillation.Roll.Amplitude = 1;
    default RotOscillation.Roll.Frequency = 1;

    default LocOscillation.X.Amplitude = 10;
    default LocOscillation.X.Frequency = 1;

    default LocOscillation.Y.Amplitude = 10;
    default LocOscillation.Y.Frequency = 1;
    default LocOscillation.Y.Waveform = EOscillatorWaveform::PerlinNoise;

    default FOVOscillation.Amplitude = 3;
    default FOVOscillation.Frequency = 2;
    default FOVOscillation.Waveform = EOscillatorWaveform::PerlinNoise;
}

class UMatineeCameraShake_Low : ULegacyCameraShake
{
    default OscillationDuration = 0.0f; //0.25f;

    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 1;
    default RotOscillation.Roll.Amplitude = 1;
    default RotOscillation.Roll.Frequency = 1;

    default LocOscillation.X.Amplitude = 2;
    default LocOscillation.X.Frequency = 1;

    default LocOscillation.Y.Amplitude = 2;
    default LocOscillation.Y.Frequency = 1;
}

class UMatineeCameraShake_S1H_Light : ULegacyCameraShake
{
    default OscillationDuration = 0.2f; //0.2f;

    default RotOscillation.Pitch.Amplitude = 1;
    default RotOscillation.Pitch.Frequency = 130;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
}

class UMatineeCameraShake_S1H_Heavy : ULegacyCameraShake
{
    default OscillationDuration = 0.15f; //0.2f;

    default RotOscillation.Pitch.Amplitude = 2;
    default RotOscillation.Pitch.Frequency = 80;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 2;
    default RotOscillation.Yaw.Frequency = 40;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 1.5;
    default FOVOscillation.Frequency = 20;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
}

class UMatineeCameraShake_None : ULegacyCameraShake
{
}

/////////////////////////////////
//     MELEE COMBAT SHAKES
/////////////////////////////////

class UMatineeCameraShake_SmashMeatBug : ULegacyCameraShake
{
    default OscillationDuration = 0.099f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.66;

    default RotOscillation.Pitch.Amplitude = 2;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 2;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 9;
    default FOVOscillation.Frequency = 40;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_Additive : ULegacyCameraShake
{
    default OscillationDuration = 0.15f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.66;

    default RotOscillation.Pitch.Amplitude = 1;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 16;
    default FOVOscillation.Frequency = 40;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_Standard : ULegacyCameraShake
{
    default OscillationDuration = 0.15f; //0.2f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.066;

    default RotOscillation.Pitch.Amplitude = 1;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 50; //100;
    default FOVOscillation.Frequency = 1;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_Knockback : ULegacyCameraShake
{
    default OscillationDuration = 0.25f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.15f;

    default RotOscillation.Pitch.Amplitude = 4;
    default RotOscillation.Pitch.Frequency = 200; //160;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 4;
    default RotOscillation.Yaw.Frequency = 200; //160;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 11; //9;
    default FOVOscillation.Frequency = 60; //60;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;  

}

class UMatineeCameraShake_Combat_Parried : ULegacyCameraShake
{ 
    default OscillationDuration = 0.2f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.066f;

    default RotOscillation.Pitch.Amplitude = 1;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 40;
    default FOVOscillation.Frequency = 1;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;  
}

class UMatineeCameraShake_Combat_Deflected : ULegacyCameraShake
{ 
    default OscillationDuration = 0.2f; //0.2f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.066f;

    default RotOscillation.Pitch.Amplitude = 1;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 5;
    default FOVOscillation.Frequency = 4;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;  
}

class UMatineeCameraShake_Combat_RiposteTest : ULegacyCameraShake
{
    default OscillationDuration = 0.25;
    default OscillationBlendInTime = 0.0;
    default OscillationBlendOutTime = 0.2;

    default RotOscillation.Pitch.Amplitude = 2;
    default RotOscillation.Pitch.Frequency = 70;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 2;
    default RotOscillation.Yaw.Frequency = 70;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_Execution : ULegacyCameraShake
{
    default OscillationDuration = 0.15;
    default OscillationBlendInTime = 0.0;
    default OscillationBlendOutTime = 0.033;

    default RotOscillation.Pitch.Amplitude = 0.5;
    default RotOscillation.Pitch.Frequency = 130;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 0.5;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_Execution_Out : ULegacyCameraShake
{
    default OscillationDuration = 0.10;
    default OscillationBlendInTime = 0.0;
    default OscillationBlendOutTime = 0.033;

    default RotOscillation.Pitch.Amplitude = 0.25;
    default RotOscillation.Pitch.Frequency = 60;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 0.25;
    default RotOscillation.Yaw.Frequency = 30;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Combat_HellArms : ULegacyCameraShake
{
    default OscillationDuration = 0.10;
    default OscillationBlendInTime = 0.0;
    default OscillationBlendOutTime = 0.033;

    default RotOscillation.Pitch.Amplitude = 0.20;
    default RotOscillation.Pitch.Frequency = 60;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 0.20;
    default RotOscillation.Yaw.Frequency = 30;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

/////////////////////////////////
//     SLEEPER FIGHT TESTS
/////////////////////////////////

class UMatineeCameraShake_SleeperFight_EndPhase : ULegacyCameraShake
{
    default OscillationDuration = 1.2f;
    default OscillationBlendInTime = 0.2f;
    default OscillationBlendOutTime = 0.7f;

    // default RotOscillation.Pitch.Amplitude = 1;
    // default RotOscillation.Pitch.Frequency = 200; //160;
    // default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    // default RotOscillation.Yaw.Amplitude = 1;
    // default RotOscillation.Yaw.Frequency = 200; //160;
    // default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 2; //11;
    default FOVOscillation.Frequency = 1600; //60;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;  

}

/////////////////////////////////
//     MAGIC TESTS
/////////////////////////////////

class UMatineeCameraShake_Magic_Shot : ULegacyCameraShake
{
    default OscillationDuration = 0.2f;
    default OscillationBlendInTime = 0.1f;
    default OscillationBlendOutTime = 0.2;

    default RotOscillation.Pitch.Amplitude = 2;
    default RotOscillation.Pitch.Frequency = 10;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 0.5;
    default RotOscillation.Yaw.Frequency = 20;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 1.5;
    default FOVOscillation.Frequency = 20;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Magic_Shot2 : ULegacyCameraShake
{
    default OscillationDuration = 0.3f;
    default OscillationBlendInTime = 0.1f;
    default OscillationBlendOutTime = 0.2;

    default RotOscillation.Pitch.Amplitude = 4;
    default RotOscillation.Pitch.Frequency = 10;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 20;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 3;
    default FOVOscillation.Frequency = 20;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_Magic_Shot3 : ULegacyCameraShake
{
    default OscillationDuration = 0.4f;
    default OscillationBlendInTime = 0.1f;
    default OscillationBlendOutTime = 0.2;

    default RotOscillation.Pitch.Amplitude = 4;
    default RotOscillation.Pitch.Frequency = 20;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 40;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 3;
    default FOVOscillation.Frequency = 40;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

class UMatineeCameraShake_MCrawlerQTest : ULegacyCameraShake
{
    default OscillationDuration = 1.2f;
    default OscillationBlendInTime = 0.1f;
    default OscillationBlendOutTime = 0.5;

    default RotOscillation.Pitch.Amplitude = 4;
    default RotOscillation.Pitch.Frequency = 20;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
    
    default RotOscillation.Yaw.Amplitude = 1;
    default RotOscillation.Yaw.Frequency = 40;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;

    default FOVOscillation.Amplitude = 3;
    default FOVOscillation.Frequency = 40;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}

/////////////////////////////
///     RANGED COMBAT
/////////////////////////////
class UMatineeCameraShake_Bow_Release : ULegacyCameraShake
{
    default OscillationDuration = 0.099f;
    default OscillationBlendInTime = 0.0f;
    default OscillationBlendOutTime = 0.66;

    default RotOscillation.Pitch.Amplitude = 2;
    default RotOscillation.Pitch.Frequency = 110;
    default RotOscillation.Pitch.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;
    
    default RotOscillation.Yaw.Amplitude = 2;
    default RotOscillation.Yaw.Frequency = 60;
    default RotOscillation.Yaw.InitialOffset = EInitialOscillatorOffset::EOO_OffsetRandom;   

    default FOVOscillation.Amplitude = 9;
    default FOVOscillation.Frequency = 40;
    default FOVOscillation.InitialOffset = EInitialOscillatorOffset::EOO_OffsetZero;
}