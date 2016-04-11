#!/bin/bash
pushd interface-src/distributed-file-system/
electrify package
popd
./package-interface.sh
rm -rf interface
rm -f app
./unpack-interface.sh