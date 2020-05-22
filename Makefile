regenerate:
	mkdir -p lib/gen	
	(protoc  \
	-I=../ \
	-I=../go-micro/services \
	-I=${GOPATH}/src \
	-I=./pb \
	--dart_out=grpc:./lib/gen \
	google/protobuf/timestamp.proto \
	common/timestamp/timestamp.proto \
	chains/chain/chain.proto \
	pb/*.proto \
	--plugin "pub run protoc_plugin" )

	#flutter packages pub run build_runner build --delete-conflicting-outputs
	#cargo/build.sh
