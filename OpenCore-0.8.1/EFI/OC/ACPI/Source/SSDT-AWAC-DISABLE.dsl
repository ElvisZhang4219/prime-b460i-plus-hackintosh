/*
 *  Enables RTC
 *  Conflicts with SSDT-AWAC-HPET-DISABLE, one is required
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "AwacSsdt", 1)
{
    External (STAS, IntObj)
    External (_SB._INI, MethodObj)
    
    If (_OSI ("Darwin") && !CondRefOf(_SB._INI))
    {
        Method (_SB._INI, 0, NotSerialized)
        {
            STAS = One
        }
    }
}
