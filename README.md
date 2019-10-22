# docker-github-backup

A Docker image that run [`github-backup`](https://github.com/josegonzalez/python-github-backup) periodically using `cron` and [`s6-overlay`](https://github.com/just-containers/s6-overlay).

## How to use

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

## License

[MIT License](./LICENSE).

## Author

- [Hadrien Mary](https://github.com/hadim)
