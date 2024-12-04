{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule {
  pname = "aws-signing-helper";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "aws";
    repo = "rolesanywhere-credential-helper";
    rev = "v1.3.0";
    sha256 = "sha256-vY8ZJnNV5xt8qxp2sCLYoavcggjS/+LHJysREtCgCJE=";
  };

  vendorHash = "sha256-QKKgBIocJoGbfs78PxNBLBi4KTDPtSuhzvsb6OBhNWQ=";

  meta = with pkgs.lib; {
    description = "AWS Signing Helper for IAM Roles Anywhere";
    homepage = "https://github.com/aws/rolesanywhere-credential-helper";
    license = licenses.asl20;
    platforms = platforms.unix;
  };
}