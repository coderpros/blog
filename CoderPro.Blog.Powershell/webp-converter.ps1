
function Convert-Images {
    param (
        [string]$inputDirectory, 
        [string]$outputDirectory,
        $quality
    )

    $files = Get-ChildItem $inputDirectory

    foreach ($file in $files) {
        if($file -is [System.IO.DirectoryInfo]) {
            if(-not (Test-Path -Path "$outputDirectory$file" -PathType Container)) {
                try {
                    New-Item -Path $outputDirectory$file -ItemType Directory -ErrorAction Stop | Out-Null #-Force
                }
                catch {
                    Write-Error -Message "Unable to create directory '$outputDirectory$file'. Error was: $_" -ErrorAction Stop
                }
                
                "Successfully created directory '$outputDirectory$file'."
            }

            Convert-Images $file.FullName "$outputDirectory$file/" $quality
        }
        else {
            if([System.Web.MimeMapping]::GetMimeMapping($file) -like 'image*') {
                Start-Process -NoNewWindow -FilePath "D:\Utilities\libwebp-1.1.0-windows-x64\bin\cwebp.exe" -ArgumentList "$($file.FullName) -lossless -q $quality -o $outputDirectory$($file.BaseName).webp"
            }
        }
    }
    
}

Convert-Images "D:/DeleteMe/webp/Originals/" "D:/Projects/Web/Asp.Net/MVC/Umbraco/coderPro.Web.Corp.UI/media" 85
