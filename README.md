# frp-tunnel-cli

Expose your local server to the internet via a single command like ngrok, using your custom domain.

## Usage

**Linux/Mac:**
```bash
./frp-tunnel.sh dev1 3000
```

**Windows:**
```cmd
frp-tunnel.bat dev1 3000
```

It will expose `http://dev1.tunnel.algomative.com` to your local port `3000`.

## Prerequisite

- Your server must run an `frps` instance with subdomain support.
- Your DNS must point `*.tunnel.algomative.com` to your VPS IP.
- You must configure NGINX on the server to forward HTTP requests to the FRP HTTP port.
