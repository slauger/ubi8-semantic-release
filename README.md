# ubi8-semantic-release

Image build of semantic-release based on Red Hat Universal Base Image (UBI).

## Generate a new package.json

Steps for creating a fresh package.json from a UBI8 upstream container.

```
docker run -it -v $(pwd):/workspace --workdir /workspace --name npm --rm registry.access.redhat.com/ubi8/ubi bash
```

Install NodeJS in the container.

```
dnf module enable nodejs:16 -y
yum install npm -y
```

Build the package.json and package-lock.json.

```
npm init --yes

npm add semantic-release
npm add @google/semantic-release-replace-plugin
npm add @semantic-release/changelog
npm add @semantic-release/git
npm add @semantic-release/github
npm add @semantic-release/gitlab
npm add @semantic-release/release-notes-generator
npm add @semantic-release/commit-analyzer
npm add @semantic-release/exec
```
