if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "DON'T RUN THIS FILE! cd to repository root path and source this file."
else
  hugo -d ./docs
  git add *
  git commit 
  git push
fi
