#!/bin/sh

cd ${VINTAGE_STORY}

wget -q "${STABLE_URL}${INPUT_VS_VERSION}.tar.gz"
tar xzf vs_server_linux-x64_${INPUT_VS_VERSION}.tar.gz
rm vs_server_linux-x64_${INPUT_VS_VERSION}.tar.gz

cd /github/workspace

dotnet run --project ./${filename}/ZZCakeBuild/CakeBuild.csproj -- "$@"

for file in Releases/*.zip; do
    echo "RESULT=$file" >> ${GITHUB_ENV} 
done


