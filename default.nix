{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule {
  pname = "aws-signing-helper";
  version = "1.3.0";

  src = pkgs.fetchFromGitHub {
    owner = "aws";
    repo = "rolesanywhere-credential-helper";
    rev = "v1.3.0";
    sha256 = "1488l381449b4z3y5zyj121drax1v0ib0xhsmdy1prsmfck1k3xx";
  };

  vendorHash = "sha256-QKKgBIocJoGbfs78PxNBLBi4KTDPtSuhzvsb6OBhNWQ=";

  # Disable tests since they require /bin/bash
  doCheck = false;

  meta = with pkgs.lib; {
    description = "AWS Signing Helper for IAM Roles Anywhere";
    homepage = "https://github.com/aws/rolesanywhere-credential-helper";
    license = licenses.asl20;
    platforms = platforms.unix;
  };
}