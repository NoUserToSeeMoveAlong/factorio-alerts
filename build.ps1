# Builds the mod using my modbuilder container

$CURRENT_DIR="$($(pwd).ToString())"

$output=".\output"
if($args.Contains("-o")) {
    $outputbase=$args[ [array]::indexof($args, "-o") +1 ]
    $output=${outputbase}
}

$output = Resolve-Path $output

if(!(test-path $output)) {
    New-Item -ItemType Directory -Force -Path $output
}

echo "Mod will be placed in ${output}"

if($args.Contains("-zip")){
    docker run --rm -it -v "${CURRENT_DIR}\src:/code" -v "${output}:/target" --env-file=settings.env -e BUILD_ZIP=1 asmnh/factorio-modbuilder
} else {
    docker run --rm -it -v "${CURRENT_DIR}\src:/code" -v "${output}:/target" --env-file=settings.env asmnh/factorio-modbuilder
}
