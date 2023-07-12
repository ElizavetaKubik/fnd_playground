part of 'crypto_coin_details_bloc.dart';

abstract class CryptoCoinDetailsState extends Equatable {
  const CryptoCoinDetailsState();

  @override
  List<Object> get props => [];
}

class CryptoCoinDetailsInitial extends CryptoCoinDetailsState {
  const CryptoCoinDetailsInitial();
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoading();
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoaded({
    required this.coinDetails,
  });

  final CryptoCoinDetails coinDetails;

  @override
  List<Object> get props => [coinDetails];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState {
  const CryptoCoinDetailsLoadingFailure({
    required this.extencion,
  });

  final Object extencion;

  @override
  List<Object> get props => super.props..add(extencion);
}
