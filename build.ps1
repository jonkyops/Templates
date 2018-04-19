# Remove any existing nupkg files
Get-ChildItem *.nupkg | Remove-Item -Force

# Create the package
cpack './src/templates/templates.nuspec' --version '0.1.1.1'

# Install the package file
cinst './Templates.0.1.1.1.nupkg' -s . --force -dv
