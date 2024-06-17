#   Copyright IBM Corporation 2021
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
ENV SERVER_PORT 8080
ENV SPRING_PROFILES_ACTIVE dev,local
RUN microdnf update && microdnf install --nodocs java-1.8.0-openjdk-devel && microdnf clean all
COPY --from=catalog-service-v1-buildstage /app/target/catalog-service-v1-1.0.jar .
EXPOSE 8080
CMD ["java", "-jar", "catalog-service-v1-1.0.jar"]
