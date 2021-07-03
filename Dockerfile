FROM ibmcom/websphere-traditional:8.5.5.19
# Set WorkDir for OC
USER root
WORKDIR /tmp/work

COPY . /tmp/work/
RUN chmod 755 /tmp/work/config/configure.sh
USER was
RUN env JVM_EXTRA_CMD_ARGS=-Xnoloa /tmp/work/config/configure.sh

