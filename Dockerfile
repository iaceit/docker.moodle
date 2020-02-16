FROM bitnami/moodle:3.8.1

ARG CR_VERSION=v3.7.4+
ARG CR_BEHAVRIOUR_VERSION=v1.3.6

RUN install_packages git
RUN git clone --branch ${CR_VERSION} --depth 1 \
    https://github.com/trampgeek/moodle-qtype_coderunner.git \
    /bitnami/moodle/question/type/coderunner
RUN git clone --branch ${CR_BEHAVRIOUR_VERSION} --depth 1 \
    https://github.com/trampgeek/moodle-qbehaviour_adaptive_adapted_for_coderunner.git \
    /bitnami/moodle/question/behaviour/adaptive_adapted_for_coderunner
RUN apt remove git -y
RUN apt autoremove -y

EXPOSE 80

VOLUME [ "/bitnami/moodle/moodledata" ]

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "/run.sh" ]
