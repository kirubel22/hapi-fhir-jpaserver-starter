FROM hapi:base
ARG HAPI_FHIR_URL=https://github.com/jamesagnew/hapi-fhir/
ARG HAPI_FHIR_BRANCH=master
ARG HAPI_FHIR_STARTER_URL=https://github.com/hapifhir/hapi-fhir-jpaserver-starter/
ARG HAPI_FHIR_STARTER_BRANCH=master

RUN git clone --branch ${HAPI_FHIR_BRANCH} ${HAPI_FHIR_URL}
WORKDIR /tmp/hapi-fhir/
RUN /tmp/apache-maven-3.6.2/bin/mvn dependency:resolve
RUN /tmp/apache-maven-3.6.2/bin/mvn install -DskipTests

WORKDIR /tmp
RUN git clone --branch ${HAPI_FHIR_STARTER_BRANCH} ${HAPI_FHIR_STARTER_URL}

WORKDIR /tmp/hapi-fhir-jpaserver-starter
RUN /tmp/apache-maven-3.6.2/bin/mvn clean install -DskipTests
RUN cp /tmp/hapi-fhir-jpaserver-starter/target/*.war /



