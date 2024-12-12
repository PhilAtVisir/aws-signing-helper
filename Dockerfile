FROM nixos/nix

# Install basic utilities and update channels
RUN nix-channel --update && \
    nix-env -iA nixpkgs.curl nixpkgs.jq nixpkgs.git

# Set up working directory
WORKDIR /app

# Copy only the Nix files first for better caching
COPY default.nix shell.nix ./

# Create a wrapper nix expression that imports default.nix with nixpkgs
RUN printf '{ pkgs ? import <nixpkgs> {} }:\nwith pkgs; callPackage ./default.nix {}\n' > build.nix

# Build dependencies first (this layer will be cached if Nix files don't change)
RUN nix-build build.nix