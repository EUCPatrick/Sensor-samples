# Check the device type (Laptop, Desktop or VM)
try {
    # Get the chassis type using WMI
    $chassis = Get-WmiObject -Class Win32_SystemEnclosure | Select-Object -ExpandProperty ChassisTypes

    # Chassis type mapping
    $laptopChassisTypes = @(8, 9, 10, 14, 18, 21) # Chassis types typically associated with laptops
    $desktopChassisTypes = @(3, 4, 5, 6, 7, 15, 16) # Chassis types typically associated with desktops
    $VMChassisTypes = @(1) # Chassis types typically associated with VMs

    # Determine the device type
    if ($chassis -in $laptopChassisTypes) {
        $Result="Laptop"
    } elseif ($chassis -in $desktopChassisTypes) {
        $Result="Desktop"
    } elseif ($chassis -in $VMChassisTypes) {
        $Result="VM"
    } else {
        $Result="Unknown chassis category. Chassis Type: $chassis"
    }
} catch {
    $Result="Error no chassis type information."
}
return $Result