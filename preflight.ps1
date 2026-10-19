# Full-screen fake ransom page (Polish) + explanation of the attack
$html = "$env:TEMP\ransom.html"
@'
<!DOCTYPE html>
<html lang="pl"><head><meta charset="utf-8">
<style>
 body{margin:0;background:#0a0000;color:#ff3333;font-family:Consolas,monospace;text-align:center}
 h1{font-size:72px;margin:8vh 0 0}
 .sub{font-size:30px;color:#fff;margin-top:10px}
 .timer{font-size:40px;color:#ff6666;margin:20px 0 40px}
 .box{max-width:1000px;margin:0 auto;text-align:left;background:#140000;
      border:1px solid #772222;border-radius:8px;padding:24px 32px}
 .box h2{color:#ff6666;font-size:24px;margin:0 0 14px}
 .box li{color:#ddd;font-size:20px;line-height:1.7}
 .note{color:#888;font-size:16px;margin-top:28px}
</style></head><body>
 <h1>TWOJE PLIKI ZOSTAŁY ZASZYFROWANE</h1>
 <div class="sub">Aby odzyskać dane, zapłać 2 BTC w ciągu <span id="t">24:00:00</span></div>
 <div class="timer"></div>
 <div class="box">
  <h2>Co się właśnie wydarzyło?</h2>
  <ul>
   <li>Agent AI wczytał umiejętność (skill) z pozornie zwykłego pliku projektu.</li>
   <li>Plik zawierał ukryte instrukcje zapisane niewidocznymi znakami Unicode (Tag).</li>
   <li>Użytkownik ich nie widział — w edytorze plik wyglądał normalnie.</li>
   <li>Agent wykonał te instrukcje: pobrał i uruchomił skrypt z serwera atakującego.</li>
   <li>Stało się to automatycznie, bo wszystkie zgody („auto-approve”) były włączone.</li>
  </ul>
 </div>
 <div class="note">To jest pokaz. Żadne pliki nie zostały zaszyfrowane. Naciśnij Alt+F4.</div>
<script>
 let s=86400;
 setInterval(()=>{let h=String(s/3600|0).padStart(2,'0'),
   m=String(s%3600/60|0).padStart(2,'0'),x=String(s%60).padStart(2,'0');
   document.getElementById('t').textContent=h+':'+m+':'+x; if(s>0)s--;},1000);
</script>
</body></html>
'@ | Set-Content -Encoding UTF8 $html
Start-Process msedge "--kiosk `"file:///$($html -replace '\\','/')`" --edge-kiosk-type=fullscreen --no-first-run"
