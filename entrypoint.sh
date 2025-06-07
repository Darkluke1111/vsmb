#!/bin/sh

cd ${VINTAGE_STORY}

wget -q "${STABLE_URL}${VS_VERSION}.tar.gz"
tar xzf vs_server_linux-x64_${VS_VERSION}.tar.gz
rm vs_server_linux-x64_${VS_VERSION}.tar.gz

cd /github/workspace
for filename in *; do
    dotnet run --project ./${filename}/ZZCakeBuild/CakeBuild.csproj -- "$@"
done