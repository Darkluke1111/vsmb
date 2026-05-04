#!/bin/sh

cd ${VINTAGE_STORY}

wget -q "${STABLE_URL}${INPUT_VS_VERSION}.tar.gz"
tar xzf vs_server_linux-x64_${INPUT_VS_VERSION}.tar.gz
rm vs_server_linux-x64_${INPUT_VS_VERSION}.tar.gz

cd /github/workspace

dotnet run --project ./ZZCakeBuild/CakeBuild.csproj -- "$@"

for file in Releases/*.zip; do
    echo "RESULT=$file" >> ${GITHUB_ENV} 
done

MOD_VERSION= find . -name modinfo.json | xargs cat | jq -r '.version'
echo "MOD_VERSION=$MOD_VERSION" >> ${GITHUB_ENV}



