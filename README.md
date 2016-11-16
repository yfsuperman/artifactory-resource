# Artifactory Resource

Deploys and retrieve artifacts from artifactory.

## Source Configuration

* `endpoint`: *Required.* The artifactory REST API endpoint. eg. http://YOUR-HOST_NAME:8081/artifactory.  
* `repository`: *Required.* The artifactory repository which includes any folder path, must start with leading '/'. eg. /generic/product/pcf  
* `regex`: *Required.* Regular expression used to extract artifact version, must contain 'version' group. ```E.g. myapp-(?<version>.*).tar.gz```  
* `username`: *Optional.* Username for HTTP(S) auth when accessing an authenticated repository  
* `password`: *Optional.* Password for HTTP(S) auth when accessing an authenticated repository  

## Parameter Configuration

* `file`: *Required for put* The file to upload to artifactory  
* `regex`: *Optional* overwrites the source regex  
* `folder`: *Optional.* appended to the repository in source - must start with forward slash /  

Resource configuration for an authenticated repository:

``` yaml
resources:
- name: artifactory
  type: artifactory
  source:
    endpoint: http://YOUR-ARTIFACTORY-HOSTNAME:8081/artifactory
    repository: "/builds/golden/myapp"
    regex: "myapp-(?<version>.*).tar.gz"
```

Deploying an artifact build by Maven

``` yaml
jobs:
- name: build
  plan:
  - get: source-code
    trigger: true
  - get: version
    params: { pre: rc }
  - task: build
    file: source-code/ci/build.yml
  - put: milestone
    resource: artifactory
    params:
      file: build-output/myartifact-*.jar
  - put: version
    params: { file: version/number }
```

## Behavior

### `check`: ...

Relies on the regex to retrieve artifact versions


### `in`: ...

Same as check, but retrieves the artifact based on the provided version


### `out`: Deploy to a repository.

Deploys the artifact.

#### Parameters

* `file`: *Required.* The path to the artifact to deploy.

## Credits
This concourse resource was originally based on the artifactory resource work of [mborges](https://github.com/mborges-pivotal/artifactory-resource).
