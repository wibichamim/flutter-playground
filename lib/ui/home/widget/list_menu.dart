import 'package:flutter_playground/core/data/model/menu.dart';
import 'package:flutter_playground/gen/assets.gen.dart';

List<HomePageMenu> get listMenu {
  return [
    HomePageMenu(
      icon: Assets.images.illMenuVisitPlan.image(),
      label: 'Visit Plan',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illVisitData.image(),
      label: 'Visit Data',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuActionPlan.image(),
      label: 'Action Plan',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuPopulasi.image(),
      label: 'Populasi',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuBp.image(),
      label: 'Bussiness Partner',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuContact.image(),
      label: 'Contact',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuQuotation.image(),
      label: 'Quotation',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuCatalogVideo.image(),
      label: 'Catalog Video',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuSalesHistory.image(),
      label: 'Sales History',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuCheckIventory.image(),
      label: 'Check Inventory',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuRto.image(),
      label: 'RTO',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuExpenses.image(),
      label: 'Expenses',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuReport.image(),
      label: 'Report',
      page: 'VisitPlan',
    ),
    HomePageMenu(
      icon: Assets.images.illMenuTarget.image(),
      label: 'Target',
      page: 'VisitPlan',
    )
  ];
}
