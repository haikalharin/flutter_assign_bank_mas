import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:flutter_assigment_bank_mas/core/network/api_result.dart';
import 'package:flutter_assigment_bank_mas/data/models/landing_page_model/landing_page_model.dart';
import 'package:flutter_assigment_bank_mas/data/models/response_model/response_model.dart';
import 'package:flutter_assigment_bank_mas/data/repository/landing_page_repository.dart';
import 'package:flutter_assigment_bank_mas/main.dart';
import 'package:flutter_assigment_bank_mas/screens/landing_page/bloc/landing_page_bloc.dart';
import 'package:mockito/mockito.dart';

var dataException = null;

List<Item> articleItems = [
  Item(
      articleTitle: "Perbedaan Tabungan dan Deposito",
      articleImage:
          "https://bankmas.co.id/_next/image/?url=https%3A%2F%2Fbankmas.co.id%2Fcms%2Fstorage%2Fapp%2Fmedia%2Fblog-berita%2Fperbedaan-tabundan-dan-deposito-1200x628.jpg&w=3840&q=75",
      link: "https://bankmas.co.id/id/blog/perbedaan-tabungan-dan-deposito/"),
  Item(
      articleTitle:
          "Aman bertransaksi dengan mengenali modus penipuan skimming",
      articleImage:
          "https://bankmas.co.id/_next/image/?url=https%3A%2F%2Fbankmas.co.id%2Fcms%2Fstorage%2Fapp%2Fmedia%2Fblog-berita%2F3c8f774e888da795746affe50ed0e80b.png&w=3840&q=75",
      link:
          "https://bankmas.co.id/id/blog/aman-bertransaksi-dengan-mengenali-modus-penipuan-skimming/"),
  // Add more items as needed
];

// Creating items for the products section
List<Item> productItems = [
  Item(
      productName: "Transfer",
      productImage: "https://img.icons8.com/color/money-transfer.png",
      link: "https://bankmas.co.id/id/produk-layanan/masmobile/"),
  Item(
      productName: "Pembayaran",
      productImage: "https://img.icons8.com/color/check--v1.png",
      link: "https://bankmas.co.id/id/produk-layanan/masmobile/"),
  // Add more items as needed
];

// Creating a datum for the articles section
Datum articlesDatum = Datum(
  section: "articles",
  sectionTitle: "Our Blog",
  items: articleItems,
);

// Creating a datum for the products section
Datum productsDatum = Datum(
  section: "products",
  items: productItems,
);

// Creating the LandingPageModel
LandingPageModel landingPageModel = LandingPageModel(
  data: [articlesDatum, productsDatum],
);

ResponseModel<LandingPageModel> responseModel =
    ResponseModel(data: landingPageModel);

class LandingPageMockRepository extends Mock implements LandingPageRepository {
  @override
  Future<ApiResult<ResponseModel<LandingPageModel>>> getData() async {
    return ApiResult.success(responseModel);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('check_Article_bloc', () {
    LandingPageRepository? repository;
    LandingPageBloc bloc =
        LandingPageBloc(landingPageRepository: LandingPageMockRepository());
    LandingPageState state = LandingPageState();
    LandingPageModel landingPageModelData = LandingPageModel();
    Datum gridView = Datum();
    Datum listView = Datum();
    var id = 437049,
        submitStatusInProgress = FormzSubmissionStatus.initial,
        submitStatusSuccess = FormzSubmissionStatus.initial;
    setUp(() async {
      repository = LandingPageMockRepository();
      bloc = LandingPageBloc(
          landingPageRepository: repository ?? LandingPageMockRepository());
    });

    blocTest("_mapArticleFetchEventToState",
        wait: const Duration(seconds: 5),
        build: () {
          submitStatusInProgress = FormzSubmissionStatus.inProgress;
          submitStatusSuccess = FormzSubmissionStatus.success;
          landingPageModelData = landingPageModel;
          if ((landingPageModelData.data ?? []).isNotEmpty) {
            landingPageModelData.data?.forEach((element) {
              if ((element.section ?? '').contains("articles")) {
                listView = element;
              } else {
                gridView = element;
              }
            });
          }
          return bloc;
        },
        act: (bloc) {
          bloc.add(FetchDataEvent());
        },
        expect: () => [
              state.copyWith(submitStatus: submitStatusInProgress),
              state.copyWith(
                submitStatus: submitStatusSuccess,
                gridView: gridView,
                listView: listView,
                landingPageModel: landingPageModelData,
              )
            ]);
  });
}
