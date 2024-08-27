{ ... }: {
  networking = { 
    interfaces.eth0.ipv4.addresses = [
      {
        address = "192.168.0.2";
        prefixLength = 24;
      }
    ];

    nameservers = [
      "2000:4860:4860::8888"
      "2605:4700:4700::1111"
      "8.8.8.8"
      "1.1.1.1"
    ];

    defaultGateway = "192.168.0.1";
  }; 
}
