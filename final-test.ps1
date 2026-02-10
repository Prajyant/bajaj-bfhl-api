# Comprehensive Final Test for BFHL API
$baseUrl = "https://bajaj-bfhl-api-2026.vercel.app"
$passed = 0
$failed = 0

function Test-Endpoint {
    param($name, $endpoint, $method, $body, $expectedSuccess)
    
    Write-Host "`nTesting: $name" -ForegroundColor Cyan
    try {
        if ($method -eq "GET") {
            $response = Invoke-RestMethod -Uri "$baseUrl$endpoint" -Method Get
        } else {
            $jsonBody = $body | ConvertTo-Json
            $response = Invoke-RestMethod -Uri "$baseUrl$endpoint" -Method Post -Body $jsonBody -ContentType "application/json"
        }
        
        if ($response.is_success -eq $expectedSuccess) {
            Write-Host "Pass" -ForegroundColor Green
            $script:passed++
            $response | ConvertTo-Json -Depth 10
        } else {
            Write-Host "Fail - Unexpected is_success value" -ForegroundColor Red
            $script:failed++
        }
    } catch {
        Write-Host "Fail - Error: $($_.Exception.Message)" -ForegroundColor Red
        $script:failed++
    }
}

Write-Host "========================================" -ForegroundColor Green
Write-Host "   FINAL COMPREHENSIVE API TEST" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# 1. Health Endpoint
Test-Endpoint "Health Check" "/health" "GET" $null $true

# 2. GET /bfhl
Test-Endpoint "GET /bfhl" "/bfhl" "GET" $null $true

# 3. Valid Operations
Test-Endpoint "Fibonacci (n=7)" "/bfhl" "POST" @{fibonacci=7} $true
Test-Endpoint "Fibonacci (n=0)" "/bfhl" "POST" @{fibonacci=0} $true
Test-Endpoint "Fibonacci (n=1)" "/bfhl" "POST" @{fibonacci=1} $true
Test-Endpoint "Prime numbers" "/bfhl" "POST" @{prime=@(2,4,7,9,11,13)} $true
Test-Endpoint "LCM" "/bfhl" "POST" @{lcm=@(12,18,24)} $true
Test-Endpoint "HCF" "/bfhl" "POST" @{hcf=@(24,36,60)} $true
Test-Endpoint "AI - Maharashtra capital" "/bfhl" "POST" @{AI="What is the capital city of Maharashtra?"} $true

# 4. Edge Cases - Should Fail
Write-Host "`n--- Testing Error Handling ---" -ForegroundColor Yellow
Test-Endpoint "Empty body" "/bfhl" "POST" @{} $false
Test-Endpoint "Invalid key" "/bfhl" "POST" @{invalid=123} $false
Test-Endpoint "Multiple keys" "/bfhl" "POST" @{fibonacci=5;prime=@(2,3)} $false
Test-Endpoint "Negative Fibonacci" "/bfhl" "POST" @{fibonacci=-5} $false
Test-Endpoint "Empty array for prime" "/bfhl" "POST" @{prime=@()} $false
Test-Endpoint "LCM with zero" "/bfhl" "POST" @{lcm=@(0,5,10)} $false
Test-Endpoint "Empty AI question" "/bfhl" "POST" @{AI=""} $false

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "   TEST SUMMARY" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "Passed: $passed" -ForegroundColor Green
Write-Host "Failed: $failed" -ForegroundColor Red
Write-Host "Total:  $($passed + $failed)" -ForegroundColor Cyan

if ($failed -eq 0) {
    Write-Host "`nALL TESTS PASSED!" -ForegroundColor Green
} else {
    Write-Host "`nSOME TESTS FAILED" -ForegroundColor Red
}
