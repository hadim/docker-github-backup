# docker-github-backup

[![Docker Automated build](https://img.shields.io/docker/cloud/automated/hadim/docker-github-backup.svg)](https://hub.docker.com/r/hadim/docker-github-backup 'DockerHub')
[![Docker Build Status](https://img.shields.io/docker/cloud/build/hadim/docker-github-backup.svg)](https://hub.docker.com/r/hadim/docker-github-backup 'DockerHub')
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/hadim/docker-github-backup.svg)](https://hub.docker.com/r/hadim/docker-github-backup 'DockerHub')
[![Docker Pulls](https://img.shields.io/docker/pulls/hadim/docker-github-backup.svg)](https://hub.docker.com/r/hadim/docker-github-backup 'DockerHub')

A Docker image that run [`github-backup`](https://github.com/josegonzalez/python-github-backup) periodically using `cron` and [`s6-overlay`](https://github.com/just-containers/s6-overlay).

## How to use

### Docker Hub

Use the following `docker-compose.yml` file:

```yaml
version: '3'

services:

  github-backup:
    container_name: github-backup
    image: hadim/docker-github-backup
    restart: unless-stopped
    volumes:
      - ../github_backup:/data
    environment:
      TIMEZONE: "America/Montreal"
      PUID: 1000
      PGID: 1000
      CRONTAB_OPTIONS: "0 0 * * *"
      GITHUB_USER: $GITHUB_USER
      GITHUB_TOKEN: $GITHUB_TOKEN
      GITHUB_MAX_BACKUPS: 5
      GITHUB_BACKUP_OPTIONS: "--private --gists --all"
```

### Cloning

You need to clone this repository and build the repository:

```bash
git clone https://github.com/hadim/docker-github-backup.git
cd docker-github-backup/
docker-compose build
```

Edit `docker-compose.yml`. Then run the container:

```bash
docker-compose up -d
docker-compose logs -f github-backup
```

## Configurations

### Data Volumes

| Directory | Description |
| --- | --- |
| `/data` | Backup Directory |

### Environment Variables

| Parameter | Function | Default |
| --- | --- | --- |
| `TIMEZONE` | [Timezone string](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | `"America/Montreal"` |
| `PUID` | User ID (use `id $USER`) | `1000` |
| `PGID` | Group ID (use `id $USER`) | `1000` |
| `CRONTAB_OPTIONS` | Crontab options | `"0 0 * * *"` |
| `GITHUB_USER` | GitHub username | `$GITHUB_USER` |
| `GITHUB_TOKEN` | [GitHub token](https://github.com/settings/tokens) | `$GITHUB_TOKEN` |
| `GITHUB_MAX_BACKUPS` | Older backups will be deleted | `5` |
| `GITHUB_BACKUP_OPTIONS` | [GitHub backup options](https://github.com/josegonzalez/python-github-backup#usage) | `"--private --gists --all"` |

## License

[MIT License](./LICENSE).

## Author

- [Hadrien Mary](https://github.com/hadim)
