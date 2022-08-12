# Script to Install Mandaory Library for Robot_Framework
Write-Host "Start Install Mandatory Library for Robot Framework"
$ErrorActionPreference = 'Stop'
try {
    python --version 
    pip -V
}
catch {
    Write-Output "This Machine require to install Python or Pip "
    Write-Output $_
}

pip install robotframework
pip install robotframework-selenium2library
pip install webdriver-manager
pip install robotframework-datadriver
pip install robotframework-requests
pip install -U requests
pip install -U robotframework-jsonlibrary

Write-Host "Successful Install Mandatory Library"

