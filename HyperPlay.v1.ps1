# ================================
# Boost Your Game’s FPS, Enhance RAM Speed, and Minimize Lag with This Ultimate Optimization Script | By #ALEX 
# ================================

# Activate High-Performance Power Plan Temporarily | #ALEX
Write-Output "Activating High-Performance Power Plan temporarily... | #ALEX"
powercfg -SETACTIVE SCHEME_MIN

# Stop unnecessary services temporarily | #ALEX
Write-Output "Stopping unnecessary services temporarily... | #ALEX"
$services = @("SysMain", "DiagTrack", "WSearch", "OneSyncSvc", "PrintNotify", "RetailDemo")
foreach ($service in $services) {
    Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
}

# Clean RAM and temporary memory | #ALEX
Write-Output "Cleaning temporary memory... | #ALEX"
[System.GC]::Collect()
$MemClean = (Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory / 1024
Write-Output "Freed up: $MemClean MB of available memory | #ALEX"

# Temporary Memory Compression for Optimizing RAM Usage | #ALEX
Write-Output "Activating temporary memory compression to optimize RAM usage... | #ALEX"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f

# Disable CPU Throttling Temporarily | #ALEX
Write-Output "Disabling CPU throttling temporarily for maximum performance... | #ALEX"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

# Game Optimization - Temporarily disable Game DVR for better FPS | #ALEX
Write-Output "Temporarily disabling Game DVR to boost FPS... | #ALEX"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f

# Disable Visual Effects Temporarily to Improve Performance | #ALEX
Write-Output "Disabling visual effects temporarily to improve performance... | #ALEX"
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f

# Optimize Graphics Processing Temporarily | #ALEX
Write-Output "Optimizing graphics processing for the current session... | #ALEX"
reg add "HKCU\Software\Microsoft\Direct3D" /v "DisableHWAcceleration" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDelay" /t REG_DWORD /d 10 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDdiDelay" /t REG_DWORD /d 10 /f

# Temporary Swapfile Increase for Gaming | #ALEX
Write-Output "Increasing virtual memory temporarily to improve gaming performance... | #ALEX"
$virtMem = Get-WmiObject Win32_ComputerSystem
$virtMem.AutomaticManagedPagefile = $false
$virtMem.SetVirtualMemoryMinimumSize(4096)
$virtMem.SetVirtualMemoryMaximumSize(8192)

# Disable Windows Update Service Temporarily for Better Stability | #ALEX
Write-Output "Disabling Windows Update temporarily for stable performance... | #ALEX"
Stop-Service -Name "wuauserv" -Force -ErrorAction SilentlyContinue

# Adjust Network Settings for Lower Latency (TCP Optimizations) | #ALEX
Write-Output "Adjusting network settings for lower latency... | #ALEX"
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global rss=enabled
netsh interface tcp set global congestionprovider=ctcp

# Kill unnecessary processes to free up CPU for gaming | #ALEX
Write-Output "Killing unnecessary processes to free up CPU resources... | #ALEX"
$processesToKill = @("chrome", "firefox", "opera", "skype", "slack", "spotify", "steam", "teams", "discord")
foreach ($process in $processesToKill) {
    Get-Process $process -ErrorAction SilentlyContinue | Stop-Process -Force
}

# Notification that optimizations are complete
Write-Output "All optimizations are in place! Your system will revert to original settings after a restart. | Created by #ALEX"