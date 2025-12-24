Clear-Host

function New-RandomGolfShot {
    param(
        [string]$Club = "7 Iron"
    )

    # Club profiles
    $clubProfiles = @{
        "Driver" = @{
            BallSpeed = 150..175
            ClubSpeed = 105..120
            LaunchAngle = 9..15
            SpinRate = 2000..3200
            Carry = 250..300
            Total = 270..330
        }
        "7 Iron" = @{
            BallSpeed = 110..135
            ClubSpeed = 80..95
            LaunchAngle = 14..20
            SpinRate = 5000..7000
            Carry = 150..175
            Total = 160..185
        }
        "PW" = @{
            BallSpeed = 80..100
            ClubSpeed = 60..75
            LaunchAngle = 25..35
            SpinRate = 8000..10000
            Carry = 100..130
            Total = 105..140
        }
    }

    if (-not $clubProfiles.ContainsKey($Club)) {
        throw "Unknown club type: $Club"
    }

    $p = $clubProfiles[$Club]

    # Generate the shot
    $shot = [ordered]@{
        shotId        = (Get-Random -Minimum 100000 -Maximum 999999)
        timestamp     = (Get-Date).ToString("o")
        club          = $Club
        ballSpeed     = Get-Random -Minimum $p.BallSpeed[0] -Maximum $p.BallSpeed[1]
        clubSpeed     = Get-Random -Minimum $p.ClubSpeed[0] -Maximum $p.ClubSpeed[1]
        launchAngle   = Get-Random -Minimum $p.LaunchAngle[0] -Maximum $p.LaunchAngle[1]
        spinRate      = Get-Random -Minimum $p.SpinRate[0] -Maximum $p.SpinRate[1]
        spinAxis      = [math]::Round((Get-Random -Minimum -6 -Maximum 6), 1)
        carryDistance = Get-Random -Minimum $p.Carry[0] -Maximum $p.Carry[1]
        totalDistance = Get-Random -Minimum $p.Total[0] -Maximum $p.Total[1]
        sideDeviation = Get-Random -Minimum -20 -Maximum 20
        impactPoint   = @{
            horizontal = [math]::Round((Get-Random -Minimum -1.0 -Maximum 1.0), 2)
            vertical   = [math]::Round((Get-Random -Minimum -1.0 -Maximum 1.0), 2)
        }
    }

    return $shot
}

Write-Host "Golf Shot Generator"
Write-Host "---------------------"
Write-Host "Press SPACEBAR to generate a shot"
Write-Host "Press ESC to exit"
Write-Host ""

$logFile = ".\shots_log.json"

while ($true) {
    $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    switch ($key.VirtualKeyCode) {
        32 {   # Spacebar
            $shot = New-RandomGolfShot -Club "Driver"
            $json = $shot | ConvertTo-Json -Depth 5

            Write-Host "`nShot Generated:"
            Write-Host $json

            # Append JSON to log file (NDJSON format)
            Add-Content -Path $logFile -Value $json

            Write-Host "Shot appended to $logFile"
        }
        27 {   # ESC
            Write-Host "`nExiting..."
            break
        }
    }
}
