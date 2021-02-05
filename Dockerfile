FROM archlinux
ARG user=test
ARG userhome=/home/$user
RUN useradd -ms /bin/bash test
RUN pacman -Sy --needed --noconfirm jq

COPY dotty $userhome/the_repository/dotty
RUN chmod -R a+rw $userhome/the_repository

COPY .dottyrc.json $userhome/the_repository/.dottyrc.json
COPY test-inside.sh $userhome/the_repository/test-inside.sh

RUN touch $userhome/.a.file
RUN chmod -R a+rw $userhome/.a.file

USER test
WORKDIR $userhome/the_repository
ENTRYPOINT ["sh", "test-inside.sh"]
