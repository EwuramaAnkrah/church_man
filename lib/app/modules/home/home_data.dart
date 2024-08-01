class OfferingServices {
  final String title;
  final String icon;
  final OfferingType type;

  const OfferingServices(this.title, this.icon, this.type);
}

List<OfferingServices> serviceList = [
  const OfferingServices(
      "Offering", "assets/icons/offering.svg", OfferingType.offering),
  const OfferingServices("Tithe", "assets/icons/tithe.svg", OfferingType.tithe),
  const OfferingServices(
      "Donate", "assets/icons/donation.svg", OfferingType.donation),
];

enum OfferingType { offering, tithe, donation }
