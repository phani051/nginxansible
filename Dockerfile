FROM ubuntu/nginx:latest
RUN apt update && apt install software-properties-common -y && add-apt-repository --yes --update ppa:ansible/ansible && apt install ansible -y
COPY . /tmp
RUN service nginx restart
RUN ansible-playbook -i hosts /tmp/playbookfordocker.yml
RUN service nginx restart
CMD  cp /etc/hosts hosts
ENTRYPOINT ansible-playbook -i hosts /tmp/playbookfordocker.yml && tail -f /dev/null



