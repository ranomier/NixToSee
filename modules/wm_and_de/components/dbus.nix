{
  services.dbus = {
    implementation = "broker";
    apparmor = "enabled";
  };
}
