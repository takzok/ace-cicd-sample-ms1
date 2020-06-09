# pull image from IBM entitlement registry
FROM cp.icr.io/cp/icp4i/ace/ibm-ace-server-prod:11.0.0.8-r1-amd64 

# Copy in the bar file to a temporary directory
COPY --chown=aceuser ./bar/Microservice1.bar /tmp

# Deploy the BAR file. Need to use bash to make the profile work
RUN bash -c 'mqsibar -w /home/aceuser/ace-server -a /tmp/Microservice1.bar -c'

# Expose a port
# EXPOSE 7800
