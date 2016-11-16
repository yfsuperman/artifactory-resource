FROM concourse/buildroot:curl

ADD assets/ /opt/resource/
ADD test/ /opt/resource-tests/

# Run tests
# RUN /opt/resource-tests/test-check.sh
# RUN /opt/resource-tests/test-in.sh
# RUN /opt/resource-tests/test-out.sh
