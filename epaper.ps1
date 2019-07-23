$urls = @(
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm_24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-dddd-24-07-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-07-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd-24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-mmm-24-07-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm-24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm_24-07-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-mmm_24-07-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm_24-7-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-dddd-24-7-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-7-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-7-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd-24-7-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_dddd_24-7-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-mmm-24-7-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm-24-7-2019_MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04_mmm_24-7-2019-MOR.pdf",
    "http://bombaysamachar.com/epaper/e24-7-2019/04-mmm_24-7-2019_MOR.pdf"
)

$day =  (Get-Date).AddDays(1).ToString("dddd")
$day2 =  (Get-Date).AddDays(1).ToString("ddd")

For ($j=1; $j -le 20; $j++) {

    $i = 1;
     foreach ($url in $urls) {
        $url = $url.Replace("dddd",$day.ToUpper())
        $url = $url.Replace("mmm",$day2.ToUpper())
        if ($j -lt 10)
        {
         $page = "0$j"
        }
        else
        {
         $page = "$j"
        }
    
        $url = $url.Replace("04",$page)
        Write-Host $url

        $output = 'D:\epaper\' + "$page.pdf"
        Write-Host $output
        if (-Not (Test-Path $output))
        {
            $outputDir = 'D:\epaper\'
            if (-Not (Test-Path $outputDir))
            {
                mkdir $outputDir
            }
            (New-Object System.Net.WebClient).DownloadFile($url, $output)
        }
        $i++;
    }
}