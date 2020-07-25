#!/usr/bin/with-contenv bash

DATE=$(date +%Y.%m.%d_%H-%M-%S)

echo "[github-backup.sh] Execute backup ${DATE}"

for user in $(echo $GITHUB_USER | tr "," "\n"); do
    echo "[github-backup.sh] Execute backup for user '${user}'"

    IS_ORG=$(python /is_org.py $user)
    EXTRA_ARGS=""
    if [ $IS_ORG = "True" ]; then
        EXTRA_ARGS="-O"
    fi

    github-backup ${user} --token=${GITHUB_TOKEN} \
        --output-directory=/data/${DATE}/${user} \
        ${GITHUB_BACKUP_OPTIONS} \
        ${EXTRA_ARGS}
done

echo "[github-backup.sh] Cleanup old backups"
ls -d1 /data/* | head -n -${GITHUB_MAX_BACKUPS} | xargs rm -rf
