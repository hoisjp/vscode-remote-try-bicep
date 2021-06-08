# Start from the powershell base image to ensure common tools are available for things like the bicep language server.
FROM mcr.microsoft.com/powershell:latest

# Configure the release version of Bicep you'd like to use
ARG BICEP_VERSION=latest

# Install common tooling
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git curl

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && az version

# Install act (GitHub Actions local runner. See also https://github.com/nektos/act)
# RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | bash
# 'act' doesn't work on devcontainer. It works on local as well as on WSL.
# RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Install Bicep
RUN \
    # Fetch the latest Bicep CLI binary
    curl -Lo bicep https://github.com/Azure/bicep/releases/${BICEP_VERSION}/download/bicep-linux-x64 \
    # Mark it as executable
    && chmod +x ./bicep \
    # Add bicep to your PATH (requires admin)
    && mv ./bicep /usr/local/bin/bicep \
    # Verify you can now access the 'bicep' command
    && bicep --help \
    # Download the bicep vscode extension for installation
    && curl -Lo /tmp/vscode-bicep.vsix https://github.com/Azure/bicep/releases/${BICEP_VERSION}/download/vscode-bicep.vsix
