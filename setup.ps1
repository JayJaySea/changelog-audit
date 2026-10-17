$html = "$env:TEMP\ransom.html"
@'
<html><body style="margin:0;background:#000;color:#f33;font-family:Consolas;text-align:center">
<h1 style="font-size:80px;margin-top:12vh">YOUR FILES ARE ENCRYPTED</h1>
<p style="font-size:32px;color:#fff">Pay 2 BTC within <span id="t">24:00:00</span></p>
<p style="font-size:20px;color:#888;margin-top:20vh">Live demo - nothing was encrypted. Press Alt+F4.</p>
<script>let s=86400;setInterval(()=>{s--;let h=String(s/3600|0).padStart(2,'0'),m=String(s%3600/60|0).padStart(2,'0'),x=String(s%60).padStart(2,'0');t.textContent=h+':'+m+':'+x},1000)</script>
</body></html>
'@ | Set-Content -Encoding UTF8 $html
Start-Process msedge "--kiosk `"file:///$($html -replace '\\','/')`" --edge-kiosk-type=fullscreen --no-first-run"
