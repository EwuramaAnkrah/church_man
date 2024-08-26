import 'package:faith_fund/generated/assets.dart';
import 'package:nb_utils/nb_utils.dart';

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

extension OfferingTypeExt on String? {
  static const _offeringTypeCode = {
    "OFT": OfferingType.offering,
    "THT": OfferingType.tithe,
    "DON": OfferingType.donation,
  };

  String get offeringType => _offeringTypeCode[validate()]?.typeName ?? "";
}

List<NavbarItemModel> navbarItems = [
  const NavbarItemModel("Home", Assets.iconsHome),
  const NavbarItemModel("History", Assets.iconsMoney)
];

class NavbarItemModel {
  final String label;
  final String icon;

  const NavbarItemModel(this.label, this.icon);
}
