class UMatineeCameraShake_MonasteryTroll_Arrival : ULegacyCameraShake
{
    default OscillationDuration = 1.6f;
    default OscillationBlendInTime = 0.05f;
    default OscillationBlendOutTime = 0.4f;

    default LocOscillation.X.Amplitude = 6;
    default LocOscillation.X.Frequency = 35;
    default LocOscillation.X.Waveform = EOscillatorWaveform::PerlinNoise;
    default LocOscillation.Y.Amplitude = 6;
    default LocOscillation.Y.Frequency = 35;
    default LocOscillation.Y.Waveform = EOscillatorWaveform::PerlinNoise;
    default LocOscillation.Z.Amplitude = 8;
    default LocOscillation.Z.Frequency = 30;
    default LocOscillation.Z.Waveform = EOscillatorWaveform::PerlinNoise;

    default RotOscillation.Pitch.Amplitude = 1.5;
    default RotOscillation.Pitch.Frequency = 25;
    default RotOscillation.Yaw.Amplitude = 1.5;
    default RotOscillation.Yaw.Frequency = 25;
    default RotOscillation.Roll.Amplitude = 1.0;
    default RotOscillation.Roll.Frequency = 25;
}
