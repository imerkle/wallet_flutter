regenerate:
	mkdir -p lib/gen
	(protoc  \
	-I=./pb \
	--dart_out=./lib/gen \
	pb/*.proto \
	--plugin "pub run protoc_plugin" )
	
	(protoc  \
	-I=../ \
	-I=${GOPATH}/src \
	--dart_out=grpc:./lib/gen \
	go-micro/services/common/timestamp/timestamp.proto \
	--plugin "pub run protoc_plugin" )

	(protoc  \
	-I=../ \
	-I=../go-micro/services \
	-I=${GOPATH}/src \
	--dart_out=grpc:./lib/gen \
	go-micro/services/chains/chain/chain.proto \
	--plugin "pub run protoc_plugin" )

	#flutter packages pub run build_runner build --delete-conflicting-outputs
	#cargo/build.sh
