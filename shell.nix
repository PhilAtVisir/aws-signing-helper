{ pkgs ? import <nixpkgs> {} }:

let
  aws-signing-helper = pkgs.stdenv.mkDerivation {
    pname = "aws-signing-helper";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/PhilAtVisir/aws-signing-helper/releases/download/v1.3.0/rolesanywhere-credential-helper";
      # You can get the hash by trying to build with an incorrect hash first
      # Nix will tell you the correct hash
      sha256 = ""; # Replace with actual hash from the release
    };
    
    dontUnpack = true;
    
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/aws-signing-helper
      chmod +x $out/bin/aws-signing-helper
    '';
  };
in
pkgs.mkShell {
  buildInputs = [
    aws-signing-helper
  ];

  shellHook = ''
    echo "AWS Signing Helper shell environment"
    echo "Using pre-built binary from GitHub release"
  '';
} 