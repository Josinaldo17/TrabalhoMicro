import os
import time
import random
import requests

# 👉 Coloque seu token em BLYNK_TOKEN ou deixe o literal de teste abaixo
TOKEN = os.getenv("BLYNK_TOKEN", "KpY5iBgwR5AlbyLurR8T8agFnDBtYJxj")
BASE = "https://blynk.cloud/external/api"

# Cria uma sessão HTTP para reutilizar a conexão
with requests.Session() as s:
    while True:
        try:
            # ── 1) Envia temperatura simulada no V0 ────────────────────────────
            temp = round(random.uniform(20.0, 30.0), 2)
            s.get(f"{BASE}/update", params={"token": TOKEN, "v0": temp})
            print(f"[V0] Temp enviada: {temp} °C")

            # ── 2) Lê o botão no V1 ────────────────────────────────────────────
            r = s.get(f"{BASE}/get", params={"token": TOKEN, "v1": ""})
            v1 = r.json() if r.ok else "0"                # "1" ou "0"

            # ── 3) Liga/desliga o LED no V2 conforme V1 ───────────────────────
            led = int(v1)               # 255 = aceso
            s.get(f"{BASE}/update", params={"token": TOKEN, "v2": led})
            print(f"[V1] Botão={v1}  →  [V2] LED={'ON' if led else 'OFF'}")

        except Exception as e:
            print("⚠️  Erro de rede/Blynk:", e)

        time.sleep(5)   # espera 5 s antes do próximo ciclo
