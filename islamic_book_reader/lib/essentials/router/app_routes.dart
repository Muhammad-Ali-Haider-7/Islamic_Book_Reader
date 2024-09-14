enum AppRoutes{
  landing,
  addMore,
  setting,
  reading,
  info
}

const Map<AppRoutes, String> routeMap = {
  AppRoutes.landing: "/",
  AppRoutes.info: "info",
  AppRoutes.reading:"reading",
  AppRoutes.setting:"setting",
  AppRoutes.addMore: "addMore",
};