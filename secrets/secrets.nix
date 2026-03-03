let
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO08PdZfjx63jCnOP4PAi62ussK4BhzCVNm0o2p67xKP";
  laptop = "";
  systems = [ laptop desktop ];
  cepheus = "";
  users = [ cepheus ];
in
{
  "secret1.age".publicKeys = systems;
}