{ pkgs ? import <nixpkgs> {} }:

let
  aws-signing-helper = pkgs.stdenv.mkDerivation {
    pname = "aws-signing-helper";
    version = "1.4.0";
    
    src = pkgs.fetchurl {
      url = "https://github.com/PhilAtVisir/aws-signing-helper/releases/download/v1.4.0/aws_signing_helper_x86_64-linux";
      hash = null;  # Will show correct hash on first build attempt
    };
    
    dontUnpack = true;
    nativeBuildInputs = [ pkgs.patchelf ];
    
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/aws_signing_helper
      chmod +x $out/bin/aws_signing_helper
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