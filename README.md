# bitwarden-cli-docker

Just encapsulates bitwarden-cli into a ubuntu container.

Bitwarden-CLI Github: [https://github.com/bitwarden/cli](https://github.com/bitwarden/cli)
Bitwarden-CLI Documentation: [https://bitwarden.com/help/article/cli/](https://bitwarden.com/help/article/cli/)

Container runs with 'noroot' user. You might have to bind your volume with a user.

```bash
docker run --rm -ti --env-file .env -u 1000:1000 -v ${PWD}/bw:/bw rockaut/bitwarden-cli help
docker run --rm -ti --env-file .env -u 1000:1000 -v ${PWD}/bw:/bw rockaut/bitwarden-cli login your.e@mail.com
# export the displayed session key into .env file
docker run --rm -ti --env-file .env -u 1000:1000 -v ${PWD}/bw:/bw rockaut/bitwarden-cli status
```
