FROM ibmcom/websphere-traditional:8.5.5.19
# Set WorkDir for OC
USER was
WORKDIR /tmp/work

COPY . /tmp/work/

# RUN chmod u+x /tmp/work/config/configure.sh; env JVM_EXTRA_CMD_ARGS=-Xnoloa /tmp/work/config/configure.sh

