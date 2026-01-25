{ pkgs, ... }: {
  # only for more system kinda packages not editing and such
  environment.systemPackages = with pkgs; [
    helvum
    pwvucontrol
    lxqt.pavucontrol-qt

    qpwgraph
    easyeffects
    non

    roc-toolkit
  ];
}
