FROM registry.fedoraproject.org/fedora-minimal:latest
# install the base packages
RUN microdnf install -y python3-flask freeipa-server ipa-client poetry fedora-messaging gcc git ipa-client libffi-devel python3-cryptography python3-devel python3-pip vim
# copy this entire directory to /opt/noggin
WORKDIR /opt/noggin
ADD . /opt/noggin
RUN poetry install --no-dev --extras deploy
RUN poetry run pybabel compile -d /opt/noggin/noggin/translations
# run the flask app
# set environment variables
ENV FLASK_APP /opt/noggin/noggin/app.py
ENV NOGGIN_CONFIG_PATH=./noggin.cfg

ENV DOMAIN example.com
ENV REALM EXAMPLE.COM
ENV IPA_SERVER ipa.example.com
ENV IPA_ADMIN_USER admin
ENV IPA_ADMIN_PASSWORD password

ADD deployment/docker-deploy.sh /
RUN chmod +x /docker-deploy.sh
ENTRYPOINT ["/docker-deploy.sh"]