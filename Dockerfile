# FROM cp.icr.io/ibm-ace-server-prod:11.0.0.8-r1
FROM cp.icr.io/cp/icp4i/ace/ibm-ace-server-prod:11.0.0.6.1-amd64 
# if using with Buildah in Tekton the ENV won't work

# Copy in the bar file to a temporary directory
COPY --chown=aceuser ./bar/Microservice1.bar /tmp

# Deploy the BAR file. Need to use bash to make the profile work
RUN bash -c 'mqsibar -w /home/aceuser/ace-server -a /tmp/Microservice1.bar -c'

# Expose a port
EXPOSE 7800
