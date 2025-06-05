# frp-tunnel-cli

Expose your local server to the internet via a single command like ngrok, using your custom domain.

## Usage

```
./frp-tunnel.sh <subdomain> <local_port>
```

**Linux/Mac:**
```bash
./frp-tunnel.sh <subdomain> <local_port>
```

**Windows:**
```cmd
frp-tunnel.bat <subdomain> <local_port>
```

It will expose `http://<subdomain>.tunnel.algomative.com` to your local port `<local_port>`.
