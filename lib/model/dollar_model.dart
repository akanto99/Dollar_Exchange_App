class Country {
  int id;
  String name;
  String code;
  String image;
  List<CurrencyDetails> currencyDetails;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.currencyDetails,
  });
}

class CurrencyDetails {
  String serviceId;
  String serviceName;
  int countryTableId;
  double finalRate;
  double manualRate;
  String currency;
  int currencyId;
  int maximumLimit;
  int minimumLimit;

  CurrencyDetails({
    required this.serviceId,
    required this.serviceName,
    required this.countryTableId,
    required this.finalRate,
    required this.manualRate,
    required this.currency,
    required this.currencyId,
    required this.maximumLimit,
    required this.minimumLimit,


  });
}

List<Country> countryList = [
  Country(
    id: 1,
    name: "TANZANIA, UNITED REPUBLIC OF (TZS)",
    code: "TZS",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6347faed94d991665661677.jpg",
    currencyDetails: [
      CurrencyDetails(
        serviceId: "3",
        serviceName: "Bank Transfer",
        countryTableId: 16,
        finalRate: 3.0279,
        manualRate: 0,
        currency: "TZS",
        currencyId: 16,
        maximumLimit: 30000,
        minimumLimit: 1,

      ),
    ],
  ),
  Country(
    id: 2,
    name: "Nepal",
    code: "NPR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/632bd789423571663817609.png",
    currencyDetails: [
      CurrencyDetails(
        serviceId: "4",
        serviceName: "Cash Pickup",
        countryTableId: 17,
        finalRate: 87.1337,
        manualRate: 0,
        currency: "NPR",
        currencyId: 17,
        maximumLimit: 100000,
        minimumLimit: 100,

      ),
      CurrencyDetails(
        serviceId: "3",
        serviceName: "Bank Transfer",
        countryTableId: 17,
        finalRate: 87.1337,
        manualRate: 0,
        currency: "NPR",
        currencyId: 17,
        maximumLimit: 1000000,
        minimumLimit: 100,

      ),
    ],
  ),
  Country(
    id: 3,
    name: "New Zealand",
    code: "NZD",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6347f9f55fd9e1665661429.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 18,
          finalRate: 1.1129,
          manualRate: 0,
          currency: "NZD",
          currencyId: 18,
          maximumLimit: 15000,
          minimumLimit: 1
      ),
    ],
  ),


  Country(
    id: 4,
    name: "South Korea",
    code: "KRW",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6347f96090ebe1665661280.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 19,
          finalRate: 911.1229,
          manualRate: 0,
          currency: "KRW",
          currencyId: 19,
          maximumLimit: 5000000,
          minimumLimit: 1
      ),
    ],
  ),

  Country(
    id: 5,
    name: "Sri Lanka",
    code: "LKR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/634800f252a631665663218.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 20,
          finalRate: 244.5983,
          manualRate: 0,
          currency: "LKR",
          currencyId: 20,
          maximumLimit: 500000,
          minimumLimit: 1

      ),
      CurrencyDetails(
          serviceId: "4",
          serviceName: "Cash Pickup",
          countryTableId: 20,
          finalRate: 244.5983,
          manualRate: 0,
          currency: "LKR",
          currencyId: 20,
          maximumLimit: 500000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 6,
    name: "Uganda",
    code: "UGX",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635381494fffa1666416969.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 21,
          finalRate: 2416.5093,
          manualRate: 0,
          currency: "UGX",
          currencyId: 21,
          maximumLimit: 20000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 7,
    name: "VIETNAM",
    code: "VND",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6347fc51ca1e51665662033.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 22,
          finalRate: 15998.4004,
          manualRate: 0,
          currency: "VND",
          currencyId: 22,
          maximumLimit: 300000000,
          minimumLimit: 1

      ),
      CurrencyDetails(
          serviceId: "4",
          serviceName: "Cash Pickup",
          countryTableId: 22,
          finalRate: 15998.4004,
          manualRate: 0,
          currency: "VND",
          currencyId: 22,
          maximumLimit: 300000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 23,
    name: "Afghanistan",
    code: "AFN",
    image: "https://remit.daneshexchange.com/assets/uploads/country/63299871439a11663670385.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "4",
          serviceName: "Cash Pickup",
          countryTableId: 23,
          finalRate: 56.8,
          manualRate: 56.8,
          currency: "AFN",
          currencyId: 23,
          maximumLimit: 500000,
          minimumLimit: 1
      ),
      CurrencyDetails(
          serviceId: "4",
          serviceName: "Cash Pickup",
          countryTableId: 23,
          finalRate: 0.65,
          manualRate: 0.65,
          currency: "USD",
          currencyId: 13,
          maximumLimit: 1000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 24,
    name: "CAMBODIA",
    code: "KHR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/63466979c15671665558905.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 24,
          finalRate: 2693.3008,
          manualRate: 0,
          currency: "KHR",
          currencyId: 24,
          maximumLimit: 10000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 31,
    name: "Belgium",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635394582cdbf1666421848.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 31,
          finalRate: 0.5854,
          manualRate: 0,
          currency: "EUR",
          currencyId: 31,
          maximumLimit: 10000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 32,
    name: "Brazil",
    code: "BRL",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6360aaccccada1667279564.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 32,
          finalRate: 3.1791,
          manualRate: 0,
          currency: "BRL",
          currencyId: 32,
          maximumLimit: 15000,
          minimumLimit: 1
      ),
    ],
  ),

  Country(
    id: 39,
    name: "Finland",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635395aa66bab1666422186.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 39,
          finalRate: 0.5794,
          manualRate: 0,
          currency: "EUR",
          currencyId: 39,
          maximumLimit: 10000,
          minimumLimit: 1
      ),
    ],
  ),

  Country(
    id: 41,
    name: "Germany",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635396ff4bef11666422527.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 41,
          finalRate: 0.5914,
          manualRate: 0,
          currency: "EUR",
          currencyId: 41,
          maximumLimit: 10000,
          minimumLimit: 1
      ),
    ],
  ),


  Country(
    id: 46,
    name: "Kenya",
    code: "KES",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6360a8b36a4111667279027.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 46,
          finalRate: 77.3768,
          manualRate: 0,
          currency: "KES",
          currencyId: 46,
          maximumLimit: 60000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 54,
    name: "Myanmar",
    code: "MMK",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6360a993077451667279251.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 54,
          finalRate: 1364.6995,
          manualRate: 0,
          currency: "MMK",
          currencyId: 54,
          maximumLimit: 13000000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 55,
    name: "Netherlands",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6353996620d131666423142.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 55,
          finalRate: 0.5854,
          manualRate: 0,
          currency: "EUR",
          currencyId: 55,
          maximumLimit: 10000,
          minimumLimit: 1

      ),
    ],
  ),

  Country(
    id: 58,
    name: "Portugal",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635391e4439261666421220.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 58,
          finalRate: 0.5794,
          manualRate: 0,
          currency: "EUR",
          currencyId: 58,
          maximumLimit: 10000,
          minimumLimit: 1

      ),
    ],
  ),


  Country(
    id: 64,
    name: "Spain",
    code: "EUR",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635398cb754ec1666422987.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 64,
          finalRate: 0.5794,
          manualRate: 0,
          currency: "EUR",
          currencyId: 64,
          maximumLimit: 10000,
          minimumLimit: 1
      ),

    ],
  ),

  Country(
    id: 68,
    name: "Egypt",
    code: "EGP",
    image: "https://remit.daneshexchange.com/assets/uploads/country/635f6bb68b15f1667197878.png",

    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 68,
          finalRate: 20.1276,
          manualRate: 0,
          currency: "EGP",
          currencyId: 68,
          maximumLimit: 110000,
          minimumLimit: 1
      ),

    ],
  ),
  Country(
    id: 69,
    name: "UNITED ARAB EMIRATES",
    code: "AED",
    image: "https://remit.daneshexchange.com/assets/uploads/country/6360819a30cda1667269018.png",
    currencyDetails: [
      CurrencyDetails(
          serviceId: "3",
          serviceName: "Bank Transfer",
          countryTableId: 69,
          finalRate: 2.3242,
          manualRate: 0,
          currency: "AED",
          currencyId: 69,
          maximumLimit: 50000,
          minimumLimit: 1
      ),
    ],
  ),
];
