# if IPA isnt already enrolled, enroll it
if [ ! -f /etc/ipa/ca.crt ]; then
    echo "====== Installing IPA Client ======"
    ipa-client-install \
    --hostname=${HOSTNAME} \
    --domain=${DOMAIN} \
    --realm=${REALM} \
    --server=${IPA_SERVER} \
    -p=${IPA_ADMIN_USERNAME} \
    -w=${IPA_ADMIN_PASSWORD} \
    --unattended \
    --no-ntp \
    --force-join
fi

export FLASK_APP=/opt/noggin/noggin/app.py
export NOGGIN_CONFIG_PATH=./noggin.cfg
poetry run flask run -h 0.0.0.0