class OfferingServices {
  final String? title;
  final String? icon;
  final OfferingType? type;

  const OfferingServices({this.title, this.icon, this.type});
}

List<OfferingServices> serviceList = [
  const OfferingServices(
      title: "Offering",
      icon: "assets/icons/offering.svg",
      type: OfferingType.offering),
  const OfferingServices(
      title: "Tithe", icon: "assets/icons/tithe.svg", type: OfferingType.tithe),
  const OfferingServices(
      title: "Donate",
      icon: "assets/icons/donation.svg",
      type: OfferingType.donation),
];

enum OfferingType {
  offering("Offering", "OFT"),
  tithe("Tithe", "THT"),
  donation("Donation", "DON");

  const OfferingType(this.typeName, this.code);

  final String typeName, code;
}
