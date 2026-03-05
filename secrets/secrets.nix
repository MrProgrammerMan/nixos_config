let
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO08PdZfjx63jCnOP4PAi62ussK4BhzCVNm0o2p67xKP";
  systems = [ desktop ];
  cepheus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+rQjD/8oC/OZGUnFyvJ4WrnlJw3EoYQ4PW/w7T/+9e";
  users = [ cepheus ];
in
{
  "email/personal/address.age".publicKeys = [ cepheus ];
  "email/personal/name.age".publicKeys = [ cepheus ];
  "email/personal/password.age".publicKeys = [ cepheus ];
}