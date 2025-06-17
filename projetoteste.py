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
            temp = int(random.uniform(20, 30))  # arredondado para int
            s.get(f"{BASE}/update", params={"token": TOKEN, "v0": temp})
            print(f"[V0] Temp enviada: {temp} °C")

            # ── 2) Lê o botão no V1 e atualiza LED V2 ──────────────────────────
            r = s.get(f"{BASE}/get", params={"token": TOKEN, "v1": ""})
            v1 = int(r.json()) if r.ok else 0
            s.get(f"{BASE}/update", params={"token": TOKEN, "v2": v1})
            print(f"[V1] Botão={v1}  →  [V2] LED={'ON' if v1 else 'OFF'}")

            # ── 3) Lê valor do ADC no V3 ───────────────────────────────────────
            r = s.get(f"{BASE}/get", params={"token": TOKEN, "v3": ""})
            v3 = int(r.json()) if r.ok else 0
            print(f"[V3] Valor do ADC: {v3}")

            # ── 4) Lê botão V4 e atualiza LED em V5 ────────────────────────────
            r = s.get(f"{BASE}/get", params={"token": TOKEN, "v4": ""})
            v4 = int(r.json()) if r.ok else 0
            s.get(f"{BASE}/update", params={"token": TOKEN, "v5": v4})
            print(f"[V4] Botão={v4}  →  [V5] LED={'ON' if v4 else 'OFF'}")

        except Exception as e:
            print("⚠️  Erro de rede/Blynk:", e)

        time.sleep(1)  # Aguarda 1 segundo antes do próximo ciclo
