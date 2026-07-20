
UCLASS(meta = (DisplayName = "Graphics - Upscaling Quality AS"))
class USettingObject_Enum_UpscalingQuality_AS : USettingObject_Enum_UpscalingQuality
{
    /////////////////////  NO UPSCALING ////////////////////////////
    default m_UpscalingNone = 50;

    /////////////////////  DLSS ////////////////////////////
    //Performance
    default m_SharpeningDLSS.Add(25);
    //Balanced
    default m_SharpeningDLSS.Add(50);
    //Quality
    default m_SharpeningDLSS.Add(75);
    //Native
    default m_SharpeningDLSS.Add(100);
    
    /////////////////////  FSR ////////////////////////////
    //Ulltra Performance
    default m_SharpeningFSR.Add(20);
    //Performance
    default m_SharpeningFSR.Add(40);
    //Balanced
    default m_SharpeningFSR.Add(60);
    //Quality
    default m_SharpeningFSR.Add(80);
    //Native
    default m_SharpeningFSR.Add(100);

     /////////////////////  XeSS ////////////////////////////
    //Ulltra Performance
    default m_SharpeningXeSS.Add(14);
    //Performance
    default m_SharpeningXeSS.Add(28);
    //Balanced
    default m_SharpeningXeSS.Add(42);
    //Quality
    default m_SharpeningXeSS.Add(57);
    //Utra Quality
    default m_SharpeningXeSS.Add(71);
    //Ultra Quality Plus
    default m_SharpeningXeSS.Add(85);
    //Native
    default m_SharpeningXeSS.Add(100);

    /////////////////////  TSR ////////////////////////////
    //Ulltra Performance
    default m_SharpeningTSR.Add(20);
    //Performance
    default m_SharpeningTSR.Add(40);
    //Balanced
    default m_SharpeningTSR.Add(60);
    //Quality
    default m_SharpeningTSR.Add(80);
    //Native
    default m_SharpeningTSR.Add(100);
}