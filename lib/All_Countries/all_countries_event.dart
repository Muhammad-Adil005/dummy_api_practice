abstract class AllCountriesEvent {}

class CallAllCountriesApi extends AllCountriesEvent {}

class CallAllStatesApi extends AllCountriesEvent {
  final String iso2;
  CallAllStatesApi(this.iso2);
}

class CallStatesDetailsApi extends AllCountriesEvent {
  final String iso2;
  final String province;
  CallStatesDetailsApi(this.iso2, this.province);
}
