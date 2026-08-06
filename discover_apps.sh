#!/bin/bash
# discover_apps.sh

APPS=()

while IFS= read -r pubspec; do
  if grep -q "^flutter:" "$pubspec"; then
    dir=$(dirname "$pubspec")
    dir=${dir#./}
    if [ -z "$dir" ]; then
      dir="."
    fi
    APPS+=("$dir")
  fi
done < <(find . -name "pubspec.yaml" -not -path "*/.symlinks/*" -not -path "*/example/*")

# Convert array to JSON array
if command -v jq &> /dev/null; then
  JSON_ARRAY=$(printf '%s\n' "${APPS[@]}" | jq -R . | jq -s -c .)
else
  # Fallback manual JSON array creation if jq is not available
  JSON_ARRAY="["
  for i in "${!APPS[@]}"; do
    JSON_ARRAY+="\"${APPS[$i]}\""
    if [ $i -lt $((${#APPS[@]}-1)) ]; then
      JSON_ARRAY+=","
    fi
  done
  JSON_ARRAY+="]"
fi

echo "matrix=$JSON_ARRAY" >> "$GITHUB_OUTPUT"
echo "Discovered apps: $JSON_ARRAY"
