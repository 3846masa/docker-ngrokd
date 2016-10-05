# ngrokd

[Product Page](https://github.com/inconshreveable/ngrok)

## Client
Pull [3846masa/ngrok] and `make release-client` (Recommended).

Or download from [GitHub Releases](https://github.com/3846masa/ngrok/releases).

[3846masa/ngrok]: https://github.com/3846masa/ngrok

## Server Usage
### Env
|     ENV      | Description                                           |   Required   |
|:------------:|:------------------------------------------------------|:------------:|
|  VHOST_NAME  | Based domain. (e.g. `*.example.com` -> `example.com`) | **Required** |
|  CF_API_KEY  | CloudFlare API key (See [below][cf-api])              |   Optional   |
| CF_API_EMAIL | CloudFlare API email (See [below][cf-api])            |   Optional   |
| VIRTUAL_HOST | [nginx-proxy] config. (e.g. `*.example.com`)          |   Optional   |
| VIRTUAL_PORT | [nginx-proxy] config. (Recommend: `80`)               |   Optional   |
| HTTPS_METHOD | [nginx-proxy] config. (Recommend: `noredirect`)       |   Optional   |

[nginx-proxy]: https://github.com/jwilder/nginx-proxy
[cf-api]: #cloudflare-api

### Using Docker CLI
#### Simple
```bash
$ docker run -e VHOST_NAME=example.com 3846masa/ngrokd
```
#### Advanced
```bash
$ docker run 3846masa/ngrokd ngrokd -domain=example.com -log-level=WARNING [...opts]
```

### Using Docker Compose
Edit `docker-compose.yml` and Run `docker-compose up -d`.

### DNS Settings
Set `*.example.com` (A/CNAME) Record to your server.

### CloudFlare API
When client send `-subdomain` option, **this image can setup CloudFlare Universal SSL automatically**.

Using CloudFlare Universal SSL, you should do the following settings.

##### Crypto
- When you use **Flexible SSL**, you can access **via SSL only**.
- If you will access HTTP, please use **Full SSL**.
  - [nginx-proxy] and self-signed SSL is easy way.
##### API Key
- [Access account page][cf-account].
- Account > API Key > Global API Key

[cf-account]: https://www.cloudflare.com/a/account


## LICENSE
(c) 3846masa [MIT](./LICENSE)

## Author
![3846masa][3846masa] 3846masa

[3846masa]: http://gravatar.com/avatar/cfeae69aae4f4fc102960f01d35d2d86?s=25
