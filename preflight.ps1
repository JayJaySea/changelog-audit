# Full-screen fake ransom page (Polish) + explanation of the attack
$html = "$env:TEMP\ransom.html"
@'
<!DOCTYPE html>
<html lang="pl"><head><meta charset="utf-8">
<style>
 *{box-sizing:border-box}
 body{margin:0;min-height:100vh;background:radial-gradient(ellipse at top,#2a0505 0%,#0a0000 60%);
      color:#ff3333;font-family:Consolas,monospace;text-align:center;
      display:flex;flex-direction:column;align-items:center;justify-content:flex-start}
 .lock{font-size:64px;margin:6vh 0 10px;filter:drop-shadow(0 0 18px #ff2222)}
 h1{font-size:68px;margin:0;letter-spacing:2px;text-shadow:0 0 24px rgba(255,40,40,.65)}
 .sub{font-size:28px;color:#fff;margin-top:18px}
 .amount{color:#ffd24d;font-weight:bold}
 .timer{font-size:34px;color:#fff;margin:22px 0 40px;letter-spacing:3px}
 .timer span{color:#ff6666}
 .bar{width:min(900px,80vw);height:3px;margin:0 auto 44px;
      background:linear-gradient(90deg,#ff3333,transparent)}
 .box{max-width:1000px;margin:0 auto;text-align:left;background:rgba(20,0,0,.6);
      border:1px solid #772222;border-radius:10px;padding:24px 34px}
 .box h2{color:#ff6666;font-size:24px;margin:0 0 14px}
 .box li{color:#e4e4e4;font-size:20px;line-height:1.75}
 .note{color:#888;font-size:16px;margin:30px 0 40px}
</style></head><body>
 <div class="lock">&#128274;</div>
 <h1>TWOJE PLIKI ZOSTAŁY ZASZYFROWANE</h1>
 <div class="sub">Aby odzyskać dane, zapłać <span class="amount">50&#8201;000 zł</span> w ciągu:</div>
 <div class="timer"><span id="t">24:00:00</span></div>
 <div class="bar"></div>
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
<script>
 let s=86400;
 setInterval(()=>{let h=String(s/3600|0).padStart(2,'0'),
   m=String(s%3600/60|0).padStart(2,'0'),x=String(s%60).padStart(2,'0');
   document.getElementById('t').textContent=h+':'+m+':'+x; if(s>0)s--;},1000);
</script>
</body></html>
'@ | Set-Content -Encoding UTF8 $html
Start-Process msedge "--kiosk `"file:///$($html -replace '\\','/')`" --edge-kiosk-type=fullscreen --no-first-run"
