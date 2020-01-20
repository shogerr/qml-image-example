if (!$Env:VCPKG_ROOT) {
  Write-Error 'Please provide $Env:VCPKG_ROOT' -ErrorAction Stop
}

if (!(Get-Command cl.exe -ErrorAction SilentlyContinue)) {
  Write-Error 'Please run from a VS Development Environment.' -ErrorAction Stop
}

cmake -S . -B build -G "Ninja" `
    -DCMAKE_CXX_COMPILER="cl.exe" `
    -DCMAKE_C_COMPILER="cl.exe" `
    -DVCPKG_TARGET_TRIPLET=x64-windows
