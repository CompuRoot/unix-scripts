#!/bin/sh

timer="${1}"
[ -z "${timer}" ] && {
  printf "\n\nUsage:\n %s dd-hh-mm-ss [0|1]\n\twhere dd-hh-mm-ss - is countdown timer" "${0}"
  printf "\n\t(dd,hh,mm,ss - must be positive integers)."
  printf "\n\tIf optional second parameter is zero, then use regular font, otherwise - figlet\n"

  printf '\n\tRight side of timer, like hh, mm, ss can be omitted'
  printf '\n\tthen most significatnt value of timer will be used.\n'
  exit 1
}

bigfont=${2:-0}  # 1 for Yes 0 - for No (default)
is_figlet=$(command -v figlet)
if [ -z "${is_figlet}" ] && [ ${bigfont} -ne 0 ]; then
  echo "To use big fonts, install 'figlet' first."
  echo "Use ${0} with second parameter set to 1."
  echo "exiting..."
  exit 1
fi

sec2dhms() {
  local ts=$1
  local d=$((ts/60/60/24))
  local h=$((ts/60/60%24))
  local m=$((ts/60%60))
  local s=$((ts%60))
  printf '%02dd-%02dh-%02dm-%02ds' ${d} ${h} ${m} ${s}
}

days=$(   echo -n "${timer}" | awk -F'[-]' '{print $1}')
hours=$(  echo -n "${timer}" | awk -F'[-]' '{print $2}')
minutes=$(echo -n "${timer}" | awk -F'[-]' '{print $3}')
seconds=$(echo -n "${timer}" | awk -F'[-]' '{print $4}')

for s in ${days} ${hours} ${minutes} ${seconds}; do
  case $s in
    ''|*[!0-9]*) printf "\n'%s' - is not a number ! Exiting...\n" "${s}"; exit 1;;
  esac
done

counter=$(((days*60*60*24)+(hours*60*60)+(minutes*60)+seconds));

clear
printf "\n\n\n\n\n"
while [ ${counter} -ne 0 ]; do
  out=$(sec2dhms ${counter})
  [ ${bigfont} -ne 0 ] && figlet "   ${out}" || echo "  ${out}"
  sleep 1
  counter=$((counter-1))
  clear
  printf "\n\n\n\n\n"
done

out=$(sec2dhms ${counter})
[ ${bigfont} -ne 0 ] && figlet "   ${out}" || echo "  ${out}"

