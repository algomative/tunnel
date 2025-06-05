# frp-tunnel-cli

Expose your local server to the internet via a single command like ngrok, using your custom domain `*.tunnel.algomative.com`.


## ✅ Usage Instructions

### 🐧 Linux / macOS

```bash
git clone https://github.com/algomative/tunnel.git
cd tunnel
chmod +x frp-tunnel.sh
./frp-tunnel.sh dev1 3000
```

This will:
- Auto-download the FRP binary if not present.
- Create a temporary `frpc.ini` with your subdomain and local port.
- Start tunneling to `https://dev1.tunnel.algomative.com`

---

### 🪟 Windows

Open **Git Bash** or **Command Prompt**, then:

```cmd
git clone https://github.com/algomative/tunnel.git
cd tunnel
frp-tunnel.bat dev1 3000
```

This does the same as above on Windows using `frpc.exe`.

---

## 🔄 Notes

- You can reuse subdomains (e.g., `dev1`, `staging2`, etc.) but only one active connection per subdomain is allowed.
- Each script generates a fresh `frpc.ini` on the fly.
