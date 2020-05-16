regenerate:
	mkdir -p lib/gen
	(protoc  \
	--dart_out=./lib/gen \
	cargo/protos/coin.proto \
	--plugin "pub run protoc_plugin" )
	
	(protoc  \
	-I=../ \
	--dart_out=grpc:./lib/gen \
	go-micro/services/chains/chain/chain.proto \
	--plugin "pub run protoc_plugin" )

	#flutter packages pub run build_runner build --delete-conflicting-outputs
	#cargo/build.sh
