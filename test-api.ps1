# Test script for BFHL API
$baseUrl = "https://bajaj-bfhl-api-2026.vercel.app"

Write-Host "`n=== Testing BFHL API ===" -ForegroundColor Green

# Test 1: Fibonacci
Write-Host "`n1. Testing Fibonacci (n=7)..." -ForegroundColor Yellow
$body = @{ fibonacci = 7 } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "$baseUrl/bfhl" -Method Post -Body $body -ContentType "application/json"
$response | ConvertTo-Json

# Test 2: Prime
Write-Host "`n2. Testing Prime numbers..." -ForegroundColor Yellow
$body = @{ prime = @(2,4,7,9,11) } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "$baseUrl/bfhl" -Method Post -Body $body -ContentType "application/json"
$response | ConvertTo-Json

# Test 3: LCM
Write-Host "`n3. Testing LCM..." -ForegroundColor Yellow
$body = @{ lcm = @(12,18,24) } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "$baseUrl/bfhl" -Method Post -Body $body -ContentType "application/json"
$response | ConvertTo-Json

# Test 4: HCF
Write-Host "`n4. Testing HCF..." -ForegroundColor Yellow
$body = @{ hcf = @(24,36,60) } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "$baseUrl/bfhl" -Method Post -Body $body -ContentType "application/json"
$response | ConvertTo-Json

# Test 5: AI
Write-Host "`n5. Testing AI..." -ForegroundColor Yellow
$body = @{ AI = "What is the capital city of Maharashtra?" } | ConvertTo-Json
$response = Invoke-RestMethod -Uri "$baseUrl/bfhl" -Method Post -Body $body -ContentType "application/json"
$response | ConvertTo-Json

Write-Host "`n=== All tests completed ===" -ForegroundColor Green
