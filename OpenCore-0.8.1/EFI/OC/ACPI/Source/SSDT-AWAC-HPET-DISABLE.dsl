/*
 *  Enables RTC and also disables HPET
 *  Conflicts with SSDT-AWAC-DISABLE, one is required
 */

DefinitionBlock ("", "SSDT", 1, "vulgo", "AwacHpet", 1)
{
    External (STAS, IntObj)
    External (HPTE, IntObj)
    External (_SB._INI, MethodObj)
    
    If (_OSI ("Darwin") && !CondRefOf(_SB._INI))
    {
        Method (_SB._INI, 0, NotSerialized)
        {
            STAS = One
            HPTE = Zero
        }
    }
}
